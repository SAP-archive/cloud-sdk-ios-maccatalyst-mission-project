//
// TutorialApp
//
// Created by SAP BTP SDK Assistant for iOS application on 12/07/21
//

import Foundation
import Intents
import SharedFmwk

class DynamicDestinationSelectionIntentHandler: NSObject, DynamicDestinationSelectionIntentHandling {
    /// ESPMContainer
    func provideESPMContainerOptionsCollection(for _: DynamicDestinationSelectionIntent, with completion: @escaping (INObjectCollection<ESPMContainerEntities>?, Error?) -> Void) {
        completion(ESPMContainerEntities.inObjectCollection, nil)
    }

    func defaultESPMContainer(for _: DynamicDestinationSelectionIntent) -> ESPMContainerEntities? {
        return ESPMContainerEntities.inObjects.first!
    }
}

extension ESPMContainerEntities {
    static var inObjectCollection: INObjectCollection<ESPMContainerEntities> {
        INObjectCollection(items: ESPMContainerEntities.inObjects)
    }

    static var inObjects: [ESPMContainerEntities] {
        let values = ESPMContainerCollectionType.allCases.map {
            ESPMContainerEntities(identifier: nil, display: $0.description)
        }
        return values
    }
}
