import SwiftUI
import ICUserDefaultsManager

struct ContentView: View {
    @StateObject private var counter = CounterFeature()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                HStack(spacing: 50) {
                    Button {
                        counter.decrement()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(counter.count <= 0 ? .gray : .accentColor)
                            .frame(width: 60, height: 60)
                    }
                    .disabled(counter.count <= 0)

                    Text("\(counter.count)")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.gray)
                        .frame(height: 40)

                    Button {
                        counter.increment()
                    } label: {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(counter.count >= 50 ? .gray : .accentColor)
                            .frame(width: 60, height: 60)
                    }
                    .disabled(counter.count >= 50)
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
