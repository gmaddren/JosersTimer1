import XCTest
import SwiftUI
@testable import JosesTimer

final class IntegrationTests: XCTestCase {
    var viewModel: TimerViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = TimerViewModel()
    }
    
    func testUIViewModelSync() {
        // Simulate multiple rounds
        for _ in 1...TimerConfig.totalRounds {
            // Work round
            viewModel.startTimer()
            viewModel.timeRemaining = 0
            viewModel.switchRound()
            
            // Rest round
            viewModel.timeRemaining = 0
            viewModel.switchRound()
        }
        
        // Verify timer stops and resets after total rounds
        XCTAssertFalse(viewModel.isRunning, "Timer should stop after total rounds")
        XCTAssertEqual(viewModel.currentRound, 1, "Round should reset to 1")
        XCTAssertTrue(viewModel.isWorkRound, "Should be on work round after reset")
        XCTAssertEqual(viewModel.timeRemaining, TimerConfig.workRoundDuration, "Time should reset to work duration")
    }
    
    func testViewModelStateConsistency() {
        // Rapid state changes
        viewModel.startTimer()
        viewModel.stopTimer()
        viewModel.resetTimer()
        
        XCTAssertFalse(viewModel.isRunning, "Timer should not be running after reset")
        XCTAssertEqual(viewModel.currentRound, 1, "Round should reset to 1")
        XCTAssertTrue(viewModel.isWorkRound, "Should be on work round after reset")
    }
} 