// # Proxy Compiler 21.11.3

import Foundation
import SAPOData

open class Address: ComplexValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static let houseNumber__lock = ObjectBase()

    private static var houseNumber_: Property = ESPMContainerMetadata.ComplexTypes.address.property(withName: "HouseNumber")

    private static let street__lock = ObjectBase()

    private static var street_: Property = ESPMContainerMetadata.ComplexTypes.address.property(withName: "Street")

    private static let city__lock = ObjectBase()

    private static var city_: Property = ESPMContainerMetadata.ComplexTypes.address.property(withName: "City")

    private static let country__lock = ObjectBase()

    private static var country_: Property = ESPMContainerMetadata.ComplexTypes.address.property(withName: "Country")

    private static let postalCode__lock = ObjectBase()

    private static var postalCode_: Property = ESPMContainerMetadata.ComplexTypes.address.property(withName: "PostalCode")

    public init(withDefaults: Bool = true, withIndexMap: SparseIndexMap? = nil) {
        super.init(withDefaults: withDefaults, type: ESPMContainerMetadata.ComplexTypes.address, withIndexMap: withIndexMap)
    }

    open class var city: Property {
        get {
            objc_sync_enter(city__lock)
            defer { objc_sync_exit(city__lock) }
            do {
                return Address.city_
            }
        }
        set(value) {
            objc_sync_enter(city__lock)
            defer { objc_sync_exit(city__lock) }
            do {
                Address.city_ = value
            }
        }
    }

    open var city: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Address.city))
        }
        set(value) {
            self.setOptionalValue(for: Address.city, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> Address {
        return CastRequired<Address>.from(copyComplex())
    }

    open class var country: Property {
        get {
            objc_sync_enter(country__lock)
            defer { objc_sync_exit(country__lock) }
            do {
                return Address.country_
            }
        }
        set(value) {
            objc_sync_enter(country__lock)
            defer { objc_sync_exit(country__lock) }
            do {
                Address.country_ = value
            }
        }
    }

    open var country: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Address.country))
        }
        set(value) {
            self.setOptionalValue(for: Address.country, to: StringValue.of(optional: value))
        }
    }

    open class var houseNumber: Property {
        get {
            objc_sync_enter(houseNumber__lock)
            defer { objc_sync_exit(houseNumber__lock) }
            do {
                return Address.houseNumber_
            }
        }
        set(value) {
            objc_sync_enter(houseNumber__lock)
            defer { objc_sync_exit(houseNumber__lock) }
            do {
                Address.houseNumber_ = value
            }
        }
    }

    open var houseNumber: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Address.houseNumber))
        }
        set(value) {
            self.setOptionalValue(for: Address.houseNumber, to: StringValue.of(optional: value))
        }
    }

    override open var isProxy: Bool {
        return true
    }

    open var old: Address {
        return CastRequired<Address>.from(self.oldComplex)
    }

    open class var postalCode: Property {
        get {
            objc_sync_enter(postalCode__lock)
            defer { objc_sync_exit(postalCode__lock) }
            do {
                return Address.postalCode_
            }
        }
        set(value) {
            objc_sync_enter(postalCode__lock)
            defer { objc_sync_exit(postalCode__lock) }
            do {
                Address.postalCode_ = value
            }
        }
    }

    open var postalCode: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Address.postalCode))
        }
        set(value) {
            self.setOptionalValue(for: Address.postalCode, to: StringValue.of(optional: value))
        }
    }

    open class var street: Property {
        get {
            objc_sync_enter(street__lock)
            defer { objc_sync_exit(street__lock) }
            do {
                return Address.street_
            }
        }
        set(value) {
            objc_sync_enter(street__lock)
            defer { objc_sync_exit(street__lock) }
            do {
                Address.street_ = value
            }
        }
    }

    open var street: String? {
        get {
            return StringValue.optional(optionalValue(for: Address.street))
        }
        set(value) {
            setOptionalValue(for: Address.street, to: StringValue.of(optional: value))
        }
    }
}
