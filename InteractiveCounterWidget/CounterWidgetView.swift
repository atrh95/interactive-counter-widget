import AppIntents
import SwiftUI
import WidgetKit

// Widgetのビュー
struct CounterWidgetView: View {
    @Environment(\.widgetFamily) private var family
    var entry: CounterEntry

    var body: some View {
        switch self.family {
            case .systemSmall:
                self.smallLayout
            default:
                self.mediumLayout
        }
    }

    /// - Button: カウントを1減らす
    private var minusButton: some View {
        Button(intent: DecrementCounterIntent()) {
            Image(systemName: "minus.circle.fill")
                .font(.title2)
        }
        .disabled(self.entry.count <= 0)
    }

    /// + Button: カウントを1増やす
    private var plusButton: some View {
        Button(intent: IncrementCounterIntent()) {
            Image(systemName: "plus.circle.fill")
                .font(.title2)
        }
        .disabled(self.entry.count >= 50)
    }

    /// systemMedium で使用するレイアウト (従来の横並び)
    private var mediumLayout: some View {
        HStack(alignment: .center) {
            Spacer()
            self.minusButton
            Spacer()
            Text("\(self.entry.count)")
                .font(.title2)
                .bold()
            Spacer()
            self.plusButton
            Spacer()
        }
    }

    /// systemSmall で使用するレイアウト (テキストを上部に移動)
    private var smallLayout: some View {
        VStack(alignment: .center) {
            Spacer()
            // 上部にカウントを配置
            Text("\(self.entry.count)")
                .font(.title2)
                .bold()

            // 下部に + - ボタンを横並びで配置
            HStack {
                self.minusButton
                self.plusButton
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}
