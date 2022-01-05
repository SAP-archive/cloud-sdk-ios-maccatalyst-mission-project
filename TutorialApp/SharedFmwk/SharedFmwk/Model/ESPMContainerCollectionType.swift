//
// TutorialApp
//
// Created by SAP BTP SDK Assistant for iOS v7.0.0 application on 04/01/22
//

import Foundation

public enum ESPMContainerCollectionType: CaseIterable {
    case salesOrderItems
    case productTexts
    case stock
    case purchaseOrderHeaders
    case customers
    case suppliers
    case products
    case productCategories
    case salesOrderHeaders
    case purchaseOrderItems

    public init?(rawValue: String) {
        guard let type = ESPMContainerCollectionType.allCases.first(where: { rawValue == $0.description }) else {
            return nil
        }
        self = type
    }

    public var description: String {
        switch self {
        case .salesOrderItems: return "SalesOrderItems"
        case .productTexts: return "ProductTexts"
        case .stock: return "Stock"
        case .purchaseOrderHeaders: return "PurchaseOrderHeaders"
        case .customers: return "Customers"
        case .suppliers: return "Suppliers"
        case .products: return "Products"
        case .productCategories: return "ProductCategories"
        case .salesOrderHeaders: return "SalesOrderHeaders"
        case .purchaseOrderItems: return "PurchaseOrderItems"
        }
    }
}
