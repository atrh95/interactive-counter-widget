import AppIntents
import Foundation
import ICUserDefaultsManager
import WidgetKit

// カウンターを減少させるIntent
struct DecrementCounterIntent: AppIntent {
    static var title: LocalizedStringResource = "Decrement Counter"
    static var description = IntentDescription("Decrements the counter by 1")
    
    func perform() async throws -> some IntentResult {
        let manager = ICUserDefaultsManager.shared
        let currentCount = manager.getValue(for: .counterValue)
        
        // 下限値チェック
        guard currentCount > 0 else {
            return .result()
        }
        
        manager.setValue(currentCount - 1, for: .counterValue)
        WidgetCenter.shared.reloadTimelines(ofKind: "InteractiveCounterWidget")
        return .result()
    }
} 