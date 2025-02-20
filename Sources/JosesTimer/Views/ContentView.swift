import SwiftUI

public struct ContentView: View {
    @StateObject private var viewModel = TimerViewModel()
    
    public init() {}
    
    public var body: some View {
        VStack {
            Text("JosesTimer")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Debug: Timer Initialized")
            
            TimerDisplayView(viewModel: viewModel)
            
            RoundTrackerView(currentRound: viewModel.currentRound)
            
            TimerControlsView(viewModel: viewModel)
        }
        .padding()
    }
}

struct TimerDisplayView: View {
    @ObservedObject var viewModel: TimerViewModel
    
    var body: some View {
        VStack {
            Text(timeString(from: viewModel.timeRemaining))
                .font(.system(size: 72, design: .monospaced))
                .fontWeight(.bold)
            
            Text(viewModel.isWorkRound ? "Work Round" : "Rest Round")
                .foregroundColor(viewModel.isWorkRound ? .red : .green)
        }
    }
    
    private func timeString(from timeInterval: TimeInterval) -> String {
        let minutes = Int(timeInterval) / 60
        let seconds = Int(timeInterval) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

struct RoundTrackerView: View {
    let currentRound: Int
    
    var body: some View {
        HStack {
            ForEach(1...TimerConfig.totalRounds, id: \.self) { round in
                Circle()
                    .fill(round <= currentRound ? Color.blue : Color.gray.opacity(0.3))
                    .frame(width: 20, height: 20)
            }
        }
        .padding()
    }
}

struct TimerControlsView: View {
    @ObservedObject var viewModel: TimerViewModel
    
    var body: some View {
        HStack {
            Button(action: {
                viewModel.startTimer()
            }) {
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 70)
                    .foregroundColor(.green)
            }
            .disabled(viewModel.isRunning)
            
            Button(action: {
                viewModel.stopTimer()
            }) {
                Image(systemName: "stop.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 70)
                    .foregroundColor(.red)
            }
            .disabled(!viewModel.isRunning)
            
            Button(action: {
                viewModel.resetTimer()
            }) {
                Image(systemName: "arrow.clockwise.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 70)
                    .foregroundColor(.blue)
            }
        }
    }
}
