//
// TutorialApp
//
// Created by SAP BTP SDK Assistant for iOS application on 12/07/21
//

import Intents

class IntentHandler: INExtension {
    override func handler(for intent: INIntent) -> Any {
        guard intent is DynamicDestinationSelectionIntent else {
            fatalError("Unhandled Intent error : \(intent)")
        }
        return DynamicDestinationSelectionIntentHandler()
    }
}
