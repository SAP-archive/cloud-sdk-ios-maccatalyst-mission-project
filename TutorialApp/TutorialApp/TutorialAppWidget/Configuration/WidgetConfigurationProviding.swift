//
// TutorialApp
//
// Created by SAP BTP SDK Assistant for iOS application on 12/07/21
//

import Foundation
import WidgetKit

protocol WidgetConfigurationProviding {
    func kind() -> String
    func configurationDisplayName() -> String
    func description() -> String
    var supportedFamilies: [WidgetFamily] { get }
}
