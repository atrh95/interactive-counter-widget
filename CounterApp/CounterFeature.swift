import Foundation
import ICUserDefaultsManager
import WidgetKit

@MainActor
class CounterFeature: ObservableObject {
    @Published private(set) var count: Int = 0
    
    private let userDefaultsManager: ICUserDefaultsManager
    
    init(userDefaultsManager: ICUserDefaultsManager = .shared) {
        self.userDefaultsManager = userDefaultsManager
        self.count = userDefaultsManager.getValue(for: .counterValue)
    }
    
    func increment() {
        guard count < 50 else { return }
        count += 1
        saveCount()
    }
    
    func decrement() {
        guard count > 0 else { return }
        count -= 1
        saveCount()
    }
    
    func reloadFromUserDefaults() {
        count = userDefaultsManager.getValue(for: .counterValue)
    }
    
    private func saveCount() {
        userDefaultsManager.setValue(count, for: .counterValue)
        WidgetCenter.shared.reloadTimelines(ofKind: "InteractiveCounterWidget")
    }
} 