//
// TutorialApp
//
// Created by SAP BTP SDK Assistant for iOS application on 08/09/21
//

import SAPCommon
import SAPFiori
import SAPFioriFlows
import SAPFoundation

class ApplicationUIManager: ApplicationUIManaging {
    // MARK: – Properties

    let window: UIWindow
    var isOnboarding = false

    /// Save ViewController while splash/onboarding screens are presented
    private var _savedApplicationRootViewController: UIViewController?
    private var coveringViews = [UIView]()

    // MARK: – Init

    public init(window: UIWindow) {
        self.window = window
    }

    // MARK: - ApplicationUIManaging

    func hideApplicationScreen(completionHandler: @escaping (Error?) -> Void) {
        // Check whether the covering screen is already presented or not
        guard isSplashPresented == false else {
            completionHandler(nil)
            return
        }

        self.saveApplicationScreenIfNecessary()
        self.coverAppScreen(with: UIViewController().view)

        completionHandler(nil)
    }

    func showSplashScreenForOnboarding(completionHandler: @escaping (Error?) -> Void) {
        // splash already presented
        guard isSplashPresented == false else {
            completionHandler(nil)
            return
        }

        setupSplashScreen()

        completionHandler(nil)
    }

    func showSplashScreenForUnlock(completionHandler: @escaping (Error?) -> Void) {
        guard isSplashPresented == false else {
            completionHandler(nil)
            return
        }

        self.saveApplicationScreenIfNecessary()

        setupSplashScreen()

        completionHandler(nil)
    }

    func showApplicationScreen(completionHandler: @escaping (Error?) -> Void) {
        // Check if an application screen has already been presented
        guard self.isSplashPresented else {
            completionHandler(nil)
            return
        }

        // Restore the saved application screen or create a new one
        let appViewController: UIViewController
        if let savedViewController = self._savedApplicationRootViewController {
            appViewController = savedViewController
        } else {
            #if targetEnvironment(macCatalyst)
            let splitViewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateInitialViewController() as! UISplitViewController
            
            splitViewController.modalPresentationStyle = .currentContext
            splitViewController.preferredDisplayMode = .allVisible
            appViewController = splitViewController
            
            // If running on iOS show the OverviewTableViewController
            #else
            let overviewTVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "OverviewTableViewController") as! OverviewTableViewController
            appViewController = overviewTVC
            #endif
        }

        // set rootViewController only once ie after onboarding when app screen is about to be shown
        // for restore, remove covering views previously added
        if isOnboarding {
            isOnboarding = false
            coveringViews.removeAll()

            // maintain this boolean since no splash screen is present now
            isSplashPresented = false
            window.rootViewController = appViewController
        } else {
            removeCoveringViews()
        }

        _savedApplicationRootViewController = nil

        completionHandler(nil)
    }

    func releaseRootFromMemory() {
        self._savedApplicationRootViewController = nil
    }

    // MARK: – Helpers

    private var isSplashPresented: Bool = false

    /// Helper method to capture the real application screen.
    private func saveApplicationScreenIfNecessary() {
        if self._savedApplicationRootViewController == nil, !self.isSplashPresented {
            self._savedApplicationRootViewController = self.window.rootViewController
        }
    }

    private func setupSplashScreen() {
        let splashViewController = FUIInfoViewController.createSplashScreenInstanceFromStoryboard()
        coverAppScreen(with: splashViewController.view)

        // Set the splash screen for the specific presenter
        let modalPresenter = OnboardingFlowProvider.modalUIViewControllerPresenter
        modalPresenter.setSplashScreen(splashViewController)
        modalPresenter.animated = true
    }

    // Hide the application screen by adding a view to the top
    private func coverAppScreen(with view: UIView?) {
        guard let view = view else {
            return
        }
        // always hide the topViewController's screen
        if let rootVc = UIApplication.shared.topViewController() {
            view.frame = rootVc.view.bounds
            rootVc.view.addSubview(view)
            coveringViews.append(view)
            isSplashPresented = true
        }
    }

    // Remove covering views when no more required
    private func removeCoveringViews() {
        _ = coveringViews.map { $0.removeFromSuperview() }
        isSplashPresented = false
    }
}

extension UIApplication {
    // Iterate through VC hierarchy up to the top most
    func topViewController(base: UIViewController? = UIApplication.shared.windows.first { $0.isKeyWindow }?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController,
            let selected = tab.selectedViewController {
            return topViewController(base: selected)
        }
        if let split = base as? UISplitViewController {
            if UIDevice.current.userInterfaceIdiom == .pad {
                return split
            }
            let vc = split.viewControllers.first
            return topViewController(base: vc)
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}
