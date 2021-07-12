//
// TutorialApp
//
// Created by SAP BTP SDK Assistant for iOS application on 12/07/21
//

import SwiftUI
import WidgetKit

@main
struct TutorialAppWidget: Widget {
    var widgetConfig = WidgetConfigurationProvider()
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: widgetConfig.kind(), intent: DynamicDestinationSelectionIntent.self, provider: WidgetIntentTimelineProvider()) { entry in
            TutorialAppWidgetEntryView(entry: entry)
        }
        .configurationDisplayName(widgetConfig.configurationDisplayName())
        .description(widgetConfig.description())
        .supportedFamilies(widgetConfig.supportedFamilies)
    }
}
