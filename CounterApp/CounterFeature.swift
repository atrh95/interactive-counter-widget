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
        guard self.count < 50 else { return }
        self.count += 1
        self.saveCount()
    }

    func decrement() {
        guard self.count > 0 else { return }
        self.count -= 1
        self.saveCount()
    }

    func reloadFromUserDefaults() {
        self.count = self.userDefaultsManager.getValue(for: .counterValue)
    }

    private func saveCount() {
        self.userDefaultsManager.setValue(self.count, for: .counterValue)
        WidgetCenter.shared.reloadTimelines(ofKind: "InteractiveCounterWidget")
    }
}
