// # Proxy Compiler 21.5.2

import Foundation
import SAPOData

public class ESPMContainerMetadata {
    private static let document__lock = ObjectBase()

    private static var document_: CSDLDocument = ESPMContainerMetadata.resolve()

    public static let lock: MetadataLock = xs_immortalize(MetadataLock())

    public static var document: CSDLDocument {
        get {
            objc_sync_enter(document__lock)
            defer { objc_sync_exit(document__lock) }
            do {
                return ESPMContainerMetadata.document_
            }
        }
        set(value) {
            objc_sync_enter(document__lock)
            defer { objc_sync_exit(document__lock) }
            do {
                ESPMContainerMetadata.document_ = value
            }
        }
    }

    private static func resolve() -> CSDLDocument {
        try! ESPMContainerFactory.registerAll()
        ESPMContainerMetadataParser.parsed.hasGeneratedProxies = true
        return ESPMContainerMetadataParser.parsed.immortalize()
    }

    public class ComplexTypes {
        private static let address__lock = ObjectBase()

        private static var address_: ComplexType = ESPMContainerMetadataParser.parsed.complexType(withName: "ESPM.Address")

        public static var address: ComplexType {
            get {
                objc_sync_enter(address__lock)
                defer { objc_sync_exit(address__lock) }
                do {
                    return ESPMContainerMetadata.ComplexTypes.address_
                }
            }
            set(value) {
                objc_sync_enter(address__lock)
                defer { objc_sync_exit(address__lock) }
                do {
                    ESPMContainerMetadata.ComplexTypes.address_ = value
                }
            }
        }
    }

    public class EntityTypes {
        private static let customer__lock = ObjectBase()

        private static var customer_: EntityType = ESPMContainerMetadataParser.parsed.entityType(withName: "ESPM.Customer")

        private static let product__lock = ObjectBase()

        private static var product_: EntityType = ESPMContainerMetadataParser.parsed.entityType(withName: "ESPM.Product")

        private static let productCategory__lock = ObjectBase()

        private static var productCategory_: EntityType = ESPMContainerMetadataParser.parsed.entityType(withName: "ESPM.ProductCategory")

        private static let productText__lock = ObjectBase()

        private static var productText_: EntityType = ESPMContainerMetadataParser.parsed.entityType(withName: "ESPM.ProductText")

        private static let purchaseOrderHeader__lock = ObjectBase()

        private static var purchaseOrderHeader_: EntityType = ESPMContainerMetadataParser.parsed.entityType(withName: "ESPM.PurchaseOrderHeader")

        private static let purchaseOrderItem__lock = ObjectBase()

        private static var purchaseOrderItem_: EntityType = ESPMContainerMetadataParser.parsed.entityType(withName: "ESPM.PurchaseOrderItem")

        private static let salesOrderHeader__lock = ObjectBase()

        private static var salesOrderHeader_: EntityType = ESPMContainerMetadataParser.parsed.entityType(withName: "ESPM.SalesOrderHeader")

        private static let salesOrderItem__lock = ObjectBase()

        private static var salesOrderItem_: EntityType = ESPMContainerMetadataParser.parsed.entityType(withName: "ESPM.SalesOrderItem")

        private static let stock__lock = ObjectBase()

        private static var stock_: EntityType = ESPMContainerMetadataParser.parsed.entityType(withName: "ESPM.Stock")

        private static let supplier__lock = ObjectBase()

        private static var supplier_: EntityType = ESPMContainerMetadataParser.parsed.entityType(withName: "ESPM.Supplier")

        public static var customer: EntityType {
            get {
                objc_sync_enter(customer__lock)
                defer { objc_sync_exit(customer__lock) }
                do {
                    return ESPMContainerMetadata.EntityTypes.customer_
                }
            }
            set(value) {
                objc_sync_enter(customer__lock)
                defer { objc_sync_exit(customer__lock) }
                do {
                    ESPMContainerMetadata.EntityTypes.customer_ = value
                }
            }
        }

        public static var product: EntityType {
            get {
                objc_sync_enter(product__lock)
                defer { objc_sync_exit(product__lock) }
                do {
                    return ESPMContainerMetadata.EntityTypes.product_
                }
            }
            set(value) {
                objc_sync_enter(product__lock)
                defer { objc_sync_exit(product__lock) }
                do {
                    ESPMContainerMetadata.EntityTypes.product_ = value
                }
            }
        }

        public static var productCategory: EntityType {
            get {
                objc_sync_enter(productCategory__lock)
                defer { objc_sync_exit(productCategory__lock) }
                do {
                    return ESPMContainerMetadata.EntityTypes.productCategory_
                }
            }
            set(value) {
                objc_sync_enter(productCategory__lock)
                defer { objc_sync_exit(productCategory__lock) }
                do {
                    ESPMContainerMetadata.EntityTypes.productCategory_ = value
                }
            }
        }

        public static var productText: EntityType {
            get {
                objc_sync_enter(productText__lock)
                defer { objc_sync_exit(productText__lock) }
                do {
                    return ESPMContainerMetadata.EntityTypes.productText_
                }
            }
            set(value) {
                objc_sync_enter(productText__lock)
                defer { objc_sync_exit(productText__lock) }
                do {
                    ESPMContainerMetadata.EntityTypes.productText_ = value
                }
            }
        }

        public static var purchaseOrderHeader: EntityType {
            get {
                objc_sync_enter(purchaseOrderHeader__lock)
                defer { objc_sync_exit(purchaseOrderHeader__lock) }
                do {
                    return ESPMContainerMetadata.EntityTypes.purchaseOrderHeader_
                }
            }
            set(value) {
                objc_sync_enter(purchaseOrderHeader__lock)
                defer { objc_sync_exit(purchaseOrderHeader__lock) }
                do {
                    ESPMContainerMetadata.EntityTypes.purchaseOrderHeader_ = value
                }
            }
        }

        public static var purchaseOrderItem: EntityType {
            get {
                objc_sync_enter(purchaseOrderItem__lock)
                defer { objc_sync_exit(purchaseOrderItem__lock) }
                do {
                    return ESPMContainerMetadata.EntityTypes.purchaseOrderItem_
                }
            }
            set(value) {
                objc_sync_enter(purchaseOrderItem__lock)
                defer { objc_sync_exit(purchaseOrderItem__lock) }
                do {
                    ESPMContainerMetadata.EntityTypes.purchaseOrderItem_ = value
                }
            }
        }

        public static var salesOrderHeader: EntityType {
            get {
                objc_sync_enter(salesOrderHeader__lock)
                defer { objc_sync_exit(salesOrderHeader__lock) }
                do {
                    return ESPMContainerMetadata.EntityTypes.salesOrderHeader_
                }
            }
            set(value) {
                objc_sync_enter(salesOrderHeader__lock)
                defer { objc_sync_exit(salesOrderHeader__lock) }
                do {
                    ESPMContainerMetadata.EntityTypes.salesOrderHeader_ = value
                }
            }
        }

        public static var salesOrderItem: EntityType {
            get {
                objc_sync_enter(salesOrderItem__lock)
                defer { objc_sync_exit(salesOrderItem__lock) }
                do {
                    return ESPMContainerMetadata.EntityTypes.salesOrderItem_
                }
            }
            set(value) {
                objc_sync_enter(salesOrderItem__lock)
                defer { objc_sync_exit(salesOrderItem__lock) }
                do {
                    ESPMContainerMetadata.EntityTypes.salesOrderItem_ = value
                }
            }
        }

        public static var stock: EntityType {
            get {
                objc_sync_enter(stock__lock)
                defer { objc_sync_exit(stock__lock) }
                do {
                    return ESPMContainerMetadata.EntityTypes.stock_
                }
            }
            set(value) {
                objc_sync_enter(stock__lock)
                defer { objc_sync_exit(stock__lock) }
                do {
                    ESPMContainerMetadata.EntityTypes.stock_ = value
                }
            }
        }

        public static var supplier: EntityType {
            get {
                objc_sync_enter(supplier__lock)
                defer { objc_sync_exit(supplier__lock) }
                do {
                    return ESPMContainerMetadata.EntityTypes.supplier_
                }
            }
            set(value) {
                objc_sync_enter(supplier__lock)
                defer { objc_sync_exit(supplier__lock) }
                do {
                    ESPMContainerMetadata.EntityTypes.supplier_ = value
                }
            }
        }
    }

    public class EntitySets {
        private static let customers__lock = ObjectBase()

        private static var customers_: EntitySet = ESPMContainerMetadataParser.parsed.entitySet(withName: "Customers")

        private static let productCategories__lock = ObjectBase()

        private static var productCategories_: EntitySet = ESPMContainerMetadataParser.parsed.entitySet(withName: "ProductCategories")

        private static let productTexts__lock = ObjectBase()

        private static var productTexts_: EntitySet = ESPMContainerMetadataParser.parsed.entitySet(withName: "ProductTexts")

        private static let products__lock = ObjectBase()

        private static var products_: EntitySet = ESPMContainerMetadataParser.parsed.entitySet(withName: "Products")

        private static let purchaseOrderHeaders__lock = ObjectBase()

        private static var purchaseOrderHeaders_: EntitySet = ESPMContainerMetadataParser.parsed.entitySet(withName: "PurchaseOrderHeaders")

        private static let purchaseOrderItems__lock = ObjectBase()

        private static var purchaseOrderItems_: EntitySet = ESPMContainerMetadataParser.parsed.entitySet(withName: "PurchaseOrderItems")

        private static let salesOrderHeaders__lock = ObjectBase()

        private static var salesOrderHeaders_: EntitySet = ESPMContainerMetadataParser.parsed.entitySet(withName: "SalesOrderHeaders")

        private static let salesOrderItems__lock = ObjectBase()

        private static var salesOrderItems_: EntitySet = ESPMContainerMetadataParser.parsed.entitySet(withName: "SalesOrderItems")

        private static let stock__lock = ObjectBase()

        private static var stock_: EntitySet = ESPMContainerMetadataParser.parsed.entitySet(withName: "Stock")

        private static let suppliers__lock = ObjectBase()

        private static var suppliers_: EntitySet = ESPMContainerMetadataParser.parsed.entitySet(withName: "Suppliers")

        public static var customers: EntitySet {
            get {
                objc_sync_enter(customers__lock)
                defer { objc_sync_exit(customers__lock) }
                do {
                    return ESPMContainerMetadata.EntitySets.customers_
                }
            }
            set(value) {
                objc_sync_enter(customers__lock)
                defer { objc_sync_exit(customers__lock) }
                do {
                    ESPMContainerMetadata.EntitySets.customers_ = value
                }
            }
        }

        public static var productCategories: EntitySet {
            get {
                objc_sync_enter(productCategories__lock)
                defer { objc_sync_exit(productCategories__lock) }
                do {
                    return ESPMContainerMetadata.EntitySets.productCategories_
                }
            }
            set(value) {
                objc_sync_enter(productCategories__lock)
                defer { objc_sync_exit(productCategories__lock) }
                do {
                    ESPMContainerMetadata.EntitySets.productCategories_ = value
                }
            }
        }

        public static var productTexts: EntitySet {
            get {
                objc_sync_enter(productTexts__lock)
                defer { objc_sync_exit(productTexts__lock) }
                do {
                    return ESPMContainerMetadata.EntitySets.productTexts_
                }
            }
            set(value) {
                objc_sync_enter(productTexts__lock)
                defer { objc_sync_exit(productTexts__lock) }
                do {
                    ESPMContainerMetadata.EntitySets.productTexts_ = value
                }
            }
        }

        public static var products: EntitySet {
            get {
                objc_sync_enter(products__lock)
                defer { objc_sync_exit(products__lock) }
                do {
                    return ESPMContainerMetadata.EntitySets.products_
                }
            }
            set(value) {
                objc_sync_enter(products__lock)
                defer { objc_sync_exit(products__lock) }
                do {
                    ESPMContainerMetadata.EntitySets.products_ = value
                }
            }
        }

        public static var purchaseOrderHeaders: EntitySet {
            get {
                objc_sync_enter(purchaseOrderHeaders__lock)
                defer { objc_sync_exit(purchaseOrderHeaders__lock) }
                do {
                    return ESPMContainerMetadata.EntitySets.purchaseOrderHeaders_
                }
            }
            set(value) {
                objc_sync_enter(purchaseOrderHeaders__lock)
                defer { objc_sync_exit(purchaseOrderHeaders__lock) }
                do {
                    ESPMContainerMetadata.EntitySets.purchaseOrderHeaders_ = value
                }
            }
        }

        public static var purchaseOrderItems: EntitySet {
            get {
                objc_sync_enter(purchaseOrderItems__lock)
                defer { objc_sync_exit(purchaseOrderItems__lock) }
                do {
                    return ESPMContainerMetadata.EntitySets.purchaseOrderItems_
                }
            }
            set(value) {
                objc_sync_enter(purchaseOrderItems__lock)
                defer { objc_sync_exit(purchaseOrderItems__lock) }
                do {
                    ESPMContainerMetadata.EntitySets.purchaseOrderItems_ = value
                }
            }
        }

        public static var salesOrderHeaders: EntitySet {
            get {
                objc_sync_enter(salesOrderHeaders__lock)
                defer { objc_sync_exit(salesOrderHeaders__lock) }
                do {
                    return ESPMContainerMetadata.EntitySets.salesOrderHeaders_
                }
            }
            set(value) {
                objc_sync_enter(salesOrderHeaders__lock)
                defer { objc_sync_exit(salesOrderHeaders__lock) }
                do {
                    ESPMContainerMetadata.EntitySets.salesOrderHeaders_ = value
                }
            }
        }

        public static var salesOrderItems: EntitySet {
            get {
                objc_sync_enter(salesOrderItems__lock)
                defer { objc_sync_exit(salesOrderItems__lock) }
                do {
                    return ESPMContainerMetadata.EntitySets.salesOrderItems_
                }
            }
            set(value) {
                objc_sync_enter(salesOrderItems__lock)
                defer { objc_sync_exit(salesOrderItems__lock) }
                do {
                    ESPMContainerMetadata.EntitySets.salesOrderItems_ = value
                }
            }
        }

        public static var stock: EntitySet {
            get {
                objc_sync_enter(stock__lock)
                defer { objc_sync_exit(stock__lock) }
                do {
                    return ESPMContainerMetadata.EntitySets.stock_
                }
            }
            set(value) {
                objc_sync_enter(stock__lock)
                defer { objc_sync_exit(stock__lock) }
                do {
                    ESPMContainerMetadata.EntitySets.stock_ = value
                }
            }
        }

        public static var suppliers: EntitySet {
            get {
                objc_sync_enter(suppliers__lock)
                defer { objc_sync_exit(suppliers__lock) }
                do {
                    return ESPMContainerMetadata.EntitySets.suppliers_
                }
            }
            set(value) {
                objc_sync_enter(suppliers__lock)
                defer { objc_sync_exit(suppliers__lock) }
                do {
                    ESPMContainerMetadata.EntitySets.suppliers_ = value
                }
            }
        }
    }

    public class ActionImports {
        private static let generateSamplePurchaseOrders__lock = ObjectBase()

        private static var generateSamplePurchaseOrders_: DataMethod = ESPMContainerMetadataParser.parsed.dataMethod(withName: "GenerateSamplePurchaseOrders")

        private static let generateSampleSalesOrders__lock = ObjectBase()

        private static var generateSampleSalesOrders_: DataMethod = ESPMContainerMetadataParser.parsed.dataMethod(withName: "GenerateSampleSalesOrders")

        private static let resetSampleData__lock = ObjectBase()

        private static var resetSampleData_: DataMethod = ESPMContainerMetadataParser.parsed.dataMethod(withName: "ResetSampleData")

        private static let updateSalesOrderStatus__lock = ObjectBase()

        private static var updateSalesOrderStatus_: DataMethod = ESPMContainerMetadataParser.parsed.dataMethod(withName: "UpdateSalesOrderStatus")

        public static var generateSamplePurchaseOrders: DataMethod {
            get {
                objc_sync_enter(generateSamplePurchaseOrders__lock)
                defer { objc_sync_exit(generateSamplePurchaseOrders__lock) }
                do {
                    return ESPMContainerMetadata.ActionImports.generateSamplePurchaseOrders_
                }
            }
            set(value) {
                objc_sync_enter(generateSamplePurchaseOrders__lock)
                defer { objc_sync_exit(generateSamplePurchaseOrders__lock) }
                do {
                    ESPMContainerMetadata.ActionImports.generateSamplePurchaseOrders_ = value
                }
            }
        }

        public static var generateSampleSalesOrders: DataMethod {
            get {
                objc_sync_enter(generateSampleSalesOrders__lock)
                defer { objc_sync_exit(generateSampleSalesOrders__lock) }
                do {
                    return ESPMContainerMetadata.ActionImports.generateSampleSalesOrders_
                }
            }
            set(value) {
                objc_sync_enter(generateSampleSalesOrders__lock)
                defer { objc_sync_exit(generateSampleSalesOrders__lock) }
                do {
                    ESPMContainerMetadata.ActionImports.generateSampleSalesOrders_ = value
                }
            }
        }

        public static var resetSampleData: DataMethod {
            get {
                objc_sync_enter(resetSampleData__lock)
                defer { objc_sync_exit(resetSampleData__lock) }
                do {
                    return ESPMContainerMetadata.ActionImports.resetSampleData_
                }
            }
            set(value) {
                objc_sync_enter(resetSampleData__lock)
                defer { objc_sync_exit(resetSampleData__lock) }
                do {
                    ESPMContainerMetadata.ActionImports.resetSampleData_ = value
                }
            }
        }

        public static var updateSalesOrderStatus: DataMethod {
            get {
                objc_sync_enter(updateSalesOrderStatus__lock)
                defer { objc_sync_exit(updateSalesOrderStatus__lock) }
                do {
                    return ESPMContainerMetadata.ActionImports.updateSalesOrderStatus_
                }
            }
            set(value) {
                objc_sync_enter(updateSalesOrderStatus__lock)
                defer { objc_sync_exit(updateSalesOrderStatus__lock) }
                do {
                    ESPMContainerMetadata.ActionImports.updateSalesOrderStatus_ = value
                }
            }
        }
    }
}
