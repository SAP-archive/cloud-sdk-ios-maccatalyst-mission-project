//
// TutorialApp
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 29/04/20
//

import Foundation

enum Comsapedmsampleservicev2CollectionType: String {
    case productTexts = "ProductTexts"
    case salesOrderItems = "SalesOrderItems"
    case salesOrderHeaders = "SalesOrderHeaders"
    case suppliers = "Suppliers"
    case purchaseOrderHeaders = "PurchaseOrderHeaders"
    case customers = "Customers"
    case products = "Products"
    case stock = "Stock"
    case productCategories = "ProductCategories"
    case purchaseOrderItems = "PurchaseOrderItems"
    case none = ""
    static let all = [productTexts, salesOrderItems, salesOrderHeaders, suppliers, purchaseOrderHeaders, customers, products, stock, productCategories, purchaseOrderItems]
}
