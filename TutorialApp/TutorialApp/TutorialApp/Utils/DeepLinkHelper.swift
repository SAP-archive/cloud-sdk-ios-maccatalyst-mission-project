//
// TutorialApp
//
// Created by SAP BTP SDK Assistant for iOS application on 12/07/21
//

import Foundation
import SharedFmwk

enum Deeplink {
    enum Screen: Comparable {
        case destinationList
        case entitiyList
        case named(String)
        case none
    }

    enum Action {
        case view
        case create
        case none
    }

    case welcomeScreen
    case location(destination: ODataContainerType, screen: Screen, action: Action = .view)
}

class Deeplinker {
    var deepLink: Deeplink?
    init() {}

    @discardableResult
    func handle(_ url: URL) -> Bool {
        if let type = Deeplinker.Parser().parse(url) {
            deepLink = type
            Deeplinker.Navigator.shared.setup(type)
        }
        return deepLink != nil
    }

    class Parser {
        init() {}

        func parse(_ url: URL) -> Deeplink? {
            guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
                let host = components.host else {
                return nil
            }

            var pathComponents = components.path.components(separatedBy: "/")
            pathComponents.removeFirst()

            if pathComponents.isEmpty {
                return .welcomeScreen
            }

            let path = pathComponents.first!
            switch host {
            case ODataContainerType.eSPMContainer.description:
                if ESPMContainerCollectionType(rawValue: path) != nil {
                    return .location(destination: .eSPMContainer, screen: .named(path))
                }
                return nil
            default:
                break
            }
            return nil
        }
    }

    class Navigator {
        static let shared = Deeplinker.Navigator()
        var screen: Deeplink.Screen
        var action: Deeplink.Action
        var destination: ODataContainerType

        private init() {
            screen = .none
            action = .none
            destination = .none
        }

        func reset() {
            screen = .none
            action = .none
            destination = .none
        }

        func check(destination _: ODataContainerType,
                   screen: Deeplink.Screen,
                   moveForwardDoing next: ((ODataContainerType, Deeplink.Screen) -> Void)?,
                   actionHandler _: ((Deeplink.Action) -> Void)? = nil) {
            guard self.screen != .none else {
                return
            }

            // Reach the entity list page then move forward to requested screen and then reset
            if screen == .destinationList {
                next?(self.destination, self.screen)
            } else if screen == .entitiyList {
                next?(self.destination, self.screen)
                reset()
            }
        }

        func setup(_ type: Deeplink) {
            switch type {
            case .welcomeScreen:
                self.destination = .none
                self.screen = .none
                self.action = .none

            case let .location(destination: dest, screen: screen, action: action):
                self.destination = dest
                self.screen = screen
                self.action = action
            }
        }
    }
}
