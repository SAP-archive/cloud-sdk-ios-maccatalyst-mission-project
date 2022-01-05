// # Proxy Compiler 21.11.3

import Foundation
import SAPOData

open class SalesOrderItem: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static let currencyCode__lock = ObjectBase()

    private static var currencyCode_: Property = ESPMContainerMetadata.EntityTypes.salesOrderItem.property(withName: "CurrencyCode")

    private static let deliveryDate__lock = ObjectBase()

    private static var deliveryDate_: Property = ESPMContainerMetadata.EntityTypes.salesOrderItem.property(withName: "DeliveryDate")

    private static let grossAmount__lock = ObjectBase()

    private static var grossAmount_: Property = ESPMContainerMetadata.EntityTypes.salesOrderItem.property(withName: "GrossAmount")

    private static let itemNumber__lock = ObjectBase()

    private static var itemNumber_: Property = ESPMContainerMetadata.EntityTypes.salesOrderItem.property(withName: "ItemNumber")

    private static let netAmount__lock = ObjectBase()

    private static var netAmount_: Property = ESPMContainerMetadata.EntityTypes.salesOrderItem.property(withName: "NetAmount")

    private static let productID__lock = ObjectBase()

    private static var productID_: Property = ESPMContainerMetadata.EntityTypes.salesOrderItem.property(withName: "ProductId")

    private static let quantity__lock = ObjectBase()

    private static var quantity_: Property = ESPMContainerMetadata.EntityTypes.salesOrderItem.property(withName: "Quantity")

    private static let quantityUnit__lock = ObjectBase()

    private static var quantityUnit_: Property = ESPMContainerMetadata.EntityTypes.salesOrderItem.property(withName: "QuantityUnit")

    private static let salesOrderID__lock = ObjectBase()

    private static var salesOrderID_: Property = ESPMContainerMetadata.EntityTypes.salesOrderItem.property(withName: "SalesOrderId")

    private static let taxAmount__lock = ObjectBase()

    private static var taxAmount_: Property = ESPMContainerMetadata.EntityTypes.salesOrderItem.property(withName: "TaxAmount")

    private static let header__lock = ObjectBase()

    private static var header_: Property = ESPMContainerMetadata.EntityTypes.salesOrderItem.property(withName: "Header")

    private static let productDetails__lock = ObjectBase()

    private static var productDetails_: Property = ESPMContainerMetadata.EntityTypes.salesOrderItem.property(withName: "ProductDetails")

    public init(withDefaults: Bool = true, withIndexMap: SparseIndexMap? = nil) {
        super.init(withDefaults: withDefaults, type: ESPMContainerMetadata.EntityTypes.salesOrderItem, withIndexMap: withIndexMap)
    }

    open class func array(from: EntityValueList) -> [SalesOrderItem] {
        return ArrayConverter.convert(from.toArray(), [SalesOrderItem]())
    }

    open func copy() -> SalesOrderItem {
        return CastRequired<SalesOrderItem>.from(copyEntity())
    }

    open class var currencyCode: Property {
        get {
            objc_sync_enter(currencyCode__lock)
            defer { objc_sync_exit(currencyCode__lock) }
            do {
                return SalesOrderItem.currencyCode_
            }
        }
        set(value) {
            objc_sync_enter(currencyCode__lock)
            defer { objc_sync_exit(currencyCode__lock) }
            do {
                SalesOrderItem.currencyCode_ = value
            }
        }
    }

    open var currencyCode: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SalesOrderItem.currencyCode))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrderItem.currencyCode, to: StringValue.of(optional: value))
        }
    }

    open class var deliveryDate: Property {
        get {
            objc_sync_enter(deliveryDate__lock)
            defer { objc_sync_exit(deliveryDate__lock) }
            do {
                return SalesOrderItem.deliveryDate_
            }
        }
        set(value) {
            objc_sync_enter(deliveryDate__lock)
            defer { objc_sync_exit(deliveryDate__lock) }
            do {
                SalesOrderItem.deliveryDate_ = value
            }
        }
    }

    open var deliveryDate: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: SalesOrderItem.deliveryDate))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrderItem.deliveryDate, to: value)
        }
    }

    open class var grossAmount: Property {
        get {
            objc_sync_enter(grossAmount__lock)
            defer { objc_sync_exit(grossAmount__lock) }
            do {
                return SalesOrderItem.grossAmount_
            }
        }
        set(value) {
            objc_sync_enter(grossAmount__lock)
            defer { objc_sync_exit(grossAmount__lock) }
            do {
                SalesOrderItem.grossAmount_ = value
            }
        }
    }

    open var grossAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: SalesOrderItem.grossAmount))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrderItem.grossAmount, to: DecimalValue.of(optional: value))
        }
    }

    open class var header: Property {
        get {
            objc_sync_enter(header__lock)
            defer { objc_sync_exit(header__lock) }
            do {
                return SalesOrderItem.header_
            }
        }
        set(value) {
            objc_sync_enter(header__lock)
            defer { objc_sync_exit(header__lock) }
            do {
                SalesOrderItem.header_ = value
            }
        }
    }

    open var header: SalesOrderHeader? {
        get {
            return CastOptional<SalesOrderHeader>.from(self.optionalValue(for: SalesOrderItem.header))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrderItem.header, to: value)
        }
    }

    override open var isProxy: Bool {
        return true
    }

    open class var itemNumber: Property {
        get {
            objc_sync_enter(itemNumber__lock)
            defer { objc_sync_exit(itemNumber__lock) }
            do {
                return SalesOrderItem.itemNumber_
            }
        }
        set(value) {
            objc_sync_enter(itemNumber__lock)
            defer { objc_sync_exit(itemNumber__lock) }
            do {
                SalesOrderItem.itemNumber_ = value
            }
        }
    }

    open var itemNumber: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: SalesOrderItem.itemNumber))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrderItem.itemNumber, to: IntValue.of(optional: value))
        }
    }

    open class func key(itemNumber: Int?, salesOrderID: String?) -> EntityKey {
        return EntityKey().with(name: "ItemNumber", value: IntValue.of(optional: itemNumber)).with(name: "SalesOrderId", value: StringValue.of(optional: salesOrderID))
    }

    open class var netAmount: Property {
        get {
            objc_sync_enter(netAmount__lock)
            defer { objc_sync_exit(netAmount__lock) }
            do {
                return SalesOrderItem.netAmount_
            }
        }
        set(value) {
            objc_sync_enter(netAmount__lock)
            defer { objc_sync_exit(netAmount__lock) }
            do {
                SalesOrderItem.netAmount_ = value
            }
        }
    }

    open var netAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: SalesOrderItem.netAmount))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrderItem.netAmount, to: DecimalValue.of(optional: value))
        }
    }

    open var old: SalesOrderItem {
        return CastRequired<SalesOrderItem>.from(self.oldEntity)
    }

    open class var productDetails: Property {
        get {
            objc_sync_enter(productDetails__lock)
            defer { objc_sync_exit(productDetails__lock) }
            do {
                return SalesOrderItem.productDetails_
            }
        }
        set(value) {
            objc_sync_enter(productDetails__lock)
            defer { objc_sync_exit(productDetails__lock) }
            do {
                SalesOrderItem.productDetails_ = value
            }
        }
    }

    open var productDetails: Product? {
        get {
            return CastOptional<Product>.from(self.optionalValue(for: SalesOrderItem.productDetails))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrderItem.productDetails, to: value)
        }
    }

    open class var productID: Property {
        get {
            objc_sync_enter(productID__lock)
            defer { objc_sync_exit(productID__lock) }
            do {
                return SalesOrderItem.productID_
            }
        }
        set(value) {
            objc_sync_enter(productID__lock)
            defer { objc_sync_exit(productID__lock) }
            do {
                SalesOrderItem.productID_ = value
            }
        }
    }

    open var productID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SalesOrderItem.productID))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrderItem.productID, to: StringValue.of(optional: value))
        }
    }

    open class var quantity: Property {
        get {
            objc_sync_enter(quantity__lock)
            defer { objc_sync_exit(quantity__lock) }
            do {
                return SalesOrderItem.quantity_
            }
        }
        set(value) {
            objc_sync_enter(quantity__lock)
            defer { objc_sync_exit(quantity__lock) }
            do {
                SalesOrderItem.quantity_ = value
            }
        }
    }

    open var quantity: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: SalesOrderItem.quantity))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrderItem.quantity, to: DecimalValue.of(optional: value))
        }
    }

    open class var quantityUnit: Property {
        get {
            objc_sync_enter(quantityUnit__lock)
            defer { objc_sync_exit(quantityUnit__lock) }
            do {
                return SalesOrderItem.quantityUnit_
            }
        }
        set(value) {
            objc_sync_enter(quantityUnit__lock)
            defer { objc_sync_exit(quantityUnit__lock) }
            do {
                SalesOrderItem.quantityUnit_ = value
            }
        }
    }

    open var quantityUnit: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SalesOrderItem.quantityUnit))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrderItem.quantityUnit, to: StringValue.of(optional: value))
        }
    }

    open class var salesOrderID: Property {
        get {
            objc_sync_enter(salesOrderID__lock)
            defer { objc_sync_exit(salesOrderID__lock) }
            do {
                return SalesOrderItem.salesOrderID_
            }
        }
        set(value) {
            objc_sync_enter(salesOrderID__lock)
            defer { objc_sync_exit(salesOrderID__lock) }
            do {
                SalesOrderItem.salesOrderID_ = value
            }
        }
    }

    open var salesOrderID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SalesOrderItem.salesOrderID))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrderItem.salesOrderID, to: StringValue.of(optional: value))
        }
    }

    open class var taxAmount: Property {
        get {
            objc_sync_enter(taxAmount__lock)
            defer { objc_sync_exit(taxAmount__lock) }
            do {
                return SalesOrderItem.taxAmount_
            }
        }
        set(value) {
            objc_sync_enter(taxAmount__lock)
            defer { objc_sync_exit(taxAmount__lock) }
            do {
                SalesOrderItem.taxAmount_ = value
            }
        }
    }

    open var taxAmount: BigDecimal? {
        get {
            return DecimalValue.optional(optionalValue(for: SalesOrderItem.taxAmount))
        }
        set(value) {
            setOptionalValue(for: SalesOrderItem.taxAmount, to: DecimalValue.of(optional: value))
        }
    }
}
