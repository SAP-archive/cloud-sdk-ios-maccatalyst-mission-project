//
// TutorialApp
//
// Created by SAP BTP SDK Assistant for iOS v7.0.0 application on 04/01/22
//

import SAPCommon
import SAPFiori
import SAPFioriFlows
import SAPFoundation

import SharedFmwk

// custom data handling of the application
open class ApplicationOnboardingSession: OnboardingSession {
    var odataControllers: [String: ODataControlling]

    public required init(flow: OnboardingFlow) {
        guard let step = flow.steps.first(where: { $0 is ODataOnboardingStep }) as? ODataOnboardingStep else {
            fatalError("ODataOnboardingStep is missing.")
        }
        guard !step.controllers.isEmpty else {
            fatalError("Controllers are missing for ODataOnboardingStep.")
        }
        odataControllers = step.controllers

        super.init(flow: flow)
    }
}

public class OnboardingErrorHandler: OnboardingControllerDelegate {
    // MARK: – Init

    public init() {}

    // MARK: - OnboardingControllerDelegate

    /// Application specific error handling
    public func onboardingController(_ controller: OnboardingControlling, didFail flow: OnboardingFlow, with error: Error, completionHandler: @escaping (OnboardingErrorDisposition) -> Void) {
        switch flow.flowType {
        case .onboard:
            onboardFailed(with: error, completionHandler: completionHandler)
        case .restore:
            restoreFailed(with: error, controller: controller, onboardingID: flow.context.onboardingID, completionHandler: completionHandler)
        default:
            completionHandler(.retry)
        }
    }

    /// Onboarding error handling can be customized here
    public func handleOnboardingError(_ error: Error) {
        switch error {
        case WelcomeScreenError.demoModeRequested:
            AppDelegate.shared.startDemoMode()
        default:
            // An error here means a critical error – the `OnboardingErrorHandler` responded with OnboardingDisposition.stop to stop the onboarding.
            DispatchQueue.main.async {
                AppDelegate.shared.onboardUser()
            }
        }
    }

    /// Unlocking error handling can be customized here
    public func handleUnlockingError(_ error: Error) {
        switch error {
        // We reset the OnboardingSessionManager if the user has chosen to reset their passcode
        case StoreManagerError.resetPasscode, OnboardingError.cancelled:
            resetOnboardingSessionManager()
        // We reset the OnboardingSessionManager if the user has exceeded the maximum retry limit
        case StoreManagerError.passcodeRetryLimitReached:
            let alertController = UIAlertController(title: LocalizedStrings.Onboarding.passcodeRetryLimitReachedTitle, message: LocalizedStrings.Onboarding.passcodeRetryLimitReachedMessage, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: LocalizedStrings.Onboarding.resetTitle, style: .destructive) { _ in
                self.resetOnboardingSessionManager()
            })

            DispatchQueue.main.async {
                guard let topViewController = ModalUIViewControllerPresenter.topPresentedViewController() else {
                    fatalError("Invalid UI state")
                }
                topViewController.present(alertController, animated: true)
            }
        default:
            return
        }
    }

    // MARK: - Private

    /// Onboarding related error handling
    private func onboardFailed(with error: Error, completionHandler: @escaping (OnboardingErrorDisposition) -> Void) {
        switch error {
        case WelcomeScreenError.demoModeRequested:
            completionHandler(.stop(error))
            return
        case ApplicationVersioningError.inactive:
            showAlertWith(error: error)
        default:
            showAlertWith(error: error)
        }

        func showAlertWith(error: Error) {
            let alertController = UIAlertController(
                title: LocalizedStrings.Onboarding.failedToLogonTitle,
                message: error.localizedDescription,
                preferredStyle: .alert
            )
            alertController.addAction(UIAlertAction(title: LocalizedStrings.Onboarding.retryTitle, style: .default) { _ in
                completionHandler(.retry)
            })

            DispatchQueue.main.async {
                guard let topViewController = ModalUIViewControllerPresenter.topPresentedViewController() else {
                    fatalError("Invalid UI state")
                }
                topViewController.present(alertController, animated: true)
            }
        }
    }

    /// Restoring related error handling
    private func restoreFailed(with error: Error, controller: OnboardingControlling, onboardingID: UUID?, completionHandler: @escaping (OnboardingErrorDisposition) -> Void) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .alert)

        switch error {
        case StoreManagerError.cancelPasscodeEntry, StoreManagerError.skipPasscodeSetup, StoreManagerError.resetPasscode:
            resetOnboarding(onboardingID, controller: controller, completionHandler: completionHandler)
            return
        case StoreManagerError.passcodeRetryLimitReached:
            alertController.title = LocalizedStrings.Onboarding.passcodeRetryLimitReachedTitle
            alertController.message = LocalizedStrings.Onboarding.passcodeRetryLimitReachedMessage
        case ApplicationVersioningError.inactive:
            alertController.title = LocalizedStrings.Onboarding.failedToLogonTitle
            alertController.message = error.localizedDescription
            alertController.addAction(UIAlertAction(title: LocalizedStrings.Onboarding.retryTitle, style: .default) { _ in
                completionHandler(.retry)
            })
        default:
            alertController.title = LocalizedStrings.Onboarding.failedToLogonTitle
            alertController.message = error.localizedDescription
            alertController.addAction(UIAlertAction(title: LocalizedStrings.Onboarding.retryTitle, style: .default) { _ in
                completionHandler(.retry)
            })
        }

        alertController.addAction(UIAlertAction(title: LocalizedStrings.Onboarding.resetTitle, style: .destructive) { _ in
            self.resetOnboarding(onboardingID, controller: controller, completionHandler: completionHandler)
        })

        DispatchQueue.main.async {
            guard let topViewController = ModalUIViewControllerPresenter.topPresentedViewController() else {
                fatalError("Invalid UI state")
            }
            topViewController.present(alertController, animated: true)
        }
    }

    /// Reset onboarding, then start a new onboarding flow
    private func resetOnboarding(_ onboardingID: UUID?, controller: OnboardingControlling, completionHandler: @escaping (OnboardingErrorDisposition) -> Void) {
        guard let onboardingID = onboardingID else {
            completionHandler(.retry)
            return
        }

        (controller as? OnboardingController)?.resetFlow(for: onboardingID) { _ in
            completionHandler(.retry)
        }
    }

    // Private function that resets the OnboardingSessionManager
    private func resetOnboardingSessionManager() {
        OnboardingSessionManager.shared.removeSession { _ in
            DispatchQueue.main.async {
                let applicationUIManager = OnboardingSessionManager.shared.presentationDelegate as? ApplicationUIManager
                applicationUIManager?.releaseRootFromMemory()
                OnboardingSessionManager.shared.open { _ in }
            }
        }
    }
}
