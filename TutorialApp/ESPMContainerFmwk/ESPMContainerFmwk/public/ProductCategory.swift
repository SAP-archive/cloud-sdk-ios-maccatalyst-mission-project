// # Proxy Compiler 21.11.3

import Foundation
import SAPOData

open class ProductCategory: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static let category__lock = ObjectBase()

    private static var category_: Property = ESPMContainerMetadata.EntityTypes.productCategory.property(withName: "Category")

    private static let categoryName__lock = ObjectBase()

    private static var categoryName_: Property = ESPMContainerMetadata.EntityTypes.productCategory.property(withName: "CategoryName")

    private static let mainCategory__lock = ObjectBase()

    private static var mainCategory_: Property = ESPMContainerMetadata.EntityTypes.productCategory.property(withName: "MainCategory")

    private static let mainCategoryName__lock = ObjectBase()

    private static var mainCategoryName_: Property = ESPMContainerMetadata.EntityTypes.productCategory.property(withName: "MainCategoryName")

    private static let numberOfProducts__lock = ObjectBase()

    private static var numberOfProducts_: Property = ESPMContainerMetadata.EntityTypes.productCategory.property(withName: "NumberOfProducts")

    private static let updatedTimestamp__lock = ObjectBase()

    private static var updatedTimestamp_: Property = ESPMContainerMetadata.EntityTypes.productCategory.property(withName: "UpdatedTimestamp")

    public init(withDefaults: Bool = true, withIndexMap: SparseIndexMap? = nil) {
        super.init(withDefaults: withDefaults, type: ESPMContainerMetadata.EntityTypes.productCategory, withIndexMap: withIndexMap)
    }

    open class func array(from: EntityValueList) -> [ProductCategory] {
        return ArrayConverter.convert(from.toArray(), [ProductCategory]())
    }

    open class var category: Property {
        get {
            objc_sync_enter(category__lock)
            defer { objc_sync_exit(category__lock) }
            do {
                return ProductCategory.category_
            }
        }
        set(value) {
            objc_sync_enter(category__lock)
            defer { objc_sync_exit(category__lock) }
            do {
                ProductCategory.category_ = value
            }
        }
    }

    open var category: String? {
        get {
            return StringValue.optional(self.optionalValue(for: ProductCategory.category))
        }
        set(value) {
            self.setOptionalValue(for: ProductCategory.category, to: StringValue.of(optional: value))
        }
    }

    open class var categoryName: Property {
        get {
            objc_sync_enter(categoryName__lock)
            defer { objc_sync_exit(categoryName__lock) }
            do {
                return ProductCategory.categoryName_
            }
        }
        set(value) {
            objc_sync_enter(categoryName__lock)
            defer { objc_sync_exit(categoryName__lock) }
            do {
                ProductCategory.categoryName_ = value
            }
        }
    }

    open var categoryName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: ProductCategory.categoryName))
        }
        set(value) {
            self.setOptionalValue(for: ProductCategory.categoryName, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> ProductCategory {
        return CastRequired<ProductCategory>.from(copyEntity())
    }

    override open var isProxy: Bool {
        return true
    }

    open class func key(category: String?) -> EntityKey {
        return EntityKey().with(name: "Category", value: StringValue.of(optional: category))
    }

    open class var mainCategory: Property {
        get {
            objc_sync_enter(mainCategory__lock)
            defer { objc_sync_exit(mainCategory__lock) }
            do {
                return ProductCategory.mainCategory_
            }
        }
        set(value) {
            objc_sync_enter(mainCategory__lock)
            defer { objc_sync_exit(mainCategory__lock) }
            do {
                ProductCategory.mainCategory_ = value
            }
        }
    }

    open var mainCategory: String? {
        get {
            return StringValue.optional(self.optionalValue(for: ProductCategory.mainCategory))
        }
        set(value) {
            self.setOptionalValue(for: ProductCategory.mainCategory, to: StringValue.of(optional: value))
        }
    }

    open class var mainCategoryName: Property {
        get {
            objc_sync_enter(mainCategoryName__lock)
            defer { objc_sync_exit(mainCategoryName__lock) }
            do {
                return ProductCategory.mainCategoryName_
            }
        }
        set(value) {
            objc_sync_enter(mainCategoryName__lock)
            defer { objc_sync_exit(mainCategoryName__lock) }
            do {
                ProductCategory.mainCategoryName_ = value
            }
        }
    }

    open var mainCategoryName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: ProductCategory.mainCategoryName))
        }
        set(value) {
            self.setOptionalValue(for: ProductCategory.mainCategoryName, to: StringValue.of(optional: value))
        }
    }

    open class var numberOfProducts: Property {
        get {
            objc_sync_enter(numberOfProducts__lock)
            defer { objc_sync_exit(numberOfProducts__lock) }
            do {
                return ProductCategory.numberOfProducts_
            }
        }
        set(value) {
            objc_sync_enter(numberOfProducts__lock)
            defer { objc_sync_exit(numberOfProducts__lock) }
            do {
                ProductCategory.numberOfProducts_ = value
            }
        }
    }

    open var numberOfProducts: Int64? {
        get {
            return LongValue.optional(self.optionalValue(for: ProductCategory.numberOfProducts))
        }
        set(value) {
            self.setOptionalValue(for: ProductCategory.numberOfProducts, to: LongValue.of(optional: value))
        }
    }

    open var old: ProductCategory {
        return CastRequired<ProductCategory>.from(self.oldEntity)
    }

    open class var updatedTimestamp: Property {
        get {
            objc_sync_enter(updatedTimestamp__lock)
            defer { objc_sync_exit(updatedTimestamp__lock) }
            do {
                return ProductCategory.updatedTimestamp_
            }
        }
        set(value) {
            objc_sync_enter(updatedTimestamp__lock)
            defer { objc_sync_exit(updatedTimestamp__lock) }
            do {
                ProductCategory.updatedTimestamp_ = value
            }
        }
    }

    open var updatedTimestamp: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(optionalValue(for: ProductCategory.updatedTimestamp))
        }
        set(value) {
            setOptionalValue(for: ProductCategory.updatedTimestamp, to: value)
        }
    }
}
