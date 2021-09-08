// # Proxy Compiler 21.5.5

import Foundation
import SAPOData

open class Supplier: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static let city__lock = ObjectBase()

    private static var city_: Property = ESPMContainerMetadata.EntityTypes.supplier.property(withName: "City")

    private static let country__lock = ObjectBase()

    private static var country_: Property = ESPMContainerMetadata.EntityTypes.supplier.property(withName: "Country")

    private static let emailAddress__lock = ObjectBase()

    private static var emailAddress_: Property = ESPMContainerMetadata.EntityTypes.supplier.property(withName: "EmailAddress")

    private static let houseNumber__lock = ObjectBase()

    private static var houseNumber_: Property = ESPMContainerMetadata.EntityTypes.supplier.property(withName: "HouseNumber")

    private static let phoneNumber__lock = ObjectBase()

    private static var phoneNumber_: Property = ESPMContainerMetadata.EntityTypes.supplier.property(withName: "PhoneNumber")

    private static let postalCode__lock = ObjectBase()

    private static var postalCode_: Property = ESPMContainerMetadata.EntityTypes.supplier.property(withName: "PostalCode")

    private static let street__lock = ObjectBase()

    private static var street_: Property = ESPMContainerMetadata.EntityTypes.supplier.property(withName: "Street")

    private static let supplierID__lock = ObjectBase()

    private static var supplierID_: Property = ESPMContainerMetadata.EntityTypes.supplier.property(withName: "SupplierId")

    private static let supplierName__lock = ObjectBase()

    private static var supplierName_: Property = ESPMContainerMetadata.EntityTypes.supplier.property(withName: "SupplierName")

    private static let address__lock = ObjectBase()

    private static var address_: Property = ESPMContainerMetadata.EntityTypes.supplier.property(withName: "Address")

    private static let updatedTimestamp__lock = ObjectBase()

    private static var updatedTimestamp_: Property = ESPMContainerMetadata.EntityTypes.supplier.property(withName: "UpdatedTimestamp")

    private static let products__lock = ObjectBase()

    private static var products_: Property = ESPMContainerMetadata.EntityTypes.supplier.property(withName: "Products")

    private static let purchaseOrders__lock = ObjectBase()

    private static var purchaseOrders_: Property = ESPMContainerMetadata.EntityTypes.supplier.property(withName: "PurchaseOrders")

    public init(withDefaults: Bool = true, withIndexMap: SparseIndexMap? = nil) {
        super.init(withDefaults: withDefaults, type: ESPMContainerMetadata.EntityTypes.supplier, withIndexMap: withIndexMap)
    }

    open class var address: Property {
        get {
            objc_sync_enter(address__lock)
            defer { objc_sync_exit(address__lock) }
            do {
                return Supplier.address_
            }
        }
        set(value) {
            objc_sync_enter(address__lock)
            defer { objc_sync_exit(address__lock) }
            do {
                Supplier.address_ = value
            }
        }
    }

    open var address: Address? {
        get {
            return CastOptional<Address>.from(self.optionalValue(for: Supplier.address))
        }
        set(value) {
            self.setOptionalValue(for: Supplier.address, to: value)
        }
    }

    open class func array(from: EntityValueList) -> [Supplier] {
        return ArrayConverter.convert(from.toArray(), [Supplier]())
    }

    open class var city: Property {
        get {
            objc_sync_enter(city__lock)
            defer { objc_sync_exit(city__lock) }
            do {
                return Supplier.city_
            }
        }
        set(value) {
            objc_sync_enter(city__lock)
            defer { objc_sync_exit(city__lock) }
            do {
                Supplier.city_ = value
            }
        }
    }

    open var city: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Supplier.city))
        }
        set(value) {
            self.setOptionalValue(for: Supplier.city, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> Supplier {
        return CastRequired<Supplier>.from(self.copyEntity())
    }

    open class var country: Property {
        get {
            objc_sync_enter(country__lock)
            defer { objc_sync_exit(country__lock) }
            do {
                return Supplier.country_
            }
        }
        set(value) {
            objc_sync_enter(country__lock)
            defer { objc_sync_exit(country__lock) }
            do {
                Supplier.country_ = value
            }
        }
    }

    open var country: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Supplier.country))
        }
        set(value) {
            self.setOptionalValue(for: Supplier.country, to: StringValue.of(optional: value))
        }
    }

    open class var emailAddress: Property {
        get {
            objc_sync_enter(emailAddress__lock)
            defer { objc_sync_exit(emailAddress__lock) }
            do {
                return Supplier.emailAddress_
            }
        }
        set(value) {
            objc_sync_enter(emailAddress__lock)
            defer { objc_sync_exit(emailAddress__lock) }
            do {
                Supplier.emailAddress_ = value
            }
        }
    }

    open var emailAddress: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Supplier.emailAddress))
        }
        set(value) {
            self.setOptionalValue(for: Supplier.emailAddress, to: StringValue.of(optional: value))
        }
    }

    open class var houseNumber: Property {
        get {
            objc_sync_enter(houseNumber__lock)
            defer { objc_sync_exit(houseNumber__lock) }
            do {
                return Supplier.houseNumber_
            }
        }
        set(value) {
            objc_sync_enter(houseNumber__lock)
            defer { objc_sync_exit(houseNumber__lock) }
            do {
                Supplier.houseNumber_ = value
            }
        }
    }

    open var houseNumber: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Supplier.houseNumber))
        }
        set(value) {
            self.setOptionalValue(for: Supplier.houseNumber, to: StringValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(supplierID: String?) -> EntityKey {
        return EntityKey().with(name: "SupplierId", value: StringValue.of(optional: supplierID))
    }

    open var old: Supplier {
        return CastRequired<Supplier>.from(self.oldEntity)
    }

    open class var phoneNumber: Property {
        get {
            objc_sync_enter(phoneNumber__lock)
            defer { objc_sync_exit(phoneNumber__lock) }
            do {
                return Supplier.phoneNumber_
            }
        }
        set(value) {
            objc_sync_enter(phoneNumber__lock)
            defer { objc_sync_exit(phoneNumber__lock) }
            do {
                Supplier.phoneNumber_ = value
            }
        }
    }

    open var phoneNumber: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Supplier.phoneNumber))
        }
        set(value) {
            self.setOptionalValue(for: Supplier.phoneNumber, to: StringValue.of(optional: value))
        }
    }

    open class var postalCode: Property {
        get {
            objc_sync_enter(postalCode__lock)
            defer { objc_sync_exit(postalCode__lock) }
            do {
                return Supplier.postalCode_
            }
        }
        set(value) {
            objc_sync_enter(postalCode__lock)
            defer { objc_sync_exit(postalCode__lock) }
            do {
                Supplier.postalCode_ = value
            }
        }
    }

    open var postalCode: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Supplier.postalCode))
        }
        set(value) {
            self.setOptionalValue(for: Supplier.postalCode, to: StringValue.of(optional: value))
        }
    }

    open class var products: Property {
        get {
            objc_sync_enter(products__lock)
            defer { objc_sync_exit(products__lock) }
            do {
                return Supplier.products_
            }
        }
        set(value) {
            objc_sync_enter(products__lock)
            defer { objc_sync_exit(products__lock) }
            do {
                Supplier.products_ = value
            }
        }
    }

    open var products: [Product] {
        get {
            return ArrayConverter.convert(Supplier.products.entityList(from: self).toArray(), [Product]())
        }
        set(value) {
            Supplier.products.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, [EntityValue]())))
        }
    }

    open class var purchaseOrders: Property {
        get {
            objc_sync_enter(purchaseOrders__lock)
            defer { objc_sync_exit(purchaseOrders__lock) }
            do {
                return Supplier.purchaseOrders_
            }
        }
        set(value) {
            objc_sync_enter(purchaseOrders__lock)
            defer { objc_sync_exit(purchaseOrders__lock) }
            do {
                Supplier.purchaseOrders_ = value
            }
        }
    }

    open var purchaseOrders: [PurchaseOrderHeader] {
        get {
            return ArrayConverter.convert(Supplier.purchaseOrders.entityList(from: self).toArray(), [PurchaseOrderHeader]())
        }
        set(value) {
            Supplier.purchaseOrders.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, [EntityValue]())))
        }
    }

    open class var street: Property {
        get {
            objc_sync_enter(street__lock)
            defer { objc_sync_exit(street__lock) }
            do {
                return Supplier.street_
            }
        }
        set(value) {
            objc_sync_enter(street__lock)
            defer { objc_sync_exit(street__lock) }
            do {
                Supplier.street_ = value
            }
        }
    }

    open var street: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Supplier.street))
        }
        set(value) {
            self.setOptionalValue(for: Supplier.street, to: StringValue.of(optional: value))
        }
    }

    open class var supplierID: Property {
        get {
            objc_sync_enter(supplierID__lock)
            defer { objc_sync_exit(supplierID__lock) }
            do {
                return Supplier.supplierID_
            }
        }
        set(value) {
            objc_sync_enter(supplierID__lock)
            defer { objc_sync_exit(supplierID__lock) }
            do {
                Supplier.supplierID_ = value
            }
        }
    }

    open var supplierID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Supplier.supplierID))
        }
        set(value) {
            self.setOptionalValue(for: Supplier.supplierID, to: StringValue.of(optional: value))
        }
    }

    open class var supplierName: Property {
        get {
            objc_sync_enter(supplierName__lock)
            defer { objc_sync_exit(supplierName__lock) }
            do {
                return Supplier.supplierName_
            }
        }
        set(value) {
            objc_sync_enter(supplierName__lock)
            defer { objc_sync_exit(supplierName__lock) }
            do {
                Supplier.supplierName_ = value
            }
        }
    }

    open var supplierName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Supplier.supplierName))
        }
        set(value) {
            self.setOptionalValue(for: Supplier.supplierName, to: StringValue.of(optional: value))
        }
    }

    open class var updatedTimestamp: Property {
        get {
            objc_sync_enter(updatedTimestamp__lock)
            defer { objc_sync_exit(updatedTimestamp__lock) }
            do {
                return Supplier.updatedTimestamp_
            }
        }
        set(value) {
            objc_sync_enter(updatedTimestamp__lock)
            defer { objc_sync_exit(updatedTimestamp__lock) }
            do {
                Supplier.updatedTimestamp_ = value
            }
        }
    }

    open var updatedTimestamp: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: Supplier.updatedTimestamp))
        }
        set(value) {
            self.setOptionalValue(for: Supplier.updatedTimestamp, to: value)
        }
    }
}
