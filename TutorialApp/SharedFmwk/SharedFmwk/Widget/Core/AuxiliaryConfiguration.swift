//
// TutorialApp
//
// Created by SAP BTP SDK Assistant for iOS application on 12/07/21
//

import Foundation
import SAPCommon
import SAPFoundation

public class AuxiliaryConfiguration {
    public static let scheme = "com.example.TutorialApp"
    public static let sharedStoreName = "SharedStoreName"
    public static let sharedAccessGroup = ""
    public static let widgetKind = "com.example.TutorialApp.widget"
    public static let backgroundStepsTaskId = "com.example.TutorialApp.backgroundstepsrefreshtask"
    public static let numberOfRecords = 4
    public static let onboardingStatusName = "OnboardingStatus"
    public static let cryptoProviderTag = Data("CryptoProviderTag".utf8)

    public static func getSharedStore(storeName: String = AuxiliaryConfiguration.sharedStoreName, accessGroup: String = AuxiliaryConfiguration.sharedAccessGroup) throws -> DataStoring {
        do {
            return try KeychainStorage.createStore(name: storeName, accessGroup: accessGroup)
        } catch KeychainStorageError.storeAlreadyExists {
            return try KeychainStorage.openStore(name: storeName, accessGroup: accessGroup)
        } catch {
            throw error
        }
    }

    public static func getConfiguredWidgetControllers() -> [String: WidgetControlling] {
        var widgetControllers: [String: WidgetControlling] = [:]

        widgetControllers[ODataContainerType.eSPMContainer.description] = ESPMContainerWidgetController()
        return widgetControllers
    }
}
