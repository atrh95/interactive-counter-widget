import Foundation

public class ICUserDefaultsManager: ObservableObject {
    public static let shared = ICUserDefaultsManager()
    
    public enum Keys: String {
        case counterValue = "counter_value"
    }
    
    @Published public var count: Int {
        didSet {
            saveCount()
        }
    }
    
    private let userDefaults: UserDefaults
    
    private init() {
        // App Groupsを使用してデータを共有
        guard let userDefaults = UserDefaults(suiteName: "group.com.akitorahayashi.InterCounter") else {
            assertionFailure("App Group 'group.com.akitorahayashi.InterCounter' にアクセスできません")
            self.userDefaults = UserDefaults.standard
            self.count = 0
            return
        }
        self.userDefaults = userDefaults
        self.count = userDefaults.integer(forKey: Keys.counterValue.rawValue)
    }
    
    private func saveCount() {
        userDefaults.set(count, forKey: Keys.counterValue.rawValue)
    }
    
    public func increment() {
        count += 1
    }
    
    public func decrement() {
        count -= 1
    }
    
    public func reset() {
        count = 0
    }
} 