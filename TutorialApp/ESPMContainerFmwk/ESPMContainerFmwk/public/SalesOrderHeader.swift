// # Proxy Compiler 21.5.5

import Foundation
import SAPOData

open class SalesOrderHeader: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static let createdAt__lock = ObjectBase()

    private static var createdAt_: Property = ESPMContainerMetadata.EntityTypes.salesOrderHeader.property(withName: "CreatedAt")

    private static let currencyCode__lock = ObjectBase()

    private static var currencyCode_: Property = ESPMContainerMetadata.EntityTypes.salesOrderHeader.property(withName: "CurrencyCode")

    private static let customerID__lock = ObjectBase()

    private static var customerID_: Property = ESPMContainerMetadata.EntityTypes.salesOrderHeader.property(withName: "CustomerId")

    private static let grossAmount__lock = ObjectBase()

    private static var grossAmount_: Property = ESPMContainerMetadata.EntityTypes.salesOrderHeader.property(withName: "GrossAmount")

    private static let lifeCycleStatus__lock = ObjectBase()

    private static var lifeCycleStatus_: Property = ESPMContainerMetadata.EntityTypes.salesOrderHeader.property(withName: "LifeCycleStatus")

    private static let lifeCycleStatusName__lock = ObjectBase()

    private static var lifeCycleStatusName_: Property = ESPMContainerMetadata.EntityTypes.salesOrderHeader.property(withName: "LifeCycleStatusName")

    private static let netAmount__lock = ObjectBase()

    private static var netAmount_: Property = ESPMContainerMetadata.EntityTypes.salesOrderHeader.property(withName: "NetAmount")

    private static let salesOrderID__lock = ObjectBase()

    private static var salesOrderID_: Property = ESPMContainerMetadata.EntityTypes.salesOrderHeader.property(withName: "SalesOrderId")

    private static let taxAmount__lock = ObjectBase()

    private static var taxAmount_: Property = ESPMContainerMetadata.EntityTypes.salesOrderHeader.property(withName: "TaxAmount")

    private static let items__lock = ObjectBase()

    private static var items_: Property = ESPMContainerMetadata.EntityTypes.salesOrderHeader.property(withName: "Items")

    private static let customerDetails__lock = ObjectBase()

    private static var customerDetails_: Property = ESPMContainerMetadata.EntityTypes.salesOrderHeader.property(withName: "CustomerDetails")

    public init(withDefaults: Bool = true, withIndexMap: SparseIndexMap? = nil) {
        super.init(withDefaults: withDefaults, type: ESPMContainerMetadata.EntityTypes.salesOrderHeader, withIndexMap: withIndexMap)
    }

    open class func array(from: EntityValueList) -> [SalesOrderHeader] {
        return ArrayConverter.convert(from.toArray(), [SalesOrderHeader]())
    }

    open func copy() -> SalesOrderHeader {
        return CastRequired<SalesOrderHeader>.from(self.copyEntity())
    }

    open class var createdAt: Property {
        get {
            objc_sync_enter(createdAt__lock)
            defer { objc_sync_exit(createdAt__lock) }
            do {
                return SalesOrderHeader.createdAt_
            }
        }
        set(value) {
            objc_sync_enter(createdAt__lock)
            defer { objc_sync_exit(createdAt__lock) }
            do {
                SalesOrderHeader.createdAt_ = value
            }
        }
    }

    open var createdAt: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: SalesOrderHeader.createdAt))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrderHeader.createdAt, to: value)
        }
    }

    open class var currencyCode: Property {
        get {
            objc_sync_enter(currencyCode__lock)
            defer { objc_sync_exit(currencyCode__lock) }
            do {
                return SalesOrderHeader.currencyCode_
            }
        }
        set(value) {
            objc_sync_enter(currencyCode__lock)
            defer { objc_sync_exit(currencyCode__lock) }
            do {
                SalesOrderHeader.currencyCode_ = value
            }
        }
    }

    open var currencyCode: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SalesOrderHeader.currencyCode))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrderHeader.currencyCode, to: StringValue.of(optional: value))
        }
    }

    open class var customerDetails: Property {
        get {
            objc_sync_enter(customerDetails__lock)
            defer { objc_sync_exit(customerDetails__lock) }
            do {
                return SalesOrderHeader.customerDetails_
            }
        }
        set(value) {
            objc_sync_enter(customerDetails__lock)
            defer { objc_sync_exit(customerDetails__lock) }
            do {
                SalesOrderHeader.customerDetails_ = value
            }
        }
    }

    open var customerDetails: Customer? {
        get {
            return CastOptional<Customer>.from(self.optionalValue(for: SalesOrderHeader.customerDetails))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrderHeader.customerDetails, to: value)
        }
    }

    open class var customerID: Property {
        get {
            objc_sync_enter(customerID__lock)
            defer { objc_sync_exit(customerID__lock) }
            do {
                return SalesOrderHeader.customerID_
            }
        }
        set(value) {
            objc_sync_enter(customerID__lock)
            defer { objc_sync_exit(customerID__lock) }
            do {
                SalesOrderHeader.customerID_ = value
            }
        }
    }

    open var customerID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SalesOrderHeader.customerID))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrderHeader.customerID, to: StringValue.of(optional: value))
        }
    }

    open class var grossAmount: Property {
        get {
            objc_sync_enter(grossAmount__lock)
            defer { objc_sync_exit(grossAmount__lock) }
            do {
                return SalesOrderHeader.grossAmount_
            }
        }
        set(value) {
            objc_sync_enter(grossAmount__lock)
            defer { objc_sync_exit(grossAmount__lock) }
            do {
                SalesOrderHeader.grossAmount_ = value
            }
        }
    }

    open var grossAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: SalesOrderHeader.grossAmount))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrderHeader.grossAmount, to: DecimalValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class var items: Property {
        get {
            objc_sync_enter(items__lock)
            defer { objc_sync_exit(items__lock) }
            do {
                return SalesOrderHeader.items_
            }
        }
        set(value) {
            objc_sync_enter(items__lock)
            defer { objc_sync_exit(items__lock) }
            do {
                SalesOrderHeader.items_ = value
            }
        }
    }

    open var items: [SalesOrderItem] {
        get {
            return ArrayConverter.convert(SalesOrderHeader.items.entityList(from: self).toArray(), [SalesOrderItem]())
        }
        set(value) {
            SalesOrderHeader.items.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, [EntityValue]())))
        }
    }

    open class func key(salesOrderID: String?) -> EntityKey {
        return EntityKey().with(name: "SalesOrderId", value: StringValue.of(optional: salesOrderID))
    }

    open class var lifeCycleStatus: Property {
        get {
            objc_sync_enter(lifeCycleStatus__lock)
            defer { objc_sync_exit(lifeCycleStatus__lock) }
            do {
                return SalesOrderHeader.lifeCycleStatus_
            }
        }
        set(value) {
            objc_sync_enter(lifeCycleStatus__lock)
            defer { objc_sync_exit(lifeCycleStatus__lock) }
            do {
                SalesOrderHeader.lifeCycleStatus_ = value
            }
        }
    }

    open var lifeCycleStatus: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SalesOrderHeader.lifeCycleStatus))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrderHeader.lifeCycleStatus, to: StringValue.of(optional: value))
        }
    }

    open class var lifeCycleStatusName: Property {
        get {
            objc_sync_enter(lifeCycleStatusName__lock)
            defer { objc_sync_exit(lifeCycleStatusName__lock) }
            do {
                return SalesOrderHeader.lifeCycleStatusName_
            }
        }
        set(value) {
            objc_sync_enter(lifeCycleStatusName__lock)
            defer { objc_sync_exit(lifeCycleStatusName__lock) }
            do {
                SalesOrderHeader.lifeCycleStatusName_ = value
            }
        }
    }

    open var lifeCycleStatusName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SalesOrderHeader.lifeCycleStatusName))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrderHeader.lifeCycleStatusName, to: StringValue.of(optional: value))
        }
    }

    open class var netAmount: Property {
        get {
            objc_sync_enter(netAmount__lock)
            defer { objc_sync_exit(netAmount__lock) }
            do {
                return SalesOrderHeader.netAmount_
            }
        }
        set(value) {
            objc_sync_enter(netAmount__lock)
            defer { objc_sync_exit(netAmount__lock) }
            do {
                SalesOrderHeader.netAmount_ = value
            }
        }
    }

    open var netAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: SalesOrderHeader.netAmount))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrderHeader.netAmount, to: DecimalValue.of(optional: value))
        }
    }

    open var old: SalesOrderHeader {
        return CastRequired<SalesOrderHeader>.from(self.oldEntity)
    }

    open class var salesOrderID: Property {
        get {
            objc_sync_enter(salesOrderID__lock)
            defer { objc_sync_exit(salesOrderID__lock) }
            do {
                return SalesOrderHeader.salesOrderID_
            }
        }
        set(value) {
            objc_sync_enter(salesOrderID__lock)
            defer { objc_sync_exit(salesOrderID__lock) }
            do {
                SalesOrderHeader.salesOrderID_ = value
            }
        }
    }

    open var salesOrderID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SalesOrderHeader.salesOrderID))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrderHeader.salesOrderID, to: StringValue.of(optional: value))
        }
    }

    open class var taxAmount: Property {
        get {
            objc_sync_enter(taxAmount__lock)
            defer { objc_sync_exit(taxAmount__lock) }
            do {
                return SalesOrderHeader.taxAmount_
            }
        }
        set(value) {
            objc_sync_enter(taxAmount__lock)
            defer { objc_sync_exit(taxAmount__lock) }
            do {
                SalesOrderHeader.taxAmount_ = value
            }
        }
    }

    open var taxAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: SalesOrderHeader.taxAmount))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrderHeader.taxAmount, to: DecimalValue.of(optional: value))
        }
    }
}
