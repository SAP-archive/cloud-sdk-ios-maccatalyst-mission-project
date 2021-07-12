//
// TutorialApp
//
// Created by SAP BTP SDK Assistant for iOS application on 12/07/21
//

import Foundation
import SAPCommon
import SAPFoundation

public class DefaultAuxiliaryDataServiceProvider: AuxiliaryDataServiceProviding {
    public typealias DataRequest = AuxiliaryDataRequest<WidgetDataKey>

    public typealias DataContainer = AuxiliaryDataContainer<Data>

    public typealias KeyContainer = AuxiliaryKeyContainer<WidgetDataKey>

    public typealias CommunicationProvider = AuxiliaryCommunicationProvider

    private var _auxiliaryCommnProvider: CommunicationProvider

    private var cipher: Ciphering

    public init(provider: CommunicationProvider, with cipher: Ciphering) {
        self._auxiliaryCommnProvider = provider
        self.cipher = cipher
    }

    public func configure(provider: CommunicationProvider) {
        self._auxiliaryCommnProvider = provider
    }

    public func get(auxKeyContainer: AuxiliaryKeyContainer<WidgetDataKey>) throws -> AuxiliaryDataContainer<Data> {
        let widgetDataKey = auxKeyContainer.get()
        guard let encodedData = try self._auxiliaryCommnProvider.get(for: widgetDataKey.getPrimaryKey()) else {
            let error = NSError(domain: "No data found!", code: 0)
            throw error
        }
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(AuxiliaryDataContainer<Data>.self, from: encodedData)
        let encryptedData = decodedData.get()

        let plainData = try self.cipher.decrypt(data: encryptedData)
        let dataContainer = AuxiliaryDataContainer<Data>(data: plainData)
        return dataContainer
    }

    public func put(auxDataContainer: AuxiliaryDataContainer<Data>, for auxKeyContainer: AuxiliaryKeyContainer<WidgetDataKey>) throws {
        let widgetDataKey = auxKeyContainer.get()
        let data = auxDataContainer.get()
        let encryptedList = try self.cipher.encrypt(data: data)
        let dataContainer = AuxiliaryDataContainer<Data>(data: encryptedList)

        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(dataContainer) {
            try self._auxiliaryCommnProvider.put(data: encodedData, for: widgetDataKey.getPrimaryKey())
        }
    }

    public func delete(for auxKeyContainer: AuxiliaryKeyContainer<WidgetDataKey>) throws {
        let widgetDataKey = auxKeyContainer.get()
        try self._auxiliaryCommnProvider.delete(for: widgetDataKey.getPrimaryKey())
    }
}
