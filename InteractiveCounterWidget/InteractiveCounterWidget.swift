import WidgetKit
import SwiftUI
import AppIntents

struct InteractiveCounterWidget: Widget {
    let kind: String = "InteractiveCounterWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: ICWProvider()) { entry in
            CounterWidgetView(entry: entry)
        }
        .configurationDisplayName("Interactive Counter")
        .description("カウンターをウィジェットから直接操作できます")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}