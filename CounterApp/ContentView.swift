import ICUserDefaultsManager
import SwiftUI
import WidgetKit

struct ContentView: View {
    @AppStorage(
        ICUserDefaultsManager.Keys.counterValue.rawValue,
        store: UserDefaults(suiteName: ICUserDefaultsManager.appGroupID)
    )
    private var count: Int = 0

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                HStack(spacing: 50) {
                    Button {
                        if self.count > 0 {
                            self.count -= 1
                            WidgetCenter.shared.reloadTimelines(ofKind: "InteractiveCounterWidget")
                        }
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(self.count <= 0 ? .gray : .accentColor)
                            .frame(width: 60, height: 60)
                    }
                    .disabled(self.count <= 0)

                    Text("\(self.count)")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.gray)
                        .frame(height: 40)

                    Button {
                        if self.count < 50 {
                            self.count += 1
                            WidgetCenter.shared.reloadTimelines(ofKind: "InteractiveCounterWidget")
                        }
                    } label: {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(self.count >= 50 ? .gray : .accentColor)
                            .frame(width: 60, height: 60)
                    }
                    .disabled(self.count >= 50)
                }
                Spacer()
            }
            .frame(width: geometry.size.width, height: 120)
        }
        .frame(height: 120)
        .navigationTitle("Counter")
    }
}
