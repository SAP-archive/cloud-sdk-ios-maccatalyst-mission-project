//
// TutorialApp
//
// Created by SAP BTP SDK Assistant for iOS application on 12/07/21
//

import Foundation
import SAPCommon
import SAPFioriFlows
import SAPFoundation
import SharedFmwk
import WidgetKit

open class AuxiliaryCommunicationStep: OnboardingStep {
    let logger = Logger.shared(named: "AuxiliaryCommunicationStep")

    // MARK: – OnboardingStep methods with context

    public func onboard(context: OnboardingContext, completionHandler: @escaping (OnboardingResult) -> Void) {
        self.prefetchDataForWidget(using: context, completionHandler: completionHandler)
    }

    public func restore(context: OnboardingContext, completionHandler: @escaping (OnboardingResult) -> Void) {
        completionHandler(.success(context))
    }

    public func reset(context _: OnboardingContext, completionHandler: @escaping () -> Void) {
        completionHandler()
    }

    public func background(context: OnboardingContext, completionHandler: @escaping (OnboardingResult) -> Void) {
        self.loadDataForWidget(using: context, completionHandler: completionHandler)
    }

    // MARK: – Widget data loading entry points

    private func prefetchDataForWidget(using context: OnboardingContext, completionHandler: @escaping (OnboardingResult) -> Void) {
        self.getConfiguredODataControllers(context: context) { odataControllers in
            let widgetDataLoaders = self.getConfiguredWidgetDataLoaders(odataControllers: odataControllers)
            let dataLoadingManager = WidgetDataLoadingManager(widgetDataLoaders: widgetDataLoaders)

            // Let's try to prefetch all entitysets required for the widget.
            dataLoadingManager.loadAllEntitySets { result in
                if result {
                    self.logger.info("dataLoadingManager.loadAllEntitySets() successful.")
                    WidgetCenter.shared.reloadTimelines(ofKind: AuxiliaryConfiguration.widgetKind)
                    completionHandler(.success(context))
                    return
                } else {
                    self.logger.info("dataLoadingManager.loadAllEntitySets() failed.")
                    // lets not fail the flow. prefetch is an optional processing operation.
                    WidgetCenter.shared.reloadTimelines(ofKind: AuxiliaryConfiguration.widgetKind)
                    completionHandler(.success(context))
                    return
                }
            }
        }
    }

    private func loadDataForWidget(using context: OnboardingContext, completionHandler: @escaping (OnboardingResult) -> Void) {
        // Let's identify the pending request
        guard let pendingRequest = self.identifyPendingDataRequest() else {
            self.logger.info("There is no widget data load request to process at this moment.")
            completionHandler(.success(context))
            return
        }
        // Let's load the entityset required for the widget.
        let dataKey: WidgetDataKey = pendingRequest.get()
        self.getConfiguredODataControllers(context: context) { odataControllers in
            let widgetDataLoaders = self.getConfiguredWidgetDataLoaders(odataControllers: odataControllers)
            let dataLoadingManager = WidgetDataLoadingManager(widgetDataLoaders: widgetDataLoaders)
            dataLoadingManager.loadEntitySet(from: dataKey.destinationName, entityName: dataKey.entityName) { result in
                if result {
                    self.logger.info("dataLoadingManager.loadEntitySet() successful.")
                    WidgetCenter.shared.reloadTimelines(ofKind: pendingRequest.kind)
                    completionHandler(.success(context))
                    return
                } else {
                    self.logger.info("dataLoadingManager.loadEntitySet() failed.")
                    completionHandler(.failed(OnboardingError.missingArgument(dataKey.entityName, source: dataKey.destinationName)))
                    return
                }
            }
        }
    }

    private func identifyPendingDataRequest() -> AuxiliaryDataRequest<WidgetDataKey>? {
        do {
            let dataStore = try AuxiliaryConfiguration.getSharedStore()
            let auxDataRequestManager: AuxiliaryDataRequestManager = try AuxiliaryDataRequestManager(dataStore: dataStore)
            let dataRequest: AuxiliaryDataRequest<WidgetDataKey>? = try auxDataRequestManager.getDataRequest()
            guard let dataRequestNotNil = dataRequest else {
                logger.info("There is no widget data load request to process at this moment.")
                return nil
            }
            return dataRequestNotNil
        } catch {
            logger.error("Error occured while processing data request - Error: \(error)")
            return nil
        }
    }

    private func getConfiguredODataControllers(context: OnboardingContext,
                                               completion: @escaping ([String: ODataControlling]) -> Void) {
        var odataControllers = [String: ODataControlling]()
        let destinations = FileConfigurationProvider("AppParameters").provideConfiguration().configuration["Destinations"] as! NSDictionary

        odataControllers[ODataContainerType.eSPMContainer.description] = ESPMContainerOnlineODataController()

        for (odataServiceName, odataController) in odataControllers {
            let destinationId = destinations[odataServiceName] as! String
            let configurationURL = URL(string: (context.info[.sapcpmsSettingsParameters] as! SAPcpmsSettingsParameters).backendURL.appendingPathComponent(destinationId).absoluteString)!
            do {
                try odataController.configureOData(sapURLSession: context.sapURLSession, serviceRoot: configurationURL)
                odataControllers[odataServiceName] = odataController
            } catch {
                logger.error("Error occured while configuring odataService: \(odataServiceName)")
            }
        }
        completion(odataControllers)
    }

    private func getConfiguredWidgetDataLoaders(odataControllers: [String: ODataControlling]) -> [String: WidgetDataLoading] {
        var widgetDataLoaders: [String: WidgetDataLoading] = [:]
        var key = ""
        var cipher: Ciphering

        do {
            let auxDataEncryptionKey = try SecurityManager().getAuxiliaryDataEncryptionKey()
            cipher = CryptoProvider(with: auxDataEncryptionKey, tag: AuxiliaryConfiguration.cryptoProviderTag)
        } catch {
            fatalError("No auxiliary data encryption key found!")
        }

        key = ODataContainerType.eSPMContainer.description
        if let controller = odataControllers[key], let loader = ESPMContainerWidgetDataLoader(controller: controller, with: cipher) {
            widgetDataLoaders[key] = loader
        }
        return widgetDataLoaders
    }
}
