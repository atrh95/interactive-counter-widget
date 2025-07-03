import WidgetKit
import SwiftUI
import ICUserDefaultsManager

struct ICWProvider: TimelineProvider {
    func placeholder(in context: Context) -> CounterEntry {
        CounterEntry(date: Date(), count: 10)
    }

    func getSnapshot(in context: Context, completion: @escaping (CounterEntry) -> ()) {
        let entry = CounterEntry(date: Date(), count: 10)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<CounterEntry>) -> ()) {
        let currentCount = ICUserDefaultsManager.shared.getValue(for: .counterValue)
        let entry = CounterEntry(date: Date(), count: currentCount)
        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }
} 