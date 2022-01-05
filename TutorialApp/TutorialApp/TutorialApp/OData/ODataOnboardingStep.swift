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

open class ODataOnboardingStep: OnboardingStep {
    var controllers: [String: ODataControlling] = [:]
    private let logger = Logger.shared(named: "AppDelegateLogger")

    public func onboard(context: OnboardingContext, completionHandler: @escaping (OnboardingResult) -> Void) {
        configureOData(using: context, completionHandler: completionHandler)
    }

    public func restore(context: OnboardingContext, completionHandler: @escaping (OnboardingResult) -> Void) {
        configureOData(using: context, completionHandler: completionHandler)
    }

    public func reset(context: OnboardingContext, completionHandler: @escaping () -> Void) {
        defer { completionHandler() }
        do {
            try ESPMContainerOfflineODataController.removeStore(for: context.onboardingID)
        } catch {
            logger.error("Remove Offline Store failed", error: error)
        }
    }

    // Read more about consumption of OData services in mobile applications: https://help.sap.com/viewer/fc1a59c210d848babfb3f758a6f55cb1/Latest/en-US/1c7d937d0c8a43f4aca7175e9051d108.html
    private func configureOData(using context: OnboardingContext, completionHandler: @escaping (OnboardingResult) -> Void) {
        let banner = topBanner()
        let group = DispatchGroup()
        var odataControllers = [String: ODataControlling]()
        let destinations = FileConfigurationProvider("AppParameters").provideConfiguration().configuration["Destinations"] as! NSDictionary

        let eSPMContainerOfflineODataDelegateSample = OfflineODataDelegateSample(for: "ESPMContainer", with: banner)
        odataControllers[ODataContainerType.eSPMContainer.description] = ESPMContainerOfflineODataController(delegate: eSPMContainerOfflineODataDelegateSample)

        for (odataServiceName, odataController) in odataControllers {
            group.enter()
            let destinationId = destinations[odataServiceName] as! String
            // Adjust this path so it can be called after authentication and returns an HTTP 200 code. This is used to validate the authentication was successful.
            let configurationURL = URL(string: (context.info[.sapcpmsSettingsParameters] as! SAPcpmsSettingsParameters).backendURL.appendingPathComponent(destinationId).absoluteString)!

            do {
                try odataController.configureOData(sapURLSession: context.sapURLSession, serviceRoot: configurationURL, onboardingID: context.onboardingID)
                let connectivityStatus = ConnectivityUtils.isConnected()
                logger.info("Network connectivity status: \(connectivityStatus)")
                odataController.openOfflineStore(synchronize: connectivityStatus) { error in
                    if let error = error {
                        completionHandler(.failed(error))
                        return
                    }
                    self.controllers[odataServiceName] = odataController
                    group.leave()
                }
            } catch {
                completionHandler(.failed(error))
            }
        }
        group.notify(queue: .main) {
            completionHandler(.success(context))
        }
    }

    private func topBanner() -> FUIBannerMessageView? {
        let bannerTag = 138
        guard let topController = UIApplication.shared.windows.first!.rootViewController as? FUIInfoViewController else {
            logger.error("Unable to show top banner. Application rootViewController is not an FUIInfoViewController.")
            return nil
        }
        var banner: FUIProgressBannerMessageView!
        let alreadyAdded = topController.view.viewWithTag(bannerTag) != nil
        if !alreadyAdded {
            logger.info("Should only be called once.")
            banner = FUIProgressBannerMessageView(frame: CGRect(x: 0, y: 0, width: topController.view.frame.width, height: 50))
            banner.tag = bannerTag
            topController.view.addSubview(banner)
            banner.translatesAutoresizingMaskIntoConstraints = false
            banner.topAnchor.constraint(equalTo: topController.view.safeAreaLayoutGuide.topAnchor).isActive = true
            banner.leftAnchor.constraint(equalTo: topController.view.safeAreaLayoutGuide.leftAnchor).isActive = true
            banner.rightAnchor.constraint(equalTo: topController.view.safeAreaLayoutGuide.rightAnchor).isActive = true
        }
        if let topBanner = topController.view.viewWithTag(bannerTag) as? FUIBannerMessageView {
            topBanner.titleLabel.text = "Synchronizing Data"
        }

        let rotationAnimation = self.rotationAnimation()
        banner.syncIcon.layer.add(rotationAnimation, forKey: "rotationAnimation")

        return topController.view.viewWithTag(bannerTag) as? FUIBannerMessageView
    }

    private func rotationAnimation() -> CABasicAnimation {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = Float(-Double.pi * 2)
        rotationAnimation.duration = 1
        rotationAnimation.repeatCount = Float.infinity
        #if swift(>=4.2)
            rotationAnimation.timingFunction = CAMediaTimingFunction(name: .linear)
        #else
            rotationAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        #endif
        return rotationAnimation
    }
}
