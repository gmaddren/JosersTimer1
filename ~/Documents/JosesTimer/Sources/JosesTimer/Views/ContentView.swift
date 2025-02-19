import SwiftUI

public struct ContentView: View {
    @StateObject private var viewModel = TimerViewModel()
    
    public init() {}  // Required for public access
    
    public var body: some View {
        VStack {
            Text(timeString(from: viewModel.timeRemaining))
                .font(.system(size: 70, weight: .bold))
            
            Text("Round \(viewModel.currentRound)/\(TimerConfig.totalRounds)")
                .font(.title2)
            
            Text(viewModel.isWorkRound ? "Work" : "Rest")
                .font(.title)
                .foregroundColor(viewModel.isWorkRound ? .red : .green)
            
            Button(action: {
                if viewModel.isRunning {
                    viewModel.stopTimer()
                } else {
                    viewModel.startTimer()
                }
            }) {
                Text(viewModel.isRunning ? "Stop" : "Start")
                    .font(.title)
                    .padding()
                    .background(viewModel.isRunning ? Color.red : Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
    
    private func timeString(from timeInterval: TimeInterval) -> String {
        let minutes = Int(timeInterval) / 60
        let seconds = Int(timeInterval) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
} 