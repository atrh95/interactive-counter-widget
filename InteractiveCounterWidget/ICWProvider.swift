import ICUserDefaultsManager
import SwiftUI
import WidgetKit

struct ICWProvider: TimelineProvider {
    func placeholder(in _: Context) -> CounterEntry {
        CounterEntry(date: Date(), count: 10)
    }

    func getSnapshot(in _: Context, completion: @escaping (CounterEntry) -> Void) {
        let entry = CounterEntry(date: Date(), count: 10)
        completion(entry)
    }

    func getTimeline(in _: Context, completion: @escaping (Timeline<CounterEntry>) -> Void) {
        let currentCount = ICUserDefaultsManager.shared.getValue(for: .counterValue)
        let entry = CounterEntry(date: Date(), count: currentCount)
        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }
}
