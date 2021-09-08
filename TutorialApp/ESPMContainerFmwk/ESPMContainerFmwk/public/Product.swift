// # Proxy Compiler 21.5.5

import Foundation
import SAPOData

open class Product: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static let category__lock = ObjectBase()

    private static var category_: Property = ESPMContainerMetadata.EntityTypes.product.property(withName: "Category")

    private static let categoryName__lock = ObjectBase()

    private static var categoryName_: Property = ESPMContainerMetadata.EntityTypes.product.property(withName: "CategoryName")

    private static let currencyCode__lock = ObjectBase()

    private static var currencyCode_: Property = ESPMContainerMetadata.EntityTypes.product.property(withName: "CurrencyCode")

    private static let dimensionDepth__lock = ObjectBase()

    private static var dimensionDepth_: Property = ESPMContainerMetadata.EntityTypes.product.property(withName: "DimensionDepth")

    private static let dimensionHeight__lock = ObjectBase()

    private static var dimensionHeight_: Property = ESPMContainerMetadata.EntityTypes.product.property(withName: "DimensionHeight")

    private static let dimensionUnit__lock = ObjectBase()

    private static var dimensionUnit_: Property = ESPMContainerMetadata.EntityTypes.product.property(withName: "DimensionUnit")

    private static let dimensionWidth__lock = ObjectBase()

    private static var dimensionWidth_: Property = ESPMContainerMetadata.EntityTypes.product.property(withName: "DimensionWidth")

    private static let longDescription__lock = ObjectBase()

    private static var longDescription_: Property = ESPMContainerMetadata.EntityTypes.product.property(withName: "LongDescription")

    private static let name__lock = ObjectBase()

    private static var name_: Property = ESPMContainerMetadata.EntityTypes.product.property(withName: "Name")

    private static let pictureUrl__lock = ObjectBase()

    private static var pictureUrl_: Property = ESPMContainerMetadata.EntityTypes.product.property(withName: "PictureUrl")

    private static let price__lock = ObjectBase()

    private static var price_: Property = ESPMContainerMetadata.EntityTypes.product.property(withName: "Price")

    private static let productID__lock = ObjectBase()

    private static var productID_: Property = ESPMContainerMetadata.EntityTypes.product.property(withName: "ProductId")

    private static let quantityUnit__lock = ObjectBase()

    private static var quantityUnit_: Property = ESPMContainerMetadata.EntityTypes.product.property(withName: "QuantityUnit")

    private static let shortDescription__lock = ObjectBase()

    private static var shortDescription_: Property = ESPMContainerMetadata.EntityTypes.product.property(withName: "ShortDescription")

    private static let supplierID__lock = ObjectBase()

    private static var supplierID_: Property = ESPMContainerMetadata.EntityTypes.product.property(withName: "SupplierId")

    private static let updatedTimestamp__lock = ObjectBase()

    private static var updatedTimestamp_: Property = ESPMContainerMetadata.EntityTypes.product.property(withName: "UpdatedTimestamp")

    private static let weight__lock = ObjectBase()

    private static var weight_: Property = ESPMContainerMetadata.EntityTypes.product.property(withName: "Weight")

    private static let weightUnit__lock = ObjectBase()

    private static var weightUnit_: Property = ESPMContainerMetadata.EntityTypes.product.property(withName: "WeightUnit")

    private static let stockDetails__lock = ObjectBase()

    private static var stockDetails_: Property = ESPMContainerMetadata.EntityTypes.product.property(withName: "StockDetails")

    private static let supplierDetails__lock = ObjectBase()

    private static var supplierDetails_: Property = ESPMContainerMetadata.EntityTypes.product.property(withName: "SupplierDetails")

    public init(withDefaults: Bool = true, withIndexMap: SparseIndexMap? = nil) {
        super.init(withDefaults: withDefaults, type: ESPMContainerMetadata.EntityTypes.product, withIndexMap: withIndexMap)
    }

    open class func array(from: EntityValueList) -> [Product] {
        return ArrayConverter.convert(from.toArray(), [Product]())
    }

    open class var category: Property {
        get {
            objc_sync_enter(category__lock)
            defer { objc_sync_exit(category__lock) }
            do {
                return Product.category_
            }
        }
        set(value) {
            objc_sync_enter(category__lock)
            defer { objc_sync_exit(category__lock) }
            do {
                Product.category_ = value
            }
        }
    }

    open var category: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Product.category))
        }
        set(value) {
            self.setOptionalValue(for: Product.category, to: StringValue.of(optional: value))
        }
    }

    open class var categoryName: Property {
        get {
            objc_sync_enter(categoryName__lock)
            defer { objc_sync_exit(categoryName__lock) }
            do {
                return Product.categoryName_
            }
        }
        set(value) {
            objc_sync_enter(categoryName__lock)
            defer { objc_sync_exit(categoryName__lock) }
            do {
                Product.categoryName_ = value
            }
        }
    }

    open var categoryName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Product.categoryName))
        }
        set(value) {
            self.setOptionalValue(for: Product.categoryName, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> Product {
        return CastRequired<Product>.from(self.copyEntity())
    }

    open class var currencyCode: Property {
        get {
            objc_sync_enter(currencyCode__lock)
            defer { objc_sync_exit(currencyCode__lock) }
            do {
                return Product.currencyCode_
            }
        }
        set(value) {
            objc_sync_enter(currencyCode__lock)
            defer { objc_sync_exit(currencyCode__lock) }
            do {
                Product.currencyCode_ = value
            }
        }
    }

    open var currencyCode: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Product.currencyCode))
        }
        set(value) {
            self.setOptionalValue(for: Product.currencyCode, to: StringValue.of(optional: value))
        }
    }

    open class var dimensionDepth: Property {
        get {
            objc_sync_enter(dimensionDepth__lock)
            defer { objc_sync_exit(dimensionDepth__lock) }
            do {
                return Product.dimensionDepth_
            }
        }
        set(value) {
            objc_sync_enter(dimensionDepth__lock)
            defer { objc_sync_exit(dimensionDepth__lock) }
            do {
                Product.dimensionDepth_ = value
            }
        }
    }

    open var dimensionDepth: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: Product.dimensionDepth))
        }
        set(value) {
            self.setOptionalValue(for: Product.dimensionDepth, to: DecimalValue.of(optional: value))
        }
    }

    open class var dimensionHeight: Property {
        get {
            objc_sync_enter(dimensionHeight__lock)
            defer { objc_sync_exit(dimensionHeight__lock) }
            do {
                return Product.dimensionHeight_
            }
        }
        set(value) {
            objc_sync_enter(dimensionHeight__lock)
            defer { objc_sync_exit(dimensionHeight__lock) }
            do {
                Product.dimensionHeight_ = value
            }
        }
    }

    open var dimensionHeight: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: Product.dimensionHeight))
        }
        set(value) {
            self.setOptionalValue(for: Product.dimensionHeight, to: DecimalValue.of(optional: value))
        }
    }

    open class var dimensionUnit: Property {
        get {
            objc_sync_enter(dimensionUnit__lock)
            defer { objc_sync_exit(dimensionUnit__lock) }
            do {
                return Product.dimensionUnit_
            }
        }
        set(value) {
            objc_sync_enter(dimensionUnit__lock)
            defer { objc_sync_exit(dimensionUnit__lock) }
            do {
                Product.dimensionUnit_ = value
            }
        }
    }

    open var dimensionUnit: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Product.dimensionUnit))
        }
        set(value) {
            self.setOptionalValue(for: Product.dimensionUnit, to: StringValue.of(optional: value))
        }
    }

    open class var dimensionWidth: Property {
        get {
            objc_sync_enter(dimensionWidth__lock)
            defer { objc_sync_exit(dimensionWidth__lock) }
            do {
                return Product.dimensionWidth_
            }
        }
        set(value) {
            objc_sync_enter(dimensionWidth__lock)
            defer { objc_sync_exit(dimensionWidth__lock) }
            do {
                Product.dimensionWidth_ = value
            }
        }
    }

    open var dimensionWidth: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: Product.dimensionWidth))
        }
        set(value) {
            self.setOptionalValue(for: Product.dimensionWidth, to: DecimalValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(productID: String?) -> EntityKey {
        return EntityKey().with(name: "ProductId", value: StringValue.of(optional: productID))
    }

    open class var longDescription: Property {
        get {
            objc_sync_enter(longDescription__lock)
            defer { objc_sync_exit(longDescription__lock) }
            do {
                return Product.longDescription_
            }
        }
        set(value) {
            objc_sync_enter(longDescription__lock)
            defer { objc_sync_exit(longDescription__lock) }
            do {
                Product.longDescription_ = value
            }
        }
    }

    open var longDescription: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Product.longDescription))
        }
        set(value) {
            self.setOptionalValue(for: Product.longDescription, to: StringValue.of(optional: value))
        }
    }

    open class var name: Property {
        get {
            objc_sync_enter(name__lock)
            defer { objc_sync_exit(name__lock) }
            do {
                return Product.name_
            }
        }
        set(value) {
            objc_sync_enter(name__lock)
            defer { objc_sync_exit(name__lock) }
            do {
                Product.name_ = value
            }
        }
    }

    open var name: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Product.name))
        }
        set(value) {
            self.setOptionalValue(for: Product.name, to: StringValue.of(optional: value))
        }
    }

    open var old: Product {
        return CastRequired<Product>.from(self.oldEntity)
    }

    open class var pictureUrl: Property {
        get {
            objc_sync_enter(pictureUrl__lock)
            defer { objc_sync_exit(pictureUrl__lock) }
            do {
                return Product.pictureUrl_
            }
        }
        set(value) {
            objc_sync_enter(pictureUrl__lock)
            defer { objc_sync_exit(pictureUrl__lock) }
            do {
                Product.pictureUrl_ = value
            }
        }
    }

    open var pictureUrl: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Product.pictureUrl))
        }
        set(value) {
            self.setOptionalValue(for: Product.pictureUrl, to: StringValue.of(optional: value))
        }
    }

    open class var price: Property {
        get {
            objc_sync_enter(price__lock)
            defer { objc_sync_exit(price__lock) }
            do {
                return Product.price_
            }
        }
        set(value) {
            objc_sync_enter(price__lock)
            defer { objc_sync_exit(price__lock) }
            do {
                Product.price_ = value
            }
        }
    }

    open var price: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: Product.price))
        }
        set(value) {
            self.setOptionalValue(for: Product.price, to: DecimalValue.of(optional: value))
        }
    }

    open class var productID: Property {
        get {
            objc_sync_enter(productID__lock)
            defer { objc_sync_exit(productID__lock) }
            do {
                return Product.productID_
            }
        }
        set(value) {
            objc_sync_enter(productID__lock)
            defer { objc_sync_exit(productID__lock) }
            do {
                Product.productID_ = value
            }
        }
    }

    open var productID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Product.productID))
        }
        set(value) {
            self.setOptionalValue(for: Product.productID, to: StringValue.of(optional: value))
        }
    }

    open class var quantityUnit: Property {
        get {
            objc_sync_enter(quantityUnit__lock)
            defer { objc_sync_exit(quantityUnit__lock) }
            do {
                return Product.quantityUnit_
            }
        }
        set(value) {
            objc_sync_enter(quantityUnit__lock)
            defer { objc_sync_exit(quantityUnit__lock) }
            do {
                Product.quantityUnit_ = value
            }
        }
    }

    open var quantityUnit: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Product.quantityUnit))
        }
        set(value) {
            self.setOptionalValue(for: Product.quantityUnit, to: StringValue.of(optional: value))
        }
    }

    open class var shortDescription: Property {
        get {
            objc_sync_enter(shortDescription__lock)
            defer { objc_sync_exit(shortDescription__lock) }
            do {
                return Product.shortDescription_
            }
        }
        set(value) {
            objc_sync_enter(shortDescription__lock)
            defer { objc_sync_exit(shortDescription__lock) }
            do {
                Product.shortDescription_ = value
            }
        }
    }

    open var shortDescription: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Product.shortDescription))
        }
        set(value) {
            self.setOptionalValue(for: Product.shortDescription, to: StringValue.of(optional: value))
        }
    }

    open class var stockDetails: Property {
        get {
            objc_sync_enter(stockDetails__lock)
            defer { objc_sync_exit(stockDetails__lock) }
            do {
                return Product.stockDetails_
            }
        }
        set(value) {
            objc_sync_enter(stockDetails__lock)
            defer { objc_sync_exit(stockDetails__lock) }
            do {
                Product.stockDetails_ = value
            }
        }
    }

    open var stockDetails: Stock? {
        get {
            return CastOptional<Stock>.from(self.optionalValue(for: Product.stockDetails))
        }
        set(value) {
            self.setOptionalValue(for: Product.stockDetails, to: value)
        }
    }

    open class var supplierDetails: Property {
        get {
            objc_sync_enter(supplierDetails__lock)
            defer { objc_sync_exit(supplierDetails__lock) }
            do {
                return Product.supplierDetails_
            }
        }
        set(value) {
            objc_sync_enter(supplierDetails__lock)
            defer { objc_sync_exit(supplierDetails__lock) }
            do {
                Product.supplierDetails_ = value
            }
        }
    }

    open var supplierDetails: Supplier? {
        get {
            return CastOptional<Supplier>.from(self.optionalValue(for: Product.supplierDetails))
        }
        set(value) {
            self.setOptionalValue(for: Product.supplierDetails, to: value)
        }
    }

    open class var supplierID: Property {
        get {
            objc_sync_enter(supplierID__lock)
            defer { objc_sync_exit(supplierID__lock) }
            do {
                return Product.supplierID_
            }
        }
        set(value) {
            objc_sync_enter(supplierID__lock)
            defer { objc_sync_exit(supplierID__lock) }
            do {
                Product.supplierID_ = value
            }
        }
    }

    open var supplierID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Product.supplierID))
        }
        set(value) {
            self.setOptionalValue(for: Product.supplierID, to: StringValue.of(optional: value))
        }
    }

    open class var updatedTimestamp: Property {
        get {
            objc_sync_enter(updatedTimestamp__lock)
            defer { objc_sync_exit(updatedTimestamp__lock) }
            do {
                return Product.updatedTimestamp_
            }
        }
        set(value) {
            objc_sync_enter(updatedTimestamp__lock)
            defer { objc_sync_exit(updatedTimestamp__lock) }
            do {
                Product.updatedTimestamp_ = value
            }
        }
    }

    open var updatedTimestamp: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: Product.updatedTimestamp))
        }
        set(value) {
            self.setOptionalValue(for: Product.updatedTimestamp, to: value)
        }
    }

    open class var weight: Property {
        get {
            objc_sync_enter(weight__lock)
            defer { objc_sync_exit(weight__lock) }
            do {
                return Product.weight_
            }
        }
        set(value) {
            objc_sync_enter(weight__lock)
            defer { objc_sync_exit(weight__lock) }
            do {
                Product.weight_ = value
            }
        }
    }

    open var weight: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: Product.weight))
        }
        set(value) {
            self.setOptionalValue(for: Product.weight, to: DecimalValue.of(optional: value))
        }
    }

    open class var weightUnit: Property {
        get {
            objc_sync_enter(weightUnit__lock)
            defer { objc_sync_exit(weightUnit__lock) }
            do {
                return Product.weightUnit_
            }
        }
        set(value) {
            objc_sync_enter(weightUnit__lock)
            defer { objc_sync_exit(weightUnit__lock) }
            do {
                Product.weightUnit_ = value
            }
        }
    }

    open var weightUnit: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Product.weightUnit))
        }
        set(value) {
            self.setOptionalValue(for: Product.weightUnit, to: StringValue.of(optional: value))
        }
    }
}
