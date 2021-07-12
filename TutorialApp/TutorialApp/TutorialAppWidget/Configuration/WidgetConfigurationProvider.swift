//
// TutorialApp
//
// Created by SAP BTP SDK Assistant for iOS application on 12/07/21
//

import Foundation
import SAPFoundation
import SharedFmwk
import WidgetKit

class WidgetConfigurationProvider: WidgetConfigurationProviding {
    let auxStoreName: String = "AuxiliaryDataStore"
    let auxAccessGroup: String = ""
    let obfuscatedAuxiliaryKey: [UInt8] = [75, 54, 5, 6, 48, 31, 1, 103, 83, 28, 2, 82, 81, 87, 85, 44, 91, 18, 43, 21, 38, 29, 40, 8, 11, 21, 44, 60, 56, 23, 59, 56, 53, 12, 51, 16, 24, 52, 41, 45, 27, 24, 27, 73]

    func configurationDisplayName() -> String {
        "TutorialApp Widget"
    }

    func description() -> String {
        "Get quick access to your entities."
    }

    func kind() -> String {
        AuxiliaryConfiguration.widgetKind
    }

    var supportedFamilies: [WidgetFamily] {
        [.systemLarge]
    }
}
