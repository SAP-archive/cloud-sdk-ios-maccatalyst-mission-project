//
// TutorialApp
//
// Created by SAP BTP SDK Assistant for iOS application on 12/07/21
//

import Foundation
import SAPCommon
import SAPFoundation
import SharedFmwk
import WidgetKit

struct WidgetIntentTimelineProvider: IntentTimelineProvider {
    // Use this to provide snapshot for widget
    private struct WidgetData: WidgetRowViewModel {
        var value = ""
        var key = ""
        var image: String?
    }

    static var previewData: [WidgetRowViewModel] {
        let sampleData: [WidgetData] = [
            WidgetData(value: "4fa5c668-8009-4a20-8991-6e1ee15f55c1",
                       key: "ProductId", image: nil),
            WidgetData(value: "4fa5c668-8009-4a20-8991-6e1ee15f55c1",
                       key: "ProductId", image: nil),
            WidgetData(value: "0b3c8d78-46e5-4c18-96b3-f3666b3ea08e",
                       key: "ProductId", image: nil),
            WidgetData(value: "aa21b4ba-c182-4178-98fb-72c764ac916e",
                       key: "ProductId", image: nil),
        ]
        return sampleData
    }

    func placeholder(in _: Context) -> WidgetEntry {
        return WidgetEntry(date: Date(), title: "Collections", values: WidgetIntentTimelineProvider.previewData)
    }

    func getSnapshot(for _: DynamicDestinationSelectionIntent, in _: Context, completion: @escaping (WidgetEntry) -> Void) {
        let entry = WidgetEntry(date: Date(), title: "Collections", values: WidgetIntentTimelineProvider.previewData)
        completion(entry)
    }

    func getTimeline(for configuration: DynamicDestinationSelectionIntent, in _: Context, completion: @escaping (Timeline<WidgetEntry>) -> Void) {
        guard AuxiliaryOnboardingUtil().isWidgetInitialized() else {
            // User has not onboarded, show login screen
            let entry = WidgetEntry(date: Date(), title: "", values: [])
            let timeline = Timeline(entries: [entry], policy: .atEnd)
            completion(timeline)
            return
        }

        let entry = getData(forEntity: configuration.selectedEntity, inDestination: configuration.selectedDestination)
        let timeline = Timeline(entries: [entry], policy: .atEnd)
        completion(timeline)
    }

    func getData(forEntity entity: String, inDestination destination: String) -> WidgetEntry {
        guard !destination.isEmpty, !entity.isEmpty else {
            let entry = WidgetEntry(date: Date(), title: "Collections", values: [])
            return entry
        }

        let controllers = AuxiliaryConfiguration.getConfiguredWidgetControllers()

        switch destination {
        case ODataContainerType.eSPMContainer.description:
            let widgetController = controllers[destination] as! ESPMContainerWidgetController
            var cipher: Ciphering
            do {
                let auxDataEncryptionKey = try self.getAuxDataEncryptionKey()
                cipher = CryptoProvider(with: auxDataEncryptionKey, tag: AuxiliaryConfiguration.cryptoProviderTag)
            } catch {
                fatalError("No auxiliary data encryption key found!")
            }

            try? widgetController.configure(with: cipher)

            do {
                let info = WidgetDataKey(destinationName: destination, entityName: entity)
                let eSPAKAuxiliary = try self.getESPAKAuxiliary()
                let dataRequest = AuxiliaryDataRequest<WidgetDataKey>(info: info, eSPAKAux: eSPAKAuxiliary, kind: AuxiliaryConfiguration.widgetKind)
                try widgetController.initiateDataRequest(dataRequest: dataRequest)
            } catch {
                print("Error thrown in initiateDataRequest::: \(error)")
            }
            return eSPMContainerEntry(forType: entity)

        default:
            return WidgetEntry(date: Date(), title: "Collections", values: [])
        }
    }

    func getESPAKAuxiliary() throws -> Data {
        let auxSecurityManager = try AuxiliarySecurityManager(auxiliaryStoreName: WidgetConfigurationProvider().auxStoreName, auxiliaryAccessGroup: WidgetConfigurationProvider().auxAccessGroup, sharedStoreName: AuxiliaryConfiguration.sharedStoreName, sharedAccesGroup: AuxiliaryConfiguration.sharedAccessGroup)

        return try auxSecurityManager.getESPAKAuxiliary(obfuscatedAuxiliaryKey: WidgetConfigurationProvider().obfuscatedAuxiliaryKey)
    }

    func getAuxDataEncryptionKey() throws -> Data {
        let auxSecurityManager = try AuxiliarySecurityManager(auxiliaryStoreName: WidgetConfigurationProvider().auxStoreName, auxiliaryAccessGroup: WidgetConfigurationProvider().auxAccessGroup, sharedStoreName: AuxiliaryConfiguration.sharedStoreName, sharedAccesGroup: AuxiliaryConfiguration.sharedAccessGroup)

        return try auxSecurityManager.getAuxiliaryDataEncryptionKey()
    }

    func eSPMContainerEntry(forType entity: String) -> WidgetEntry {
        guard let entityEnum = ESPMContainerCollectionType(rawValue: entity) else {
            let entry = WidgetEntry(date: Date(), title: "Collections", values: [])
            return entry
        }

        var entry: WidgetEntry
        let controllers = AuxiliaryConfiguration.getConfiguredWidgetControllers()
        let widgetController = controllers[ODataContainerType.eSPMContainer.description] as! ESPMContainerWidgetController

        var cipher: Ciphering
        do {
            let auxDataEncryptionKey = try self.getAuxDataEncryptionKey()
            cipher = CryptoProvider(with: auxDataEncryptionKey, tag: AuxiliaryConfiguration.cryptoProviderTag)
        } catch {
            fatalError("No auxiliary data encryption key found!")
        }

        try? widgetController.configure(with: cipher)

        var values = [WidgetRowViewModel]()

        switch entityEnum {
        case .purchaseOrderItems:
            do {
                values = try widgetController.fetchPurchaseOrderItems()
            } catch {
                print("Error in fetching \(entity): \(error)")
            }
        case .suppliers:
            do {
                values = try widgetController.fetchSuppliers()
            } catch {
                print("Error in fetching \(entity): \(error)")
            }
        case .purchaseOrderHeaders:
            do {
                values = try widgetController.fetchPurchaseOrderHeaders()
            } catch {
                print("Error in fetching \(entity): \(error)")
            }
        case .salesOrderHeaders:
            do {
                values = try widgetController.fetchSalesOrderHeaders()
            } catch {
                print("Error in fetching \(entity): \(error)")
            }
        case .salesOrderItems:
            do {
                values = try widgetController.fetchSalesOrderItems()
            } catch {
                print("Error in fetching \(entity): \(error)")
            }
        case .products:
            do {
                values = try widgetController.fetchProducts()
            } catch {
                print("Error in fetching \(entity): \(error)")
            }
        case .productCategories:
            do {
                values = try widgetController.fetchProductCategories()
            } catch {
                print("Error in fetching \(entity): \(error)")
            }
        case .stock:
            do {
                values = try widgetController.fetchStock()
            } catch {
                print("Error in fetching \(entity): \(error)")
            }
        case .customers:
            do {
                values = try widgetController.fetchCustomers()
            } catch {
                print("Error in fetching \(entity): \(error)")
            }
        case .productTexts:
            do {
                values = try widgetController.fetchProductTexts()
            } catch {
                print("Error in fetching \(entity): \(error)")
            }
        default:
            values = []
        }

        entry = WidgetEntry(date: Date(), title: entity, values: values)
        entry.listPath = "\(ODataContainerType.eSPMContainer.description)/\(entity)"
        return entry
    }
}
