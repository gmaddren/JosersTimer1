import SwiftUI

public struct ContentView: View {
    @StateObject private var viewModel = TimerViewModel()
    
    public init() {}
    
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
                viewModel.isRunning ? viewModel.stopTimer() : viewModel.startTimer()
            }) {
                Text(viewModel.isRunning ? "Stop" : "Start")
                    .font(.title)
                    .padding()
                    .background(viewModel.isWorkRound ? Color.red : Color.green)
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
