//
// TutorialApp
//
// Created by SAP BTP SDK Assistant for iOS application on 12/07/21
//

import Foundation
import SAPCommon
import SAPFoundation

public class AuxiliaryOnboardingUtil {
    let logger = Logger.shared(named: "SAP.Widget.Onboarding")

    /// The key for storing the onboarding status
    public static let defaultStoringKey = "OnboardingStatus"

    public init() {}

    public func isWidgetInitialized() -> Bool {
        if UserDefaults.standard.bool(forKey: AuxiliaryOnboardingUtil.defaultStoringKey) {
            return true
        }

        let store = try! AuxiliaryConfiguration.getSharedStore()
        let communicationProvider = AuxiliaryCommunicationProvider(using: store)

        let onboardingStatus = try? communicationProvider.get(for: AuxiliaryConfiguration.onboardingStatusName)

        if onboardingStatus == nil {
            self.logger.info("App is not onboarded.")
            // remove data from store
            self.removeData()
            return false
        }
        try? communicationProvider.delete(for: AuxiliaryConfiguration.onboardingStatusName)
        UserDefaults.standard.set(true, forKey: AuxiliaryOnboardingUtil.defaultStoringKey)
        return true
    }

    public func removeData() {
        do {
            let store: KeychainStorage = try AuxiliaryConfiguration.getSharedStore() as! KeychainStorage
            try store.removeAllData()
        } catch {
            self.logger.error("Failed to remove data. Error: \(error)")
        }
    }
}
