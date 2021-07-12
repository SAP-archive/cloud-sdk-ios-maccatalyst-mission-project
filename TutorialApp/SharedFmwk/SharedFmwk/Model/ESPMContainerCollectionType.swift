//
// TutorialApp
//
// Created by SAP BTP SDK Assistant for iOS application on 12/07/21
//

import Foundation

public enum ESPMContainerCollectionType: CaseIterable {
    case purchaseOrderItems
    case suppliers
    case purchaseOrderHeaders
    case salesOrderHeaders
    case salesOrderItems
    case products
    case productCategories
    case stock
    case customers
    case productTexts

    public init?(rawValue: String) {
        guard let type = ESPMContainerCollectionType.allCases.first(where: { rawValue == $0.description }) else {
            return nil
        }
        self = type
    }

    public var description: String {
        switch self {
        case .purchaseOrderItems: return "PurchaseOrderItems"
        case .suppliers: return "Suppliers"
        case .purchaseOrderHeaders: return "PurchaseOrderHeaders"
        case .salesOrderHeaders: return "SalesOrderHeaders"
        case .salesOrderItems: return "SalesOrderItems"
        case .products: return "Products"
        case .productCategories: return "ProductCategories"
        case .stock: return "Stock"
        case .customers: return "Customers"
        case .productTexts: return "ProductTexts"
        }
    }
}
