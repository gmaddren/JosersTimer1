import Foundation
import SwiftUI

struct TimerConfig {
    static let workRoundDuration: TimeInterval = 180 // 3 minutes
    static let restRoundDuration: TimeInterval = 60  // 1 minute
    static let totalRounds = 15
    static let warningTime: TimeInterval = 5 // Alert sound threshold
}

struct ContentView: View {
    var body: some View {
        Text("Hello, Joses Timer!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
} 