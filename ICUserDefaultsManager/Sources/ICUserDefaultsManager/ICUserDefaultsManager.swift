import Foundation

public class ICUserDefaultsManager {
    public static let shared = ICUserDefaultsManager()
    
    public enum Keys: String {
        case counterValue = "counter_value"
    }
    
    private let userDefaults: UserDefaults
    
    private init() {
        // App Groupsを使用してデータを共有
        guard let userDefaults = UserDefaults(suiteName: "group.com.akitorahayashi.InterCounter") else {
            assertionFailure("App Group 'group.com.akitorahayashi.InterCounter' にアクセスできません")
            self.userDefaults = UserDefaults.standard
            return
        }
        self.userDefaults = userDefaults
    }
    
    public func getValue(for key: Keys, defaultValue: Int = 0) -> Int {
        return userDefaults.integer(forKey: key.rawValue)
    }
    
    public func setValue(_ value: Int, for key: Keys) {
        userDefaults.set(value, forKey: key.rawValue)
    }
} 