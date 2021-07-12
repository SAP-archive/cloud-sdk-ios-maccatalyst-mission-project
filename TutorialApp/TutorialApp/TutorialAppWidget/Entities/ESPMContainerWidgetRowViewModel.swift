//
// TutorialApp
//
// Created by SAP BTP SDK Assistant for iOS application on 12/07/21
//

import ESPMContainerFmwk
import Foundation

extension ESPMContainerFmwk.Supplier: WidgetRowViewModel {
    public var value: String { "\(supplierID!)" }
    public var key: String { "SupplierId" }
    public var image: String? { nil }
}

extension ESPMContainerFmwk.Product: WidgetRowViewModel {
    public var value: String { "\(productID!)" }
    public var key: String { "ProductId" }
    public var image: String? { nil }
}

extension ESPMContainerFmwk.PurchaseOrderItem: WidgetRowViewModel {
    public var value: String { "\(itemNumber!), \(purchaseOrderID!)" }
    public var key: String { "ItemNumber, PurchaseOrderId" }
    public var image: String? { nil }
}

extension ESPMContainerFmwk.Customer: WidgetRowViewModel {
    public var value: String { "\(customerID!)" }
    public var key: String { "CustomerId" }
    public var image: String? { nil }
}

extension ESPMContainerFmwk.ProductText: WidgetRowViewModel {
    public var value: String { "\(id!)" }
    public var key: String { "Id" }
    public var image: String? { nil }
}

extension ESPMContainerFmwk.Stock: WidgetRowViewModel {
    public var value: String { "\(productID!)" }
    public var key: String { "ProductId" }
    public var image: String? { nil }
}

extension ESPMContainerFmwk.PurchaseOrderHeader: WidgetRowViewModel {
    public var value: String { "\(purchaseOrderID!)" }
    public var key: String { "PurchaseOrderId" }
    public var image: String? { nil }
}

extension ESPMContainerFmwk.SalesOrderHeader: WidgetRowViewModel {
    public var value: String { "\(salesOrderID!)" }
    public var key: String { "SalesOrderId" }
    public var image: String? { nil }
}

extension ESPMContainerFmwk.SalesOrderItem: WidgetRowViewModel {
    public var value: String { "\(itemNumber!), \(salesOrderID!)" }
    public var key: String { "ItemNumber, SalesOrderId" }
    public var image: String? { nil }
}

extension ESPMContainerFmwk.ProductCategory: WidgetRowViewModel {
    public var value: String { "\(category!)" }
    public var key: String { "Category" }
    public var image: String? { nil }
}
