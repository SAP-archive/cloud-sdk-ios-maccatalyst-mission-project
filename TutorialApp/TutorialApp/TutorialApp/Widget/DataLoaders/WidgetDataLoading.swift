//
// TutorialApp
//
// Created by SAP BTP SDK Assistant for iOS application on 12/07/21
//

import Foundation
import SAPCommon
import SharedFmwk

/// Types which can provide data for widget
protocol WidgetDataLoading {
    init?(controller: ODataControlling, with cipher: Ciphering)
    func loadAllEntitySets(completionHandler: @escaping (Bool) -> Void)
    func loadEntitySet(for entity: String, completionHandler: @escaping (Bool) -> Void)
}
