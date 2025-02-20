import XCTest
@testable import JosesTimer

final class EdgeCaseTests: XCTestCase {
    var viewModel: TimerViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = TimerViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testRapidStartStopSequence() {
        // Simulate rapid start/stop interactions
        for _ in 1...10 {
            viewModel.startTimer()
            XCTAssertTrue(viewModel.isRunning, "Timer should be running")
            
            viewModel.stopTimer()
            XCTAssertFalse(viewModel.isRunning, "Timer should not be running")
        }
    }
    
    func testTimerWithZeroDuration() {
        // Remove or use the unused variable
        _ = TimerConfig.workRoundDuration
        
        // Simulate zero-duration round
        viewModel.timeRemaining = 0
        viewModel.switchRound()
        
        XCTAssertFalse(viewModel.isWorkRound, "Round should switch")
        XCTAssertEqual(viewModel.timeRemaining, TimerConfig.restRoundDuration, "Time should match rest round duration")
    }
    
    func testMaximumRoundOverflow() {
        // Explicitly set round to maximum
        viewModel.currentRound = TimerConfig.totalRounds
        viewModel.timeRemaining = 0
        viewModel.switchRound()
        
        XCTAssertFalse(viewModel.isRunning, "Timer should stop")
        XCTAssertEqual(viewModel.currentRound, TimerConfig.totalRounds, "Round should not exceed total rounds")
    }
    
    func testResetDuringActiveTimer() {
        viewModel.startTimer()
        viewModel.timeRemaining = 10
        
        viewModel.resetTimer()
        
        XCTAssertFalse(viewModel.isRunning, "Timer should not be running after reset")
        XCTAssertEqual(viewModel.timeRemaining, TimerConfig.workRoundDuration, "Time should reset to work duration")
        XCTAssertEqual(viewModel.currentRound, 1, "Round should reset to 1")
        XCTAssertTrue(viewModel.isWorkRound, "Should be on work round after reset")
    }
    
    func testNegativeTimeHandling() {
        viewModel.timeRemaining = -5
        viewModel.switchRound()
        
        XCTAssertFalse(viewModel.isWorkRound, "Round should switch")
        XCTAssertEqual(viewModel.timeRemaining, TimerConfig.restRoundDuration, "Time should match rest round duration")
    }
    
    func testConcurrentTimerOperations() {
        let expectation = XCTestExpectation(description: "Concurrent Timer Operations")
        
        DispatchQueue.concurrentPerform(iterations: 5) { _ in
            viewModel.startTimer()
            viewModel.stopTimer()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
        XCTAssertFalse(viewModel.isRunning, "Timer should handle concurrent operations")
    }
} 