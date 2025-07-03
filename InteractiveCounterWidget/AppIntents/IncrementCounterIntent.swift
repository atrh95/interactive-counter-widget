import AppIntents
import Foundation
import ICUserDefaultsManager
import WidgetKit

// カウンターを増加させるIntent
struct IncrementCounterIntent: AppIntent {
    static var title: LocalizedStringResource = "Increment Counter"
    static var description = IntentDescription("Increments the counter by 1")

    func perform() async throws -> some IntentResult {
        let manager = ICUserDefaultsManager.shared
        let currentCount = manager.getValue(for: .counterValue)

        // 上限値チェック
        guard currentCount < 50 else {
            return .result()
        }

        manager.setValue(currentCount + 1, for: .counterValue)
        WidgetCenter.shared.reloadTimelines(ofKind: "InteractiveCounterWidget")
        return .result()
    }
}
