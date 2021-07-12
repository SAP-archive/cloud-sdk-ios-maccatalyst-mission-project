//
// TutorialApp
//
// Created by SAP BTP SDK Assistant for iOS application on 12/07/21
//

import Foundation
import SwiftUI

struct TutorialAppWidgetEntryView: View {
    var entry: WidgetIntentTimelineProvider.Entry
    var body: some View {
        ZStack {
            Color("bgColor")
            VStack {
                WidgetEntryView(data: entry.values,
                                title: entry.title,
                                listPath: entry.listPath)
            }
        }
    }
}
