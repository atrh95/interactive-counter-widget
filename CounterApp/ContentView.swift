import SwiftUI

struct ContentView: View {
    @StateObject private var counter = SharedCounter.shared
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Counter App")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("\(counter.count)")
                .font(.system(size: 80, weight: .bold, design: .rounded))
                .foregroundColor(.blue)
            
            HStack(spacing: 20) {
                Button("-") {
                    counter.decrement()
                }
                .font(.title)
                .frame(width: 60, height: 60)
                .background(Color.red)
                .foregroundColor(.white)
                .clipShape(Circle())
                
                Button("Reset") {
                    counter.reset()
                }
                .font(.title3)
                .frame(width: 80, height: 60)
                .background(Color.gray)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Button("+") {
                    counter.increment()
                }
                .font(.title)
                .frame(width: 60, height: 60)
                .background(Color.green)
                .foregroundColor(.white)
                .clipShape(Circle())
            }
            
            Text("ウィジェットからカウンターを操作できます")
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
