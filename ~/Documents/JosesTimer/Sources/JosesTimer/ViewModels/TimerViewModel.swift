import Foundation
import AVFoundation
import SwiftUI

class TimerViewModel: ObservableObject {
    @Published var timeRemaining: TimeInterval
    @Published var isRunning = false
    @Published var currentRound = 1
    @Published var isWorkRound = true
    
    private var timer: Timer?
    private var audioPlayer: AVAudioPlayer?
    
    init() {
        self.timeRemaining = TimerConfig.workRoundDuration
        setupAudio()
    }
    
    private func setupAudio() {
        guard let soundURL = Bundle.main.url(forResource: "beep", withExtension: "wav") else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.prepareToPlay()
        } catch {
            print("Error loading sound: \(error)")
        }
    }
    
    func startTimer() {
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.updateTimer()
        }
    }
    
    func stopTimer() {
        isRunning = false
        timer?.invalidate()
        timer = nil
    }
    
    private func updateTimer() {
        timeRemaining -= 1
        
        if timeRemaining <= TimerConfig.warningTime {
            audioPlayer?.play()
        }
        
        if timeRemaining <= 0 {
            switchRound()
        }
    }
    
    private func switchRound() {
        if isWorkRound {
            isWorkRound = false
            timeRemaining = TimerConfig.restRoundDuration
        } else {
            isWorkRound = true
            timeRemaining = TimerConfig.workRoundDuration
            currentRound += 1
        }
        
        if currentRound > TimerConfig.totalRounds {
            stopTimer()
            currentRound = 1
        }
    }
} 