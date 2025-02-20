import Foundation
import AVFoundation
import SwiftUI

public class TimerViewModel: ObservableObject {
    @Published public var timeRemaining: TimeInterval
    @Published public var isRunning = false
    @Published public var currentRound = 1
    @Published public var isWorkRound = true
    
    private var timer: Timer?
    private let audioService: AudioServiceProtocol
    
    public init(audioService: AudioServiceProtocol = AudioService.shared) {
        self.audioService = audioService
        self.timeRemaining = TimerConfig.workRoundDuration
    }
    
    private func playSound(_ soundName: String) {
        // Simplified audio playback with system sound
        AudioServicesPlaySystemSound(SystemSoundID(1104)) // Default system sound
        
        // Optional: Detailed audio file loading (commented out)
        /*
        guard let url = Bundle.module.url(forResource: soundName, withExtension: "wav") else {
            print("Sound file not found: \(soundName)")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error)")
        }
        */
    }
    
    public func startTimer() {
        guard !isRunning else { return }
        
        isRunning = true
        playSound(TimerConfig.workStartSound)
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            self.timeRemaining -= 1
            
            // Play warning sound at 5 seconds
            if self.timeRemaining <= TimerConfig.warningTime {
                self.playSound("warning")
            }
            
            if self.timeRemaining <= 0 {
                self.switchRound()
            }
        }
    }
    
    public func stopTimer() {
        timer?.invalidate()
        timer = nil
        isRunning = false
    }
    
    public func switchRound() {
        if isWorkRound {
            // Play rest start sound
            audioService.playSound(TimerConfig.restStartSound)
        } else {
            // Play work start sound
            audioService.playSound(TimerConfig.workStartSound)
        }
        
        if isWorkRound {
            // Switch to rest round
            timeRemaining = TimerConfig.restRoundDuration
            isWorkRound = false
        } else {
            // Switch to work round
            timeRemaining = TimerConfig.workRoundDuration
            isWorkRound = true
            
            // Increment round
            currentRound += 1
        }
        
        // Explicitly handle total rounds completion
        if currentRound > TimerConfig.totalRounds {
            stopTimer()
            resetTimer()
        }
    }
    
    public func resetTimer() {
        // Force stop timer
        stopTimer()
        
        // Explicitly reset all state
        timeRemaining = TimerConfig.workRoundDuration
        currentRound = 1
        isWorkRound = true
        isRunning = false
    }
} 