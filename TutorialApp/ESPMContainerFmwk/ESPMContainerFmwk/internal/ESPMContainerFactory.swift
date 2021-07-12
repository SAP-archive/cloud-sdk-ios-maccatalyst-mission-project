// # Proxy Compiler 21.5.2

import Foundation
import SAPOData

internal class ESPMContainerFactory {
    static func registerAll() throws {
        ESPMContainerMetadata.ComplexTypes.address.registerFactory(ObjectFactory.with(create: { Address(withDefaults: false) }, createWithDecoder: { d in try Address(from: d) }))
        ESPMContainerMetadata.EntityTypes.customer.registerFactory(ObjectFactory.with(create: { Customer(withDefaults: false) }, sparse: { m in Customer(withDefaults: false, withIndexMap: m) }, decode: { d in try Customer(from: d) }))
        ESPMContainerMetadata.EntityTypes.product.registerFactory(ObjectFactory.with(create: { Product(withDefaults: false) }, sparse: { m in Product(withDefaults: false, withIndexMap: m) }, decode: { d in try Product(from: d) }))
        ESPMContainerMetadata.EntityTypes.productCategory.registerFactory(ObjectFactory.with(create: { ProductCategory(withDefaults: false) }, sparse: { m in ProductCategory(withDefaults: false, withIndexMap: m) }, decode: { d in try ProductCategory(from: d) }))
        ESPMContainerMetadata.EntityTypes.productText.registerFactory(ObjectFactory.with(create: { ProductText(withDefaults: false) }, sparse: { m in ProductText(withDefaults: false, withIndexMap: m) }, decode: { d in try ProductText(from: d) }))
        ESPMContainerMetadata.EntityTypes.purchaseOrderHeader.registerFactory(ObjectFactory.with(create: { PurchaseOrderHeader(withDefaults: false) }, sparse: { m in PurchaseOrderHeader(withDefaults: false, withIndexMap: m) }, decode: { d in try PurchaseOrderHeader(from: d) }))
        ESPMContainerMetadata.EntityTypes.purchaseOrderItem.registerFactory(ObjectFactory.with(create: { PurchaseOrderItem(withDefaults: false) }, sparse: { m in PurchaseOrderItem(withDefaults: false, withIndexMap: m) }, decode: { d in try PurchaseOrderItem(from: d) }))
        ESPMContainerMetadata.EntityTypes.salesOrderHeader.registerFactory(ObjectFactory.with(create: { SalesOrderHeader(withDefaults: false) }, sparse: { m in SalesOrderHeader(withDefaults: false, withIndexMap: m) }, decode: { d in try SalesOrderHeader(from: d) }))
        ESPMContainerMetadata.EntityTypes.salesOrderItem.registerFactory(ObjectFactory.with(create: { SalesOrderItem(withDefaults: false) }, sparse: { m in SalesOrderItem(withDefaults: false, withIndexMap: m) }, decode: { d in try SalesOrderItem(from: d) }))
        ESPMContainerMetadata.EntityTypes.stock.registerFactory(ObjectFactory.with(create: { Stock(withDefaults: false) }, sparse: { m in Stock(withDefaults: false, withIndexMap: m) }, decode: { d in try Stock(from: d) }))
        ESPMContainerMetadata.EntityTypes.supplier.registerFactory(ObjectFactory.with(create: { Supplier(withDefaults: false) }, sparse: { m in Supplier(withDefaults: false, withIndexMap: m) }, decode: { d in try Supplier(from: d) }))
        ESPMContainerStaticResolver.resolve()
    }
}
