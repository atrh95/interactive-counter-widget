import AppIntents
import SwiftUI
import WidgetKit

struct InteractiveCounterWidget: Widget {
    let kind: String = "InteractiveCounterWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: self.kind, provider: ICWProvider()) { entry in
            CounterWidgetView(entry: entry)
        }
        .configurationDisplayName("Interactive Counter")
        .description("カウンターをウィジェットから直接操作できます")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}
