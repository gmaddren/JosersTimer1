import SwiftUI

public struct TimerDisplayView: View {
    @ObservedObject var viewModel: TimerViewModel
    
    public init(viewModel: TimerViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        Text("Time: \(timeString(from: viewModel.timeRemaining))")
            .font(.title)
    }
    
    private func timeString(from timeInterval: TimeInterval) -> String {
        let minutes = Int(timeInterval) / 60
        let seconds = Int(timeInterval) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

public struct RoundTrackerView: View {
    let currentRound: Int
    
    public init(currentRound: Int) {
        self.currentRound = currentRound
    }
    
    public var body: some View {
        Text("Round: \(currentRound)")
    }
}

public struct TimerControlsView: View {
    @ObservedObject var viewModel: TimerViewModel
    
    public init(viewModel: TimerViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        HStack {
            Button("Start") { viewModel.startTimer() }
            Button("Stop") { viewModel.stopTimer() }
            Button("Reset") { viewModel.resetTimer() }
        }
    }
} 