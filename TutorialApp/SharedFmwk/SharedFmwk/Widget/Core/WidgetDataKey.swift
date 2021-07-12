//
// TutorialApp
//
// Created by SAP BTP SDK Assistant for iOS application on 12/07/21
//

import Foundation

public class WidgetDataKey: Codable & Hashable {
    private var _destinationName: String
    private var _entityName: String

    public init(destinationName: String, entityName: String) {
        self._entityName = entityName
        self._destinationName = destinationName
    }

    public var destinationName: String {
        return self._destinationName
    }

    public var entityName: String {
        return self._entityName
    }

    public func getPrimaryKey() -> String {
        return self.destinationName + ":" + self.entityName
    }

    public static func == (lhs: WidgetDataKey, rhs: WidgetDataKey) -> Bool {
        if lhs.getPrimaryKey() == rhs.getPrimaryKey() {
            return true
        } else {
            return false
        }
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.getPrimaryKey())
    }
}
