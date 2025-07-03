import WidgetKit
import SwiftUI
import AppIntents

// Widgetの表示データ構造
struct CounterEntry: TimelineEntry {
    let date: Date
    let count: Int
}

// WidgetのTimeline Provider
struct CounterProvider: TimelineProvider {
    func placeholder(in context: Context) -> CounterEntry {
        CounterEntry(date: Date(), count: 0)
    }

    func getSnapshot(in context: Context, completion: @escaping (CounterEntry) -> ()) {
        let entry = CounterEntry(date: Date(), count: getCurrentCount())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<CounterEntry>) -> ()) {
        let currentCount = getCurrentCount()
        let entry = CounterEntry(date: Date(), count: currentCount)
        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }
    
    private func getCurrentCount() -> Int {
        let userDefaults = UserDefaults(suiteName: "group.com.akitorahayashi.InteractiveCounterApp") ?? UserDefaults.standard
        return userDefaults.integer(forKey: "counter_value")
    }
}

// Widgetのビュー
struct CounterWidgetView: View {
    var entry: CounterEntry
    
    var body: some View {
        VStack(spacing: 8) {
            Text("Counter")
                .font(.headline)
                .fontWeight(.semibold)
            
            Text("\(entry.count)")
                .font(.system(size: 36, weight: .bold, design: .rounded))
                .foregroundColor(.blue)
            
            HStack(spacing: 12) {
                Button(intent: DecrementCounterIntent()) {
                    Image(systemName: "minus.circle.fill")
                        .font(.title2)
                        .foregroundColor(.red)
                }
                .buttonStyle(.plain)
                
                Button(intent: ResetCounterIntent()) {
                    Image(systemName: "arrow.clockwise.circle.fill")
                        .font(.title3)
                        .foregroundColor(.gray)
                }
                .buttonStyle(.plain)
                
                Button(intent: IncrementCounterIntent()) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title2)
                        .foregroundColor(.green)
                }
                .buttonStyle(.plain)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .containerBackground(.regularMaterial, for: .widget)
    }
}

// Widget Configuration
struct InteractiveCounterWidget: Widget {
    let kind: String = "InteractiveCounterWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: CounterProvider()) { entry in
            CounterWidgetView(entry: entry)
        }
        .configurationDisplayName("Interactive Counter")
        .description("カウンターをウィジェットから直接操作できます")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

// Widget Bundle (エントリーポイント)
@main
struct InteractiveCounterWidgetBundle: WidgetBundle {
    var body: some Widget {
        InteractiveCounterWidget()
    }
}

// Preview
#Preview(as: .systemSmall) {
    InteractiveCounterWidget()
} timeline: {
    CounterEntry(date: .now, count: 0)
    CounterEntry(date: .now, count: 5)
    CounterEntry(date: .now, count: 10)
} 