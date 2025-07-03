import Foundation

class SharedCounter: ObservableObject {
    static let shared = SharedCounter()
    
    @Published var count: Int {
        didSet {
            saveCount()
        }
    }
    
    private let userDefaults: UserDefaults
    private let countKey = "counter_value"
    
    private init() {
        // App Groupsを使用してデータを共有
        self.userDefaults = UserDefaults(suiteName: "group.com.akitorahayashi.InteractiveCounterApp") ?? UserDefaults.standard
        self.count = userDefaults.integer(forKey: countKey)
    }
    
    private func saveCount() {
        userDefaults.set(count, forKey: countKey)
    }
    
    func increment() {
        count += 1
    }
    
    func decrement() {
        count -= 1
    }
    
    func reset() {
        count = 0
    }
} 