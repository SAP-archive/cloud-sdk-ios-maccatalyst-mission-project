//
// TutorialApp
//
// Created by SAP BTP SDK Assistant for iOS v7.0.0 application on 04/01/22
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
