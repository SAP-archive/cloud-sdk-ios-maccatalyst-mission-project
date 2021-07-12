//
// TutorialApp
//
// Created by SAP BTP SDK Assistant for iOS application on 12/07/21
//

import SAPCommon
import SAPFiori
import SAPFioriFlows
import SAPFoundation
import WebKit

import SharedFmwk

public class OnboardingFlowProvider: OnboardingFlowProviding {
    // MARK: – Properties

    public static let modalUIViewControllerPresenter = ModalUIViewControllerPresenter()

    // MARK: – Init

    public init() {}

    // MARK: – OnboardingFlowProvider

    public func flow(for _: OnboardingControlling, flowType: OnboardingFlow.FlowType, completionHandler: @escaping (OnboardingFlow?, Error?) -> Void) {
        switch flowType {
        case .onboard:
            completionHandler(self.onboardingFlow(), nil)
        case let .restore(onboardingID):
            completionHandler(self.restoringFlow(for: onboardingID), nil)
        case let .background(onboardingID):
            completionHandler(self.backgroundFlow(for: onboardingID), nil)
        case let .reset(onboardingID):
            completionHandler(self.resettingFlow(for: onboardingID), nil)
        @unknown default:
            break
        }
    }

    // MARK: – Internal

    func onboardingFlow() -> OnboardingFlow {
        let steps = self.onboardingSteps
        let context = OnboardingContext(presentationDelegate: OnboardingFlowProvider.modalUIViewControllerPresenter)
        let flow = OnboardingFlow(flowType: .onboard, context: context, steps: steps)
        return flow
    }

    func restoringFlow(for onboardingID: UUID) -> OnboardingFlow {
        let steps = self.restoringSteps
        var context = OnboardingContext(onboardingID: onboardingID, presentationDelegate: OnboardingFlowProvider.modalUIViewControllerPresenter)
        context.onboardingID = onboardingID
        let flow = OnboardingFlow(flowType: .restore(onboardingID: onboardingID), context: context, steps: steps)
        return flow
    }

    func backgroundFlow(for onboardingID: UUID) -> OnboardingFlow {
        let steps = self.backgroundSteps
        var context = OnboardingContext(onboardingID: onboardingID, presentationDelegate: OnboardingFlowProvider.modalUIViewControllerPresenter)
        context.onboardingID = onboardingID
        let flow = OnboardingFlow(flowType: .background(onboardingID: onboardingID), context: context, steps: steps)
        return flow
    }

    func resettingFlow(for onboardingID: UUID) -> OnboardingFlow {
        let steps = self.resettingSteps
        var context = OnboardingContext(onboardingID: onboardingID, presentationDelegate: OnboardingFlowProvider.modalUIViewControllerPresenter)
        context.onboardingID = onboardingID
        let flow = OnboardingFlow(flowType: .reset(onboardingID: onboardingID), context: context, steps: steps)
        return flow
    }

    func getAPIKeyAuthenticationConfig() -> APIKeyAuthenticationConfig? {
        let obfuscator: Obfuscating = Obfuscator()
        let key = obfuscator.deobfuscate([82, 3, 95, 83, 64, 15, 77, 103, 76, 84, 18, 84, 84, 75, 85, 23, 14, 17, 126, 89, 93, 69, 6, 72, 81, 85, 65, 94, 77, 103, 0, 93, 70, 92, 80, 85])
        return APIKeyAuthenticationConfig(apikeys: [key], isAPIKeyAccessOnly: false, allowAnonymousAccessFlag: true)
    }

    // MARK: - Steps

    public var onboardingSteps: [OnboardingStep] {
        return [
            self.configuredWelcomeScreenStep(),
            CompositeStep(steps: SAPcpmsDefaultSteps.configuration),
            OAuth2AuthenticationStep(presenter: FioriASWebAuthenticationSessionPresenter()),
            CompositeStep(steps: SAPcpmsDefaultSteps.settingsDownload),
            CompositeStep(steps: SAPcpmsDefaultSteps.applyDuringOnboard),
            self.configuredUserConsentStep(),
            self.configuredDataCollectionConsentStep(),
            self.configuredStoreManagerStep(),
            AuxiliaryCommunicationStep(),
            ODataOnboardingStep(),
        ]
    }

    public var restoringSteps: [OnboardingStep] {
        return [
            self.configuredStoreManagerStep(),
            self.configuredWelcomeScreenStep(),
            CompositeStep(steps: SAPcpmsDefaultSteps.configuration),
            OAuth2AuthenticationStep(presenter: FioriASWebAuthenticationSessionPresenter()),
            CompositeStep(steps: SAPcpmsDefaultSteps.settingsDownload),
            CompositeStep(steps: SAPcpmsDefaultSteps.applyDuringRestore),
            self.configuredDataCollectionConsentStep(),
            ODataOnboardingStep(),
        ]
    }

    public var backgroundSteps: [OnboardingStep] {
        return [
            self.configuredStoreManagerStep(),
            self.configuredWelcomeScreenStep(),
            CompositeStep(steps: SAPcpmsDefaultSteps.configuration),
            OAuth2AuthenticationStep(presenter: FioriASWebAuthenticationSessionPresenter()),
            AuxiliaryCommunicationStep(),
        ]
    }

    public var offlineSyncingSteps: [OnboardingStep] {
        return [
            self.configuredWelcomeScreenStep(),
            CompositeStep(steps: SAPcpmsDefaultSteps.settingsDownload),
            CompositeStep(steps: SAPcpmsDefaultSteps.applyDuringRestore),
        ]
    }

    public var resettingSteps: [OnboardingStep] {
        return self.onboardingSteps
    }

    // MARK: – Step configuration

    private func configuredWelcomeScreenStep() -> WelcomeScreenStep {
        let appParameters = FileConfigurationProvider("AppParameters").provideConfiguration().configuration
        let destinations = appParameters["Destinations"] as! NSDictionary
        let discoveryConfigurationTransformer = DiscoveryServiceConfigurationTransformer(applicationID: appParameters["Application Identifier"] as? String, authenticationPath: destinations["ESPMContainer"] as? String)
        let welcomeScreenStep = WelcomeScreenStep(transformer: discoveryConfigurationTransformer, providers: [FileConfigurationProvider()])

        welcomeScreenStep.welcomeScreenCustomizationHandler = { welcomeStepUI in
            welcomeStepUI.headlineLabel.text = "TutorialApp"
            welcomeStepUI.detailLabel.text = NSLocalizedString("keyWelcomeScreenMessage", value: "This application was generated by SAP BTP SDK Assistant for iOS", comment: "XMSG: Message on WelcomeScreen")
            welcomeStepUI.primaryActionButton.titleLabel?.text = NSLocalizedString("keyWelcomeScreenStartButton", value: "Start", comment: "XBUT: Title of start button on WelcomeScreen")

            if let welcomeScreen = welcomeStepUI as? FUIWelcomeScreen {
                // Configuring WelcomeScreen to prefill the email domain

                welcomeScreen.emailTextField.text = "user@"
            }
        }

        return welcomeScreenStep
    }

    private func configuredUserConsentStep() -> UserConsentStep {
        let actionTitle = "Learn more about Data Privacy"
        let actionUrl = "https://www.sap.com/corporate/en/legal/privacy.html"
        let singlePageTitle = "Data Privacy"
        let singlePageText = "Detailed text about how data privacy pertains to this app and why it is important for the user to enable this functionality"

        var singlePageContent = UserConsentPageContent()
        singlePageContent.actionTitle = actionTitle
        singlePageContent.actionUrl = actionUrl
        singlePageContent.title = singlePageTitle
        singlePageContent.body = singlePageText
        let singlePageFormContent = UserConsentFormContent(version: "1.0", isRequired: true, pages: [singlePageContent])

        return UserConsentStep(userConsentFormsContent: [singlePageFormContent])
    }

    private func configuredDataCollectionConsentStep() -> DataCollectionConsentStep {
        return DataCollectionConsentStep()
    }

    private func configuredStoreManagerStep() -> StoreManagerStep {
        let step = StoreManagerStep()
        step.defaultPasscodePolicy = nil
        step.runRestoreIfStoreExists = true
        step.auxiliaryParameters = getAuxiliaryParameters()
        return step
    }

    func getAuxiliaryParameters() -> AuxiliaryParameters {
        let obfuscatedPrimaryKey: [UInt8] = [82, 41, 83, 9, 60, 53, 28, 107, 19, 63, 65, 38, 31, 82, 24, 50, 35, 28, 10, 25, 43, 12, 41, 55, 80, 20, 5, 94, 58, 50, 57, 62, 32, 85, 18, 36, 32, 0, 92, 59, 39, 12, 41, 73]
        let apiKeyAuthenticationConfig: APIKeyAuthenticationConfig? = getAPIKeyAuthenticationConfig()
        let dataStore = try! AuxiliaryConfiguration.getSharedStore()
        let auxDataRequestManager: AuxiliaryDataRequestManager? = try? AuxiliaryDataRequestManager(dataStore: dataStore)
        let dataContainer: AuxiliaryDataRequest<WidgetDataKey>? = try? auxDataRequestManager?.getDataRequest()
        let eSPAKAuxiliary: Data? = dataContainer?.eSPAKAuxiliary
        let onboardingStatusName: String = AuxiliaryConfiguration.onboardingStatusName
        return AuxiliaryParameters(sharedStoreName: AuxiliaryConfiguration.sharedStoreName, sharedAccessGroup: AuxiliaryConfiguration.sharedAccessGroup, obfuscatedPrimaryKey: obfuscatedPrimaryKey, eSPAKAuxiliary: eSPAKAuxiliary, apiKeyAuthenicationConfig: apiKeyAuthenticationConfig, onboardingStatusName: onboardingStatusName)
    }
}
