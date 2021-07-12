//
// TutorialApp
//
// Created by SAP BTP SDK Assistant for iOS application on 12/07/21
//

import SAPCommon
import SAPFioriFlows
import SAPFoundation

import SharedFmwk

open class ODataOnboardingStep: OnboardingStep {
    var controllers: [String: ODataControlling] = [:]

    public func onboard(context: OnboardingContext, completionHandler: @escaping (OnboardingResult) -> Void) {
        self.configureOData(using: context, completionHandler: completionHandler)
    }

    public func restore(context: OnboardingContext, completionHandler: @escaping (OnboardingResult) -> Void) {
        self.configureOData(using: context, completionHandler: completionHandler)
    }

    public func reset(context _: OnboardingContext, completionHandler: @escaping () -> Void) {
        completionHandler()
    }

    // Read more about consumption of OData services in mobile applications: https://help.sap.com/viewer/fc1a59c210d848babfb3f758a6f55cb1/Latest/en-US/1c7d937d0c8a43f4aca7175e9051d108.html
    private func configureOData(using context: OnboardingContext, completionHandler: @escaping (OnboardingResult) -> Void) {
        var odataControllers = [String: ODataControlling]()
        let destinations = FileConfigurationProvider("AppParameters").provideConfiguration().configuration["Destinations"] as! NSDictionary

        odataControllers[ODataContainerType.eSPMContainer.description] = ESPMContainerOnlineODataController()

        for (odataServiceName, odataController) in odataControllers {
            let destinationId = destinations[odataServiceName] as! String
            // Adjust this path so it can be called after authentication and returns an HTTP 200 code. This is used to validate the authentication was successful.
            let configurationURL = URL(string: (context.info[.sapcpmsSettingsParameters] as! SAPcpmsSettingsParameters).backendURL.appendingPathComponent(destinationId).absoluteString)!

            do {
                try odataController.configureOData(sapURLSession: context.sapURLSession, serviceRoot: configurationURL)
                self.controllers[odataServiceName] = odataController
            } catch {
                completionHandler(.failed(error))
            }
        }
        completionHandler(.success(context))
    }
}
