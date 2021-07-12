//
// TutorialApp
//
// Created by SAP BTP SDK Assistant for iOS application on 12/07/21
//

import Foundation
import SAPCommon
import SAPOData

import ESPMContainerFmwk
import SharedFmwk

class ESPMContainerWidgetDataLoader: WidgetDataLoading {
    private let dataService: ESPMContainer<OnlineODataProvider>!
    private let widgetController: ESPMContainerWidgetController
    private let logger = Logger.shared(named: "ESPMContainerWidgetDataLoader")

    required init?(controller: ODataControlling, with cipher: Ciphering) {
        self.dataService = (controller as! ESPMContainerOnlineODataController).dataService
        self.widgetController = ESPMContainerWidgetController()
        do {
            try self.widgetController.configure(with: cipher)
            self.logger.info("ESPMContainerWidgetDataLoader initialised successfully!")
        } catch {
            self.logger.info("ESPMContainerWidgetDataLoader initialisation failed due to error: \(error)")
            return nil
        }
    }

    func loadAllEntitySets(completionHandler: @escaping (Bool) -> Void) {
        ESPMContainerCollectionType.allCases.forEach { entity in
            loadEntitySet(for: entity.description) { result in
                switch result {
                case true:
                    self.logger.info("EntitySet \(entity) loaded successfully")
                case false:
                    self.logger.info("EntitySet \(entity) load failed")
                }
            }
        }
        completionHandler(true)
    }

    func loadEntitySet(for entity: String, completionHandler: @escaping (Bool) -> Void) {
        guard let entityEnum = ESPMContainerCollectionType(rawValue: entity) else {
            self.logger.info("Cannot convert \(entity) to ESPMContainerCollectionType type")
            completionHandler(false)
            return
        }

        switch entityEnum {
        case .purchaseOrderItems:
            let query = DataQuery().selectAll().top(AuxiliaryConfiguration.numberOfRecords)
            dataService.fetchPurchaseOrderItems(matching: query) { res, err in
                guard err == nil else {
                    self.logger.error("EntitySet \(entityEnum.description) retrieval failed with error : \(err!)")
                    completionHandler(false)
                    return
                }

                guard let result = res else {
                    self.logger.error("No result obtained for entitySet \(entityEnum.description)")
                    completionHandler(false)
                    return
                }

                if (try? self.widgetController.put(list: result, forKey: entityEnum.description)) != nil {
                    self.logger.info("EntitySet \(entityEnum.description) loaded successfully")
                    completionHandler(true)
                } else {
                    self.logger.error("EntitySet \(entityEnum.description) storing failed")
                    completionHandler(false)
                }
                return
            }

        case .suppliers:
            let query = DataQuery().selectAll().top(AuxiliaryConfiguration.numberOfRecords)
            dataService.fetchSuppliers(matching: query) { res, err in
                guard err == nil else {
                    self.logger.error("EntitySet \(entityEnum.description) retrieval failed with error : \(err!)")
                    completionHandler(false)
                    return
                }

                guard let result = res else {
                    self.logger.error("No result obtained for entitySet \(entityEnum.description)")
                    completionHandler(false)
                    return
                }

                if (try? self.widgetController.put(list: result, forKey: entityEnum.description)) != nil {
                    self.logger.info("EntitySet \(entityEnum.description) loaded successfully")
                    completionHandler(true)
                } else {
                    self.logger.error("EntitySet \(entityEnum.description) storing failed")
                    completionHandler(false)
                }
                return
            }

        case .purchaseOrderHeaders:
            let query = DataQuery().selectAll().top(AuxiliaryConfiguration.numberOfRecords)
            dataService.fetchPurchaseOrderHeaders(matching: query) { res, err in
                guard err == nil else {
                    self.logger.error("EntitySet \(entityEnum.description) retrieval failed with error : \(err!)")
                    completionHandler(false)
                    return
                }

                guard let result = res else {
                    self.logger.error("No result obtained for entitySet \(entityEnum.description)")
                    completionHandler(false)
                    return
                }

                if (try? self.widgetController.put(list: result, forKey: entityEnum.description)) != nil {
                    self.logger.info("EntitySet \(entityEnum.description) loaded successfully")
                    completionHandler(true)
                } else {
                    self.logger.error("EntitySet \(entityEnum.description) storing failed")
                    completionHandler(false)
                }
                return
            }

        case .salesOrderHeaders:
            let query = DataQuery().selectAll().top(AuxiliaryConfiguration.numberOfRecords)
            dataService.fetchSalesOrderHeaders(matching: query) { res, err in
                guard err == nil else {
                    self.logger.error("EntitySet \(entityEnum.description) retrieval failed with error : \(err!)")
                    completionHandler(false)
                    return
                }

                guard let result = res else {
                    self.logger.error("No result obtained for entitySet \(entityEnum.description)")
                    completionHandler(false)
                    return
                }

                if (try? self.widgetController.put(list: result, forKey: entityEnum.description)) != nil {
                    self.logger.info("EntitySet \(entityEnum.description) loaded successfully")
                    completionHandler(true)
                } else {
                    self.logger.error("EntitySet \(entityEnum.description) storing failed")
                    completionHandler(false)
                }
                return
            }

        case .salesOrderItems:
            let query = DataQuery().selectAll().top(AuxiliaryConfiguration.numberOfRecords)
            dataService.fetchSalesOrderItems(matching: query) { res, err in
                guard err == nil else {
                    self.logger.error("EntitySet \(entityEnum.description) retrieval failed with error : \(err!)")
                    completionHandler(false)
                    return
                }

                guard let result = res else {
                    self.logger.error("No result obtained for entitySet \(entityEnum.description)")
                    completionHandler(false)
                    return
                }

                if (try? self.widgetController.put(list: result, forKey: entityEnum.description)) != nil {
                    self.logger.info("EntitySet \(entityEnum.description) loaded successfully")
                    completionHandler(true)
                } else {
                    self.logger.error("EntitySet \(entityEnum.description) storing failed")
                    completionHandler(false)
                }
                return
            }

        case .products:
            let query = DataQuery().selectAll().top(AuxiliaryConfiguration.numberOfRecords)
            dataService.fetchProducts(matching: query) { res, err in
                guard err == nil else {
                    self.logger.error("EntitySet \(entityEnum.description) retrieval failed with error : \(err!)")
                    completionHandler(false)
                    return
                }

                guard let result = res else {
                    self.logger.error("No result obtained for entitySet \(entityEnum.description)")
                    completionHandler(false)
                    return
                }

                if (try? self.widgetController.put(list: result, forKey: entityEnum.description)) != nil {
                    self.logger.info("EntitySet \(entityEnum.description) loaded successfully")
                    completionHandler(true)
                } else {
                    self.logger.error("EntitySet \(entityEnum.description) storing failed")
                    completionHandler(false)
                }
                return
            }

        case .productCategories:
            let query = DataQuery().selectAll().top(AuxiliaryConfiguration.numberOfRecords)
            dataService.fetchProductCategories(matching: query) { res, err in
                guard err == nil else {
                    self.logger.error("EntitySet \(entityEnum.description) retrieval failed with error : \(err!)")
                    completionHandler(false)
                    return
                }

                guard let result = res else {
                    self.logger.error("No result obtained for entitySet \(entityEnum.description)")
                    completionHandler(false)
                    return
                }

                if (try? self.widgetController.put(list: result, forKey: entityEnum.description)) != nil {
                    self.logger.info("EntitySet \(entityEnum.description) loaded successfully")
                    completionHandler(true)
                } else {
                    self.logger.error("EntitySet \(entityEnum.description) storing failed")
                    completionHandler(false)
                }
                return
            }

        case .stock:
            let query = DataQuery().selectAll().top(AuxiliaryConfiguration.numberOfRecords)
            dataService.fetchStock(matching: query) { res, err in
                guard err == nil else {
                    self.logger.error("EntitySet \(entityEnum.description) retrieval failed with error : \(err!)")
                    completionHandler(false)
                    return
                }

                guard let result = res else {
                    self.logger.error("No result obtained for entitySet \(entityEnum.description)")
                    completionHandler(false)
                    return
                }

                if (try? self.widgetController.put(list: result, forKey: entityEnum.description)) != nil {
                    self.logger.info("EntitySet \(entityEnum.description) loaded successfully")
                    completionHandler(true)
                } else {
                    self.logger.error("EntitySet \(entityEnum.description) storing failed")
                    completionHandler(false)
                }
                return
            }

        case .customers:
            let query = DataQuery().selectAll().top(AuxiliaryConfiguration.numberOfRecords)
            dataService.fetchCustomers(matching: query) { res, err in
                guard err == nil else {
                    self.logger.error("EntitySet \(entityEnum.description) retrieval failed with error : \(err!)")
                    completionHandler(false)
                    return
                }

                guard let result = res else {
                    self.logger.error("No result obtained for entitySet \(entityEnum.description)")
                    completionHandler(false)
                    return
                }

                if (try? self.widgetController.put(list: result, forKey: entityEnum.description)) != nil {
                    self.logger.info("EntitySet \(entityEnum.description) loaded successfully")
                    completionHandler(true)
                } else {
                    self.logger.error("EntitySet \(entityEnum.description) storing failed")
                    completionHandler(false)
                }
                return
            }

        case .productTexts:
            let query = DataQuery().selectAll().top(AuxiliaryConfiguration.numberOfRecords)
            dataService.fetchProductTexts(matching: query) { res, err in
                guard err == nil else {
                    self.logger.error("EntitySet \(entityEnum.description) retrieval failed with error : \(err!)")
                    completionHandler(false)
                    return
                }

                guard let result = res else {
                    self.logger.error("No result obtained for entitySet \(entityEnum.description)")
                    completionHandler(false)
                    return
                }

                if (try? self.widgetController.put(list: result, forKey: entityEnum.description)) != nil {
                    self.logger.info("EntitySet \(entityEnum.description) loaded successfully")
                    completionHandler(true)
                } else {
                    self.logger.error("EntitySet \(entityEnum.description) storing failed")
                    completionHandler(false)
                }
                return
            }

        default:
            completionHandler(false)
        }
    }
}
