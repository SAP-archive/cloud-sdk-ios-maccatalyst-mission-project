// # Proxy Compiler 21.11.3

import Foundation
import SAPOData

open class Customer: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static let city__lock = ObjectBase()

    private static var city_: Property = ESPMContainerMetadata.EntityTypes.customer.property(withName: "City")

    private static let country__lock = ObjectBase()

    private static var country_: Property = ESPMContainerMetadata.EntityTypes.customer.property(withName: "Country")

    private static let customerID__lock = ObjectBase()

    private static var customerID_: Property = ESPMContainerMetadata.EntityTypes.customer.property(withName: "CustomerId")

    private static let dateOfBirth__lock = ObjectBase()

    private static var dateOfBirth_: Property = ESPMContainerMetadata.EntityTypes.customer.property(withName: "DateOfBirth")

    private static let emailAddress__lock = ObjectBase()

    private static var emailAddress_: Property = ESPMContainerMetadata.EntityTypes.customer.property(withName: "EmailAddress")

    private static let firstName__lock = ObjectBase()

    private static var firstName_: Property = ESPMContainerMetadata.EntityTypes.customer.property(withName: "FirstName")

    private static let houseNumber__lock = ObjectBase()

    private static var houseNumber_: Property = ESPMContainerMetadata.EntityTypes.customer.property(withName: "HouseNumber")

    private static let lastName__lock = ObjectBase()

    private static var lastName_: Property = ESPMContainerMetadata.EntityTypes.customer.property(withName: "LastName")

    private static let phoneNumber__lock = ObjectBase()

    private static var phoneNumber_: Property = ESPMContainerMetadata.EntityTypes.customer.property(withName: "PhoneNumber")

    private static let postalCode__lock = ObjectBase()

    private static var postalCode_: Property = ESPMContainerMetadata.EntityTypes.customer.property(withName: "PostalCode")

    private static let street__lock = ObjectBase()

    private static var street_: Property = ESPMContainerMetadata.EntityTypes.customer.property(withName: "Street")

    private static let address__lock = ObjectBase()

    private static var address_: Property = ESPMContainerMetadata.EntityTypes.customer.property(withName: "Address")

    private static let updatedTimestamp__lock = ObjectBase()

    private static var updatedTimestamp_: Property = ESPMContainerMetadata.EntityTypes.customer.property(withName: "UpdatedTimestamp")

    private static let salesOrders__lock = ObjectBase()

    private static var salesOrders_: Property = ESPMContainerMetadata.EntityTypes.customer.property(withName: "SalesOrders")

    public init(withDefaults: Bool = true, withIndexMap: SparseIndexMap? = nil) {
        super.init(withDefaults: withDefaults, type: ESPMContainerMetadata.EntityTypes.customer, withIndexMap: withIndexMap)
    }

    open class var address: Property {
        get {
            objc_sync_enter(address__lock)
            defer { objc_sync_exit(address__lock) }
            do {
                return Customer.address_
            }
        }
        set(value) {
            objc_sync_enter(address__lock)
            defer { objc_sync_exit(address__lock) }
            do {
                Customer.address_ = value
            }
        }
    }

    open var address: Address? {
        get {
            return CastOptional<Address>.from(self.optionalValue(for: Customer.address))
        }
        set(value) {
            self.setOptionalValue(for: Customer.address, to: value)
        }
    }

    open class func array(from: EntityValueList) -> [Customer] {
        return ArrayConverter.convert(from.toArray(), [Customer]())
    }

    open class var city: Property {
        get {
            objc_sync_enter(city__lock)
            defer { objc_sync_exit(city__lock) }
            do {
                return Customer.city_
            }
        }
        set(value) {
            objc_sync_enter(city__lock)
            defer { objc_sync_exit(city__lock) }
            do {
                Customer.city_ = value
            }
        }
    }

    open var city: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Customer.city))
        }
        set(value) {
            self.setOptionalValue(for: Customer.city, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> Customer {
        return CastRequired<Customer>.from(copyEntity())
    }

    open class var country: Property {
        get {
            objc_sync_enter(country__lock)
            defer { objc_sync_exit(country__lock) }
            do {
                return Customer.country_
            }
        }
        set(value) {
            objc_sync_enter(country__lock)
            defer { objc_sync_exit(country__lock) }
            do {
                Customer.country_ = value
            }
        }
    }

    open var country: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Customer.country))
        }
        set(value) {
            self.setOptionalValue(for: Customer.country, to: StringValue.of(optional: value))
        }
    }

    open class var customerID: Property {
        get {
            objc_sync_enter(customerID__lock)
            defer { objc_sync_exit(customerID__lock) }
            do {
                return Customer.customerID_
            }
        }
        set(value) {
            objc_sync_enter(customerID__lock)
            defer { objc_sync_exit(customerID__lock) }
            do {
                Customer.customerID_ = value
            }
        }
    }

    open var customerID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Customer.customerID))
        }
        set(value) {
            self.setOptionalValue(for: Customer.customerID, to: StringValue.of(optional: value))
        }
    }

    open class var dateOfBirth: Property {
        get {
            objc_sync_enter(dateOfBirth__lock)
            defer { objc_sync_exit(dateOfBirth__lock) }
            do {
                return Customer.dateOfBirth_
            }
        }
        set(value) {
            objc_sync_enter(dateOfBirth__lock)
            defer { objc_sync_exit(dateOfBirth__lock) }
            do {
                Customer.dateOfBirth_ = value
            }
        }
    }

    open var dateOfBirth: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: Customer.dateOfBirth))
        }
        set(value) {
            self.setOptionalValue(for: Customer.dateOfBirth, to: value)
        }
    }

    open class var emailAddress: Property {
        get {
            objc_sync_enter(emailAddress__lock)
            defer { objc_sync_exit(emailAddress__lock) }
            do {
                return Customer.emailAddress_
            }
        }
        set(value) {
            objc_sync_enter(emailAddress__lock)
            defer { objc_sync_exit(emailAddress__lock) }
            do {
                Customer.emailAddress_ = value
            }
        }
    }

    open var emailAddress: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Customer.emailAddress))
        }
        set(value) {
            self.setOptionalValue(for: Customer.emailAddress, to: StringValue.of(optional: value))
        }
    }

    open class var firstName: Property {
        get {
            objc_sync_enter(firstName__lock)
            defer { objc_sync_exit(firstName__lock) }
            do {
                return Customer.firstName_
            }
        }
        set(value) {
            objc_sync_enter(firstName__lock)
            defer { objc_sync_exit(firstName__lock) }
            do {
                Customer.firstName_ = value
            }
        }
    }

    open var firstName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Customer.firstName))
        }
        set(value) {
            self.setOptionalValue(for: Customer.firstName, to: StringValue.of(optional: value))
        }
    }

    open class var houseNumber: Property {
        get {
            objc_sync_enter(houseNumber__lock)
            defer { objc_sync_exit(houseNumber__lock) }
            do {
                return Customer.houseNumber_
            }
        }
        set(value) {
            objc_sync_enter(houseNumber__lock)
            defer { objc_sync_exit(houseNumber__lock) }
            do {
                Customer.houseNumber_ = value
            }
        }
    }

    open var houseNumber: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Customer.houseNumber))
        }
        set(value) {
            self.setOptionalValue(for: Customer.houseNumber, to: StringValue.of(optional: value))
        }
    }

    override open var isProxy: Bool {
        return true
    }

    open class func key(customerID: String?) -> EntityKey {
        return EntityKey().with(name: "CustomerId", value: StringValue.of(optional: customerID))
    }

    open class var lastName: Property {
        get {
            objc_sync_enter(lastName__lock)
            defer { objc_sync_exit(lastName__lock) }
            do {
                return Customer.lastName_
            }
        }
        set(value) {
            objc_sync_enter(lastName__lock)
            defer { objc_sync_exit(lastName__lock) }
            do {
                Customer.lastName_ = value
            }
        }
    }

    open var lastName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Customer.lastName))
        }
        set(value) {
            self.setOptionalValue(for: Customer.lastName, to: StringValue.of(optional: value))
        }
    }

    open var old: Customer {
        return CastRequired<Customer>.from(self.oldEntity)
    }

    open class var phoneNumber: Property {
        get {
            objc_sync_enter(phoneNumber__lock)
            defer { objc_sync_exit(phoneNumber__lock) }
            do {
                return Customer.phoneNumber_
            }
        }
        set(value) {
            objc_sync_enter(phoneNumber__lock)
            defer { objc_sync_exit(phoneNumber__lock) }
            do {
                Customer.phoneNumber_ = value
            }
        }
    }

    open var phoneNumber: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Customer.phoneNumber))
        }
        set(value) {
            self.setOptionalValue(for: Customer.phoneNumber, to: StringValue.of(optional: value))
        }
    }

    open class var postalCode: Property {
        get {
            objc_sync_enter(postalCode__lock)
            defer { objc_sync_exit(postalCode__lock) }
            do {
                return Customer.postalCode_
            }
        }
        set(value) {
            objc_sync_enter(postalCode__lock)
            defer { objc_sync_exit(postalCode__lock) }
            do {
                Customer.postalCode_ = value
            }
        }
    }

    open var postalCode: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Customer.postalCode))
        }
        set(value) {
            self.setOptionalValue(for: Customer.postalCode, to: StringValue.of(optional: value))
        }
    }

    open class var salesOrders: Property {
        get {
            objc_sync_enter(salesOrders__lock)
            defer { objc_sync_exit(salesOrders__lock) }
            do {
                return Customer.salesOrders_
            }
        }
        set(value) {
            objc_sync_enter(salesOrders__lock)
            defer { objc_sync_exit(salesOrders__lock) }
            do {
                Customer.salesOrders_ = value
            }
        }
    }

    open var salesOrders: [SalesOrderHeader] {
        get {
            return ArrayConverter.convert(Customer.salesOrders.entityList(from: self).toArray(), [SalesOrderHeader]())
        }
        set(value) {
            Customer.salesOrders.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, [EntityValue]())))
        }
    }

    open class var street: Property {
        get {
            objc_sync_enter(street__lock)
            defer { objc_sync_exit(street__lock) }
            do {
                return Customer.street_
            }
        }
        set(value) {
            objc_sync_enter(street__lock)
            defer { objc_sync_exit(street__lock) }
            do {
                Customer.street_ = value
            }
        }
    }

    open var street: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Customer.street))
        }
        set(value) {
            self.setOptionalValue(for: Customer.street, to: StringValue.of(optional: value))
        }
    }

    open class var updatedTimestamp: Property {
        get {
            objc_sync_enter(updatedTimestamp__lock)
            defer { objc_sync_exit(updatedTimestamp__lock) }
            do {
                return Customer.updatedTimestamp_
            }
        }
        set(value) {
            objc_sync_enter(updatedTimestamp__lock)
            defer { objc_sync_exit(updatedTimestamp__lock) }
            do {
                Customer.updatedTimestamp_ = value
            }
        }
    }

    open var updatedTimestamp: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(optionalValue(for: Customer.updatedTimestamp))
        }
        set(value) {
            setOptionalValue(for: Customer.updatedTimestamp, to: value)
        }
    }
}
