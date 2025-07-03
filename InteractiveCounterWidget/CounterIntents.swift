import AppIntents
import Foundation
import ICUserDefaultsManager

// カウンターを増加させるIntent
struct IncrementCounterIntent: AppIntent {
    static var title: LocalizedStringResource = "Increment Counter"
    static var description = IntentDescription("Increments the counter by 1")
    
    func perform() async throws -> some IntentResult {
        let counter = ICUserDefaultsManager.shared
        counter.increment()
        return .result()
    }
}

// カウンターを減少させるIntent
struct DecrementCounterIntent: AppIntent {
    static var title: LocalizedStringResource = "Decrement Counter"
    static var description = IntentDescription("Decrements the counter by 1")
    
    func perform() async throws -> some IntentResult {
        let counter = ICUserDefaultsManager.shared
        counter.decrement()
        return .result()
    }
}

// カウンターをリセットするIntent
struct ResetCounterIntent: AppIntent {
    static var title: LocalizedStringResource = "Reset Counter"
    static var description = IntentDescription("Resets the counter to 0")
    
    func perform() async throws -> some IntentResult {
        let counter = ICUserDefaultsManager.shared
        counter.reset()
        return .result()
    }
} 