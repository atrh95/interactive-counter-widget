import Foundation

public class ICUserDefaultsManager {
    public static let shared = ICUserDefaultsManager()

    public static let appGroupID = "group.com.akitorahayashi.InterCounter"

    public enum Keys: String {
        case counterValue
    }

    private let userDefaults: UserDefaults

    private init() {
        guard let userDefaults = UserDefaults(suiteName: Self.appGroupID) else {
            assertionFailure("App Group '\(Self.appGroupID)' にアクセスできません")
            self.userDefaults = UserDefaults.standard
            return
        }
        self.userDefaults = userDefaults
    }

    public func getValue(for key: Keys) -> Int {
        self.userDefaults.integer(forKey: key.rawValue)
    }

    public func setValue(_ value: Int, for key: Keys) {
        self.userDefaults.set(value, forKey: key.rawValue)
    }
}
