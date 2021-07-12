//
// TutorialApp
//
// Created by SAP BTP SDK Assistant for iOS application on 12/07/21
//

import Foundation

public enum ODataContainerType: CaseIterable {
    case eSPMContainer
    case none

    public init?(rawValue: String) {
        guard let type = ODataContainerType.allCases.first(where: { rawValue == $0.description }) else {
            return nil
        }
        self = type
    }

    public var description: String {
        switch self {
        case .eSPMContainer: return "ESPMContainer"
        case .none: return ""
        }
    }
}
