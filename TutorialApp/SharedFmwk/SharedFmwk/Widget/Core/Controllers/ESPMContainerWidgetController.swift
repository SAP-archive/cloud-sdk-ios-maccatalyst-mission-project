//
// TutorialApp
//
// Created by SAP BTP SDK Assistant for iOS application on 12/07/21
//

import ESPMContainerFmwk
import Foundation
import SAPCommon
import SAPFoundation
import SAPOData
import UIKit

public class ESPMContainerWidgetController: WidgetControlling {
    private var dataServiceProvider: DefaultAuxiliaryDataServiceProvider!
    private var dataRequestManager: AuxiliaryDataRequestManager!

    public init() {}

    public func configure(with cipher: Ciphering) throws {
        do {
            let store = try AuxiliaryConfiguration.getSharedStore()
            let communicationProvider = AuxiliaryCommunicationProvider(using: store)
            self.dataServiceProvider = DefaultAuxiliaryDataServiceProvider(provider: communicationProvider, with: cipher)
            self.dataRequestManager = AuxiliaryDataRequestManager(provider: communicationProvider)
        } catch {
            throw error
        }
    }

    public func initiateDataRequest(dataRequest: AuxiliaryDataRequest<WidgetDataKey>) throws {
        try self.dataRequestManager.putDataRequest(dataRequest: dataRequest)
    }

    public func identifyDataRequest() throws -> WidgetDataKey? {
        let dataContainer: AuxiliaryDataRequest<WidgetDataKey>? = try self.dataRequestManager.getDataRequest()
        if let dataContainerNotNil = dataContainer {
            return dataContainerNotNil.get()
        } else {
            return nil
        }
    }

    public func completeDataRequest() throws {
        let dataContainer: AuxiliaryDataRequest<WidgetDataKey>? = try self.dataRequestManager.getDataRequest()
        if let dataContainerNotNil = dataContainer {
            try self.dataRequestManager.completeDataRequest(dataRequest: dataContainerNotNil)
        }
    }

    open func put(list: [EntityValue], forKey key: String) throws {
        let keyContainer: AuxiliaryKeyContainer<WidgetDataKey> = getKeyContainer(for: key)

        let encoder = JSONEncoder()
        if let encodedEntityValue = try? encoder.encode(list) {
            let dataContainer = AuxiliaryDataContainer<Data>(data: encodedEntityValue)
            try self.dataServiceProvider.put(auxDataContainer: dataContainer, for: keyContainer)
        }
    }

    func getKeyContainer(for entity: String) -> AuxiliaryKeyContainer<WidgetDataKey> {
        let dataKey: WidgetDataKey = WidgetDataKey(destinationName: ODataContainerType.eSPMContainer.description, entityName: entity)
        return AuxiliaryKeyContainer(key: dataKey)
    }

    // MARK: - Fetch methods

    open func fetchPurchaseOrderItems() throws -> [ESPMContainerFmwk.PurchaseOrderItem] {
        let keyContainer: AuxiliaryKeyContainer<WidgetDataKey> = getKeyContainer(for: ESPMContainerCollectionType.purchaseOrderItems.description)

        let dataContainer: AuxiliaryDataContainer<Data> = try self.dataServiceProvider.get(auxKeyContainer: keyContainer)
        let decoder = JSONDecoder()
        decoder.userInfo[CSDLDocument.csdlInfoKey] = ESPMContainerMetadata.document
        let purchaseOrderItems = try decoder.decode([ESPMContainerFmwk.PurchaseOrderItem].self, from: dataContainer.get())

        return purchaseOrderItems
    }

    open func fetchSuppliers() throws -> [ESPMContainerFmwk.Supplier] {
        let keyContainer: AuxiliaryKeyContainer<WidgetDataKey> = getKeyContainer(for: ESPMContainerCollectionType.suppliers.description)

        let dataContainer: AuxiliaryDataContainer<Data> = try self.dataServiceProvider.get(auxKeyContainer: keyContainer)
        let decoder = JSONDecoder()
        decoder.userInfo[CSDLDocument.csdlInfoKey] = ESPMContainerMetadata.document
        let suppliers = try decoder.decode([ESPMContainerFmwk.Supplier].self, from: dataContainer.get())

        return suppliers
    }

    open func fetchPurchaseOrderHeaders() throws -> [ESPMContainerFmwk.PurchaseOrderHeader] {
        let keyContainer: AuxiliaryKeyContainer<WidgetDataKey> = getKeyContainer(for: ESPMContainerCollectionType.purchaseOrderHeaders.description)

        let dataContainer: AuxiliaryDataContainer<Data> = try self.dataServiceProvider.get(auxKeyContainer: keyContainer)
        let decoder = JSONDecoder()
        decoder.userInfo[CSDLDocument.csdlInfoKey] = ESPMContainerMetadata.document
        let purchaseOrderHeaders = try decoder.decode([ESPMContainerFmwk.PurchaseOrderHeader].self, from: dataContainer.get())

        return purchaseOrderHeaders
    }

    open func fetchSalesOrderHeaders() throws -> [ESPMContainerFmwk.SalesOrderHeader] {
        let keyContainer: AuxiliaryKeyContainer<WidgetDataKey> = getKeyContainer(for: ESPMContainerCollectionType.salesOrderHeaders.description)

        let dataContainer: AuxiliaryDataContainer<Data> = try self.dataServiceProvider.get(auxKeyContainer: keyContainer)
        let decoder = JSONDecoder()
        decoder.userInfo[CSDLDocument.csdlInfoKey] = ESPMContainerMetadata.document
        let salesOrderHeaders = try decoder.decode([ESPMContainerFmwk.SalesOrderHeader].self, from: dataContainer.get())

        return salesOrderHeaders
    }

    open func fetchSalesOrderItems() throws -> [ESPMContainerFmwk.SalesOrderItem] {
        let keyContainer: AuxiliaryKeyContainer<WidgetDataKey> = getKeyContainer(for: ESPMContainerCollectionType.salesOrderItems.description)

        let dataContainer: AuxiliaryDataContainer<Data> = try self.dataServiceProvider.get(auxKeyContainer: keyContainer)
        let decoder = JSONDecoder()
        decoder.userInfo[CSDLDocument.csdlInfoKey] = ESPMContainerMetadata.document
        let salesOrderItems = try decoder.decode([ESPMContainerFmwk.SalesOrderItem].self, from: dataContainer.get())

        return salesOrderItems
    }

    open func fetchProducts() throws -> [ESPMContainerFmwk.Product] {
        let keyContainer: AuxiliaryKeyContainer<WidgetDataKey> = getKeyContainer(for: ESPMContainerCollectionType.products.description)

        let dataContainer: AuxiliaryDataContainer<Data> = try self.dataServiceProvider.get(auxKeyContainer: keyContainer)
        let decoder = JSONDecoder()
        decoder.userInfo[CSDLDocument.csdlInfoKey] = ESPMContainerMetadata.document
        let products = try decoder.decode([ESPMContainerFmwk.Product].self, from: dataContainer.get())

        return products
    }

    open func fetchProductCategories() throws -> [ESPMContainerFmwk.ProductCategory] {
        let keyContainer: AuxiliaryKeyContainer<WidgetDataKey> = getKeyContainer(for: ESPMContainerCollectionType.productCategories.description)

        let dataContainer: AuxiliaryDataContainer<Data> = try self.dataServiceProvider.get(auxKeyContainer: keyContainer)
        let decoder = JSONDecoder()
        decoder.userInfo[CSDLDocument.csdlInfoKey] = ESPMContainerMetadata.document
        let productCategories = try decoder.decode([ESPMContainerFmwk.ProductCategory].self, from: dataContainer.get())

        return productCategories
    }

    open func fetchStock() throws -> [ESPMContainerFmwk.Stock] {
        let keyContainer: AuxiliaryKeyContainer<WidgetDataKey> = getKeyContainer(for: ESPMContainerCollectionType.stock.description)

        let dataContainer: AuxiliaryDataContainer<Data> = try self.dataServiceProvider.get(auxKeyContainer: keyContainer)
        let decoder = JSONDecoder()
        decoder.userInfo[CSDLDocument.csdlInfoKey] = ESPMContainerMetadata.document
        let stock = try decoder.decode([ESPMContainerFmwk.Stock].self, from: dataContainer.get())

        return stock
    }

    open func fetchCustomers() throws -> [ESPMContainerFmwk.Customer] {
        let keyContainer: AuxiliaryKeyContainer<WidgetDataKey> = getKeyContainer(for: ESPMContainerCollectionType.customers.description)

        let dataContainer: AuxiliaryDataContainer<Data> = try self.dataServiceProvider.get(auxKeyContainer: keyContainer)
        let decoder = JSONDecoder()
        decoder.userInfo[CSDLDocument.csdlInfoKey] = ESPMContainerMetadata.document
        let customers = try decoder.decode([ESPMContainerFmwk.Customer].self, from: dataContainer.get())

        return customers
    }

    open func fetchProductTexts() throws -> [ESPMContainerFmwk.ProductText] {
        let keyContainer: AuxiliaryKeyContainer<WidgetDataKey> = getKeyContainer(for: ESPMContainerCollectionType.productTexts.description)

        let dataContainer: AuxiliaryDataContainer<Data> = try self.dataServiceProvider.get(auxKeyContainer: keyContainer)
        let decoder = JSONDecoder()
        decoder.userInfo[CSDLDocument.csdlInfoKey] = ESPMContainerMetadata.document
        let productTexts = try decoder.decode([ESPMContainerFmwk.ProductText].self, from: dataContainer.get())

        return productTexts
    }
}
