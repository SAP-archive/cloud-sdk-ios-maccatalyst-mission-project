// # Proxy Compiler 21.5.2

import Foundation
import SAPOData

open class Stock: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static let lotSize__lock = ObjectBase()

    private static var lotSize_: Property = ESPMContainerMetadata.EntityTypes.stock.property(withName: "LotSize")

    private static let minStock__lock = ObjectBase()

    private static var minStock_: Property = ESPMContainerMetadata.EntityTypes.stock.property(withName: "MinStock")

    private static let productID__lock = ObjectBase()

    private static var productID_: Property = ESPMContainerMetadata.EntityTypes.stock.property(withName: "ProductId")

    private static let quantity__lock = ObjectBase()

    private static var quantity_: Property = ESPMContainerMetadata.EntityTypes.stock.property(withName: "Quantity")

    private static let quantityLessMin__lock = ObjectBase()

    private static var quantityLessMin_: Property = ESPMContainerMetadata.EntityTypes.stock.property(withName: "QuantityLessMin")

    private static let updatedTimestamp__lock = ObjectBase()

    private static var updatedTimestamp_: Property = ESPMContainerMetadata.EntityTypes.stock.property(withName: "UpdatedTimestamp")

    private static let productDetails__lock = ObjectBase()

    private static var productDetails_: Property = ESPMContainerMetadata.EntityTypes.stock.property(withName: "ProductDetails")

    public init(withDefaults: Bool = true, withIndexMap: SparseIndexMap? = nil) {
        super.init(withDefaults: withDefaults, type: ESPMContainerMetadata.EntityTypes.stock, withIndexMap: withIndexMap)
    }

    open class func array(from: EntityValueList) -> [Stock] {
        return ArrayConverter.convert(from.toArray(), [Stock]())
    }

    open func copy() -> Stock {
        return CastRequired<Stock>.from(self.copyEntity())
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(productID: String?) -> EntityKey {
        return EntityKey().with(name: "ProductId", value: StringValue.of(optional: productID))
    }

    open class var lotSize: Property {
        get {
            objc_sync_enter(lotSize__lock)
            defer { objc_sync_exit(lotSize__lock) }
            do {
                return Stock.lotSize_
            }
        }
        set(value) {
            objc_sync_enter(lotSize__lock)
            defer { objc_sync_exit(lotSize__lock) }
            do {
                Stock.lotSize_ = value
            }
        }
    }

    open var lotSize: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: Stock.lotSize))
        }
        set(value) {
            self.setOptionalValue(for: Stock.lotSize, to: DecimalValue.of(optional: value))
        }
    }

    open class var minStock: Property {
        get {
            objc_sync_enter(minStock__lock)
            defer { objc_sync_exit(minStock__lock) }
            do {
                return Stock.minStock_
            }
        }
        set(value) {
            objc_sync_enter(minStock__lock)
            defer { objc_sync_exit(minStock__lock) }
            do {
                Stock.minStock_ = value
            }
        }
    }

    open var minStock: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: Stock.minStock))
        }
        set(value) {
            self.setOptionalValue(for: Stock.minStock, to: DecimalValue.of(optional: value))
        }
    }

    open var old: Stock {
        return CastRequired<Stock>.from(self.oldEntity)
    }

    open class var productDetails: Property {
        get {
            objc_sync_enter(productDetails__lock)
            defer { objc_sync_exit(productDetails__lock) }
            do {
                return Stock.productDetails_
            }
        }
        set(value) {
            objc_sync_enter(productDetails__lock)
            defer { objc_sync_exit(productDetails__lock) }
            do {
                Stock.productDetails_ = value
            }
        }
    }

    open var productDetails: Product? {
        get {
            return CastOptional<Product>.from(self.optionalValue(for: Stock.productDetails))
        }
        set(value) {
            self.setOptionalValue(for: Stock.productDetails, to: value)
        }
    }

    open class var productID: Property {
        get {
            objc_sync_enter(productID__lock)
            defer { objc_sync_exit(productID__lock) }
            do {
                return Stock.productID_
            }
        }
        set(value) {
            objc_sync_enter(productID__lock)
            defer { objc_sync_exit(productID__lock) }
            do {
                Stock.productID_ = value
            }
        }
    }

    open var productID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Stock.productID))
        }
        set(value) {
            self.setOptionalValue(for: Stock.productID, to: StringValue.of(optional: value))
        }
    }

    open class var quantity: Property {
        get {
            objc_sync_enter(quantity__lock)
            defer { objc_sync_exit(quantity__lock) }
            do {
                return Stock.quantity_
            }
        }
        set(value) {
            objc_sync_enter(quantity__lock)
            defer { objc_sync_exit(quantity__lock) }
            do {
                Stock.quantity_ = value
            }
        }
    }

    open var quantity: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: Stock.quantity))
        }
        set(value) {
            self.setOptionalValue(for: Stock.quantity, to: DecimalValue.of(optional: value))
        }
    }

    open class var quantityLessMin: Property {
        get {
            objc_sync_enter(quantityLessMin__lock)
            defer { objc_sync_exit(quantityLessMin__lock) }
            do {
                return Stock.quantityLessMin_
            }
        }
        set(value) {
            objc_sync_enter(quantityLessMin__lock)
            defer { objc_sync_exit(quantityLessMin__lock) }
            do {
                Stock.quantityLessMin_ = value
            }
        }
    }

    open var quantityLessMin: Bool? {
        get {
            return BooleanValue.optional(self.optionalValue(for: Stock.quantityLessMin))
        }
        set(value) {
            self.setOptionalValue(for: Stock.quantityLessMin, to: BooleanValue.of(optional: value))
        }
    }

    open class var updatedTimestamp: Property {
        get {
            objc_sync_enter(updatedTimestamp__lock)
            defer { objc_sync_exit(updatedTimestamp__lock) }
            do {
                return Stock.updatedTimestamp_
            }
        }
        set(value) {
            objc_sync_enter(updatedTimestamp__lock)
            defer { objc_sync_exit(updatedTimestamp__lock) }
            do {
                Stock.updatedTimestamp_ = value
            }
        }
    }

    open var updatedTimestamp: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: Stock.updatedTimestamp))
        }
        set(value) {
            self.setOptionalValue(for: Stock.updatedTimestamp, to: value)
        }
    }
}
