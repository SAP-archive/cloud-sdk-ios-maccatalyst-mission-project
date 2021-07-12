// # Proxy Compiler 21.5.2

import Foundation
import SAPOData

open class PurchaseOrderItem: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static let currencyCode__lock = ObjectBase()

    private static var currencyCode_: Property = ESPMContainerMetadata.EntityTypes.purchaseOrderItem.property(withName: "CurrencyCode")

    private static let grossAmount__lock = ObjectBase()

    private static var grossAmount_: Property = ESPMContainerMetadata.EntityTypes.purchaseOrderItem.property(withName: "GrossAmount")

    private static let itemNumber__lock = ObjectBase()

    private static var itemNumber_: Property = ESPMContainerMetadata.EntityTypes.purchaseOrderItem.property(withName: "ItemNumber")

    private static let netAmount__lock = ObjectBase()

    private static var netAmount_: Property = ESPMContainerMetadata.EntityTypes.purchaseOrderItem.property(withName: "NetAmount")

    private static let productID__lock = ObjectBase()

    private static var productID_: Property = ESPMContainerMetadata.EntityTypes.purchaseOrderItem.property(withName: "ProductId")

    private static let purchaseOrderID__lock = ObjectBase()

    private static var purchaseOrderID_: Property = ESPMContainerMetadata.EntityTypes.purchaseOrderItem.property(withName: "PurchaseOrderId")

    private static let quantity__lock = ObjectBase()

    private static var quantity_: Property = ESPMContainerMetadata.EntityTypes.purchaseOrderItem.property(withName: "Quantity")

    private static let quantityUnit__lock = ObjectBase()

    private static var quantityUnit_: Property = ESPMContainerMetadata.EntityTypes.purchaseOrderItem.property(withName: "QuantityUnit")

    private static let taxAmount__lock = ObjectBase()

    private static var taxAmount_: Property = ESPMContainerMetadata.EntityTypes.purchaseOrderItem.property(withName: "TaxAmount")

    private static let header__lock = ObjectBase()

    private static var header_: Property = ESPMContainerMetadata.EntityTypes.purchaseOrderItem.property(withName: "Header")

    private static let productDetails__lock = ObjectBase()

    private static var productDetails_: Property = ESPMContainerMetadata.EntityTypes.purchaseOrderItem.property(withName: "ProductDetails")

    public init(withDefaults: Bool = true, withIndexMap: SparseIndexMap? = nil) {
        super.init(withDefaults: withDefaults, type: ESPMContainerMetadata.EntityTypes.purchaseOrderItem, withIndexMap: withIndexMap)
    }

    open class func array(from: EntityValueList) -> [PurchaseOrderItem] {
        return ArrayConverter.convert(from.toArray(), [PurchaseOrderItem]())
    }

    open func copy() -> PurchaseOrderItem {
        return CastRequired<PurchaseOrderItem>.from(self.copyEntity())
    }

    open class var currencyCode: Property {
        get {
            objc_sync_enter(currencyCode__lock)
            defer { objc_sync_exit(currencyCode__lock) }
            do {
                return PurchaseOrderItem.currencyCode_
            }
        }
        set(value) {
            objc_sync_enter(currencyCode__lock)
            defer { objc_sync_exit(currencyCode__lock) }
            do {
                PurchaseOrderItem.currencyCode_ = value
            }
        }
    }

    open var currencyCode: String? {
        get {
            return StringValue.optional(self.optionalValue(for: PurchaseOrderItem.currencyCode))
        }
        set(value) {
            self.setOptionalValue(for: PurchaseOrderItem.currencyCode, to: StringValue.of(optional: value))
        }
    }

    open class var grossAmount: Property {
        get {
            objc_sync_enter(grossAmount__lock)
            defer { objc_sync_exit(grossAmount__lock) }
            do {
                return PurchaseOrderItem.grossAmount_
            }
        }
        set(value) {
            objc_sync_enter(grossAmount__lock)
            defer { objc_sync_exit(grossAmount__lock) }
            do {
                PurchaseOrderItem.grossAmount_ = value
            }
        }
    }

    open var grossAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: PurchaseOrderItem.grossAmount))
        }
        set(value) {
            self.setOptionalValue(for: PurchaseOrderItem.grossAmount, to: DecimalValue.of(optional: value))
        }
    }

    open class var header: Property {
        get {
            objc_sync_enter(header__lock)
            defer { objc_sync_exit(header__lock) }
            do {
                return PurchaseOrderItem.header_
            }
        }
        set(value) {
            objc_sync_enter(header__lock)
            defer { objc_sync_exit(header__lock) }
            do {
                PurchaseOrderItem.header_ = value
            }
        }
    }

    open var header: PurchaseOrderHeader? {
        get {
            return CastOptional<PurchaseOrderHeader>.from(self.optionalValue(for: PurchaseOrderItem.header))
        }
        set(value) {
            self.setOptionalValue(for: PurchaseOrderItem.header, to: value)
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class var itemNumber: Property {
        get {
            objc_sync_enter(itemNumber__lock)
            defer { objc_sync_exit(itemNumber__lock) }
            do {
                return PurchaseOrderItem.itemNumber_
            }
        }
        set(value) {
            objc_sync_enter(itemNumber__lock)
            defer { objc_sync_exit(itemNumber__lock) }
            do {
                PurchaseOrderItem.itemNumber_ = value
            }
        }
    }

    open var itemNumber: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: PurchaseOrderItem.itemNumber))
        }
        set(value) {
            self.setOptionalValue(for: PurchaseOrderItem.itemNumber, to: IntValue.of(optional: value))
        }
    }

    open class func key(itemNumber: Int?, purchaseOrderID: String?) -> EntityKey {
        return EntityKey().with(name: "ItemNumber", value: IntValue.of(optional: itemNumber)).with(name: "PurchaseOrderId", value: StringValue.of(optional: purchaseOrderID))
    }

    open class var netAmount: Property {
        get {
            objc_sync_enter(netAmount__lock)
            defer { objc_sync_exit(netAmount__lock) }
            do {
                return PurchaseOrderItem.netAmount_
            }
        }
        set(value) {
            objc_sync_enter(netAmount__lock)
            defer { objc_sync_exit(netAmount__lock) }
            do {
                PurchaseOrderItem.netAmount_ = value
            }
        }
    }

    open var netAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: PurchaseOrderItem.netAmount))
        }
        set(value) {
            self.setOptionalValue(for: PurchaseOrderItem.netAmount, to: DecimalValue.of(optional: value))
        }
    }

    open var old: PurchaseOrderItem {
        return CastRequired<PurchaseOrderItem>.from(self.oldEntity)
    }

    open class var productDetails: Property {
        get {
            objc_sync_enter(productDetails__lock)
            defer { objc_sync_exit(productDetails__lock) }
            do {
                return PurchaseOrderItem.productDetails_
            }
        }
        set(value) {
            objc_sync_enter(productDetails__lock)
            defer { objc_sync_exit(productDetails__lock) }
            do {
                PurchaseOrderItem.productDetails_ = value
            }
        }
    }

    open var productDetails: Product? {
        get {
            return CastOptional<Product>.from(self.optionalValue(for: PurchaseOrderItem.productDetails))
        }
        set(value) {
            self.setOptionalValue(for: PurchaseOrderItem.productDetails, to: value)
        }
    }

    open class var productID: Property {
        get {
            objc_sync_enter(productID__lock)
            defer { objc_sync_exit(productID__lock) }
            do {
                return PurchaseOrderItem.productID_
            }
        }
        set(value) {
            objc_sync_enter(productID__lock)
            defer { objc_sync_exit(productID__lock) }
            do {
                PurchaseOrderItem.productID_ = value
            }
        }
    }

    open var productID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: PurchaseOrderItem.productID))
        }
        set(value) {
            self.setOptionalValue(for: PurchaseOrderItem.productID, to: StringValue.of(optional: value))
        }
    }

    open class var purchaseOrderID: Property {
        get {
            objc_sync_enter(purchaseOrderID__lock)
            defer { objc_sync_exit(purchaseOrderID__lock) }
            do {
                return PurchaseOrderItem.purchaseOrderID_
            }
        }
        set(value) {
            objc_sync_enter(purchaseOrderID__lock)
            defer { objc_sync_exit(purchaseOrderID__lock) }
            do {
                PurchaseOrderItem.purchaseOrderID_ = value
            }
        }
    }

    open var purchaseOrderID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: PurchaseOrderItem.purchaseOrderID))
        }
        set(value) {
            self.setOptionalValue(for: PurchaseOrderItem.purchaseOrderID, to: StringValue.of(optional: value))
        }
    }

    open class var quantity: Property {
        get {
            objc_sync_enter(quantity__lock)
            defer { objc_sync_exit(quantity__lock) }
            do {
                return PurchaseOrderItem.quantity_
            }
        }
        set(value) {
            objc_sync_enter(quantity__lock)
            defer { objc_sync_exit(quantity__lock) }
            do {
                PurchaseOrderItem.quantity_ = value
            }
        }
    }

    open var quantity: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: PurchaseOrderItem.quantity))
        }
        set(value) {
            self.setOptionalValue(for: PurchaseOrderItem.quantity, to: DecimalValue.of(optional: value))
        }
    }

    open class var quantityUnit: Property {
        get {
            objc_sync_enter(quantityUnit__lock)
            defer { objc_sync_exit(quantityUnit__lock) }
            do {
                return PurchaseOrderItem.quantityUnit_
            }
        }
        set(value) {
            objc_sync_enter(quantityUnit__lock)
            defer { objc_sync_exit(quantityUnit__lock) }
            do {
                PurchaseOrderItem.quantityUnit_ = value
            }
        }
    }

    open var quantityUnit: String? {
        get {
            return StringValue.optional(self.optionalValue(for: PurchaseOrderItem.quantityUnit))
        }
        set(value) {
            self.setOptionalValue(for: PurchaseOrderItem.quantityUnit, to: StringValue.of(optional: value))
        }
    }

    open class var taxAmount: Property {
        get {
            objc_sync_enter(taxAmount__lock)
            defer { objc_sync_exit(taxAmount__lock) }
            do {
                return PurchaseOrderItem.taxAmount_
            }
        }
        set(value) {
            objc_sync_enter(taxAmount__lock)
            defer { objc_sync_exit(taxAmount__lock) }
            do {
                PurchaseOrderItem.taxAmount_ = value
            }
        }
    }

    open var taxAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: PurchaseOrderItem.taxAmount))
        }
        set(value) {
            self.setOptionalValue(for: PurchaseOrderItem.taxAmount, to: DecimalValue.of(optional: value))
        }
    }
}
