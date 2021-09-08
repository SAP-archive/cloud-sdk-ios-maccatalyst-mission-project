// # Proxy Compiler 21.5.5

import Foundation
import SAPOData

open class ProductText: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static let id__lock = ObjectBase()

    private static var id_: Property = ESPMContainerMetadata.EntityTypes.productText.property(withName: "Id")

    private static let language__lock = ObjectBase()

    private static var language_: Property = ESPMContainerMetadata.EntityTypes.productText.property(withName: "Language")

    private static let longDescription__lock = ObjectBase()

    private static var longDescription_: Property = ESPMContainerMetadata.EntityTypes.productText.property(withName: "LongDescription")

    private static let name__lock = ObjectBase()

    private static var name_: Property = ESPMContainerMetadata.EntityTypes.productText.property(withName: "Name")

    private static let productID__lock = ObjectBase()

    private static var productID_: Property = ESPMContainerMetadata.EntityTypes.productText.property(withName: "ProductId")

    private static let shortDescription__lock = ObjectBase()

    private static var shortDescription_: Property = ESPMContainerMetadata.EntityTypes.productText.property(withName: "ShortDescription")

    public init(withDefaults: Bool = true, withIndexMap: SparseIndexMap? = nil) {
        super.init(withDefaults: withDefaults, type: ESPMContainerMetadata.EntityTypes.productText, withIndexMap: withIndexMap)
    }

    open class func array(from: EntityValueList) -> [ProductText] {
        return ArrayConverter.convert(from.toArray(), [ProductText]())
    }

    open func copy() -> ProductText {
        return CastRequired<ProductText>.from(self.copyEntity())
    }

    open class var id: Property {
        get {
            objc_sync_enter(id__lock)
            defer { objc_sync_exit(id__lock) }
            do {
                return ProductText.id_
            }
        }
        set(value) {
            objc_sync_enter(id__lock)
            defer { objc_sync_exit(id__lock) }
            do {
                ProductText.id_ = value
            }
        }
    }

    open var id: Int64? {
        get {
            return LongValue.optional(self.optionalValue(for: ProductText.id))
        }
        set(value) {
            self.setOptionalValue(for: ProductText.id, to: LongValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(id: Int64?) -> EntityKey {
        return EntityKey().with(name: "Id", value: LongValue.of(optional: id))
    }

    open class var language: Property {
        get {
            objc_sync_enter(language__lock)
            defer { objc_sync_exit(language__lock) }
            do {
                return ProductText.language_
            }
        }
        set(value) {
            objc_sync_enter(language__lock)
            defer { objc_sync_exit(language__lock) }
            do {
                ProductText.language_ = value
            }
        }
    }

    open var language: String? {
        get {
            return StringValue.optional(self.optionalValue(for: ProductText.language))
        }
        set(value) {
            self.setOptionalValue(for: ProductText.language, to: StringValue.of(optional: value))
        }
    }

    open class var longDescription: Property {
        get {
            objc_sync_enter(longDescription__lock)
            defer { objc_sync_exit(longDescription__lock) }
            do {
                return ProductText.longDescription_
            }
        }
        set(value) {
            objc_sync_enter(longDescription__lock)
            defer { objc_sync_exit(longDescription__lock) }
            do {
                ProductText.longDescription_ = value
            }
        }
    }

    open var longDescription: String? {
        get {
            return StringValue.optional(self.optionalValue(for: ProductText.longDescription))
        }
        set(value) {
            self.setOptionalValue(for: ProductText.longDescription, to: StringValue.of(optional: value))
        }
    }

    open class var name: Property {
        get {
            objc_sync_enter(name__lock)
            defer { objc_sync_exit(name__lock) }
            do {
                return ProductText.name_
            }
        }
        set(value) {
            objc_sync_enter(name__lock)
            defer { objc_sync_exit(name__lock) }
            do {
                ProductText.name_ = value
            }
        }
    }

    open var name: String? {
        get {
            return StringValue.optional(self.optionalValue(for: ProductText.name))
        }
        set(value) {
            self.setOptionalValue(for: ProductText.name, to: StringValue.of(optional: value))
        }
    }

    open var old: ProductText {
        return CastRequired<ProductText>.from(self.oldEntity)
    }

    open class var productID: Property {
        get {
            objc_sync_enter(productID__lock)
            defer { objc_sync_exit(productID__lock) }
            do {
                return ProductText.productID_
            }
        }
        set(value) {
            objc_sync_enter(productID__lock)
            defer { objc_sync_exit(productID__lock) }
            do {
                ProductText.productID_ = value
            }
        }
    }

    open var productID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: ProductText.productID))
        }
        set(value) {
            self.setOptionalValue(for: ProductText.productID, to: StringValue.of(optional: value))
        }
    }

    open class var shortDescription: Property {
        get {
            objc_sync_enter(shortDescription__lock)
            defer { objc_sync_exit(shortDescription__lock) }
            do {
                return ProductText.shortDescription_
            }
        }
        set(value) {
            objc_sync_enter(shortDescription__lock)
            defer { objc_sync_exit(shortDescription__lock) }
            do {
                ProductText.shortDescription_ = value
            }
        }
    }

    open var shortDescription: String? {
        get {
            return StringValue.optional(self.optionalValue(for: ProductText.shortDescription))
        }
        set(value) {
            self.setOptionalValue(for: ProductText.shortDescription, to: StringValue.of(optional: value))
        }
    }
}
