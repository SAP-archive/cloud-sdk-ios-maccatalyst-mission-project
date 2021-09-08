//
// TutorialApp
//
// Created by SAP BTP SDK Assistant for iOS application on 08/09/21
//

import Foundation

public enum ESPMContainerCollectionType: CaseIterable {
    case suppliers
    case products
    case stock
    case customers
    case productCategories
    case purchaseOrderItems
    case productTexts
    case purchaseOrderHeaders
    case salesOrderHeaders
    case salesOrderItems

    public init?(rawValue: String) {
        guard let type = ESPMContainerCollectionType.allCases.first(where: { rawValue == $0.description }) else {
            return nil
        }
        self = type
    }

    public var description: String {
        switch self {
        case .suppliers: return "Suppliers"
        case .products: return "Products"
        case .stock: return "Stock"
        case .customers: return "Customers"
        case .productCategories: return "ProductCategories"
        case .purchaseOrderItems: return "PurchaseOrderItems"
        case .productTexts: return "ProductTexts"
        case .purchaseOrderHeaders: return "PurchaseOrderHeaders"
        case .salesOrderHeaders: return "SalesOrderHeaders"
        case .salesOrderItems: return "SalesOrderItems"
        }
    }
}
