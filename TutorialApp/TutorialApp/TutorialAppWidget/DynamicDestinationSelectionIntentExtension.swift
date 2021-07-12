//
// TutorialApp
//
// Created by SAP BTP SDK Assistant for iOS application on 12/07/21
//

import Foundation
import SharedFmwk

extension DynamicDestinationSelectionIntent {
    public var selectedDestination: String {
        switch self.destination {
        case .eSPMContainer:
            return ODataContainerType.eSPMContainer.description
        default:
            return "NA"
        }
    }

    public var selectedEntity: String {
        switch self.destination {
        case .eSPMContainer:
            if let validDestination = ESPMContainer,
                let value = ESPMContainerCollectionType(rawValue: validDestination.displayString) {
                return value.description
            } else {
                return "NA"
            }
        case .unknown:
            return "NA"
        }
    }
}
