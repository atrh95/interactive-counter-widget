import SwiftUI
import WidgetKit

struct ContentView: View {
    // App Group 共有の UserDefaults を直接バインドし、Widget や他プロセスでの変更をリアルタイム反映
    @AppStorage("counter_value", store: UserDefaults(suiteName: "group.com.akitorahayashi.InterCounter"))
    private var count: Int = 0
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                HStack(spacing: 50) {
                    Button {
                        if count > 0 {
                            count -= 1
                            WidgetCenter.shared.reloadTimelines(ofKind: "InteractiveCounterWidget")
                        }
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(count <= 0 ? .gray : .accentColor)
                            .frame(width: 60, height: 60)
                    }
                    .disabled(count <= 0)

                    Text("\(count)")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.gray)
                        .frame(height: 40)

                    Button {
                        if count < 50 {
                            count += 1
                            WidgetCenter.shared.reloadTimelines(ofKind: "InteractiveCounterWidget")
                        }
                    } label: {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(count >= 50 ? .gray : .accentColor)
                            .frame(width: 60, height: 60)
                    }
                    .disabled(count >= 50)
                }
                Spacer()
            }
            .frame(width: geometry.size.width, height: 120)
        }
        .frame(height: 120)
            .navigationTitle("Counter")
    }
}

#Preview {
    ContentView()
}
