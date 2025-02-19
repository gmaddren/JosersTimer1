import XCTest
@testable import JosesTimer

final class JosesTimerTests: XCTestCase {
    var viewModel: TimerViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = TimerViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testTimerInitialization() {
        XCTAssertFalse(viewModel.isRunning, "Timer should not be running initially")
        XCTAssertEqual(viewModel.timeRemaining, TimerConfig.workRoundDuration, "Initial time should match work round duration")
        XCTAssertEqual(viewModel.currentRound, 1, "Initial round should be 1")
        XCTAssertTrue(viewModel.isWorkRound, "Initial round should be a work round")
    }
    
    func testAudioConfiguration() {
        XCTAssertEqual(TimerConfig.workStartSound, "workStart", "Work start sound should be configured")
        XCTAssertEqual(TimerConfig.restStartSound, "restStart", "Rest start sound should be configured")
        XCTAssertEqual(TimerConfig.roundCompleteSound, "roundComplete", "Round complete sound should be configured")
    }
    
    func testTimerStart() {
        viewModel.startTimer()
        XCTAssertTrue(viewModel.isRunning, "Timer should be running after start")
    }
    
    func testTimerStop() {
        viewModel.startTimer()
        viewModel.stopTimer()
        XCTAssertFalse(viewModel.isRunning, "Timer should not be running after stop")
    }
    
    func testRoundSwitching() {
        viewModel.timeRemaining = 0
        viewModel.switchRound()
        
        XCTAssertFalse(viewModel.isWorkRound, "Should switch to rest round")
        XCTAssertEqual(viewModel.timeRemaining, TimerConfig.restRoundDuration, "Rest round duration should be set")
    }
    
    func testMultipleRoundSwitches() {
        // Simulate multiple round switches
        viewModel.timeRemaining = 0
        viewModel.switchRound() // Work to Rest
        XCTAssertFalse(viewModel.isWorkRound, "Should be on rest round")
        
        viewModel.timeRemaining = 0
        viewModel.switchRound() // Rest to Work
        XCTAssertTrue(viewModel.isWorkRound, "Should be on work round")
        XCTAssertEqual(viewModel.currentRound, 2, "Should be on second round")
    }
    
    func testTimerReset() {
        viewModel.startTimer()
        viewModel.currentRound = 5
        viewModel.timeRemaining = 10
        
        viewModel.resetTimer()
        
        XCTAssertFalse(viewModel.isRunning, "Timer should not be running after reset")
        XCTAssertEqual(viewModel.currentRound, 1, "Round should reset to 1")
        XCTAssertEqual(viewModel.timeRemaining, TimerConfig.workRoundDuration, "Time should reset to work duration")
        XCTAssertTrue(viewModel.isWorkRound, "Should be on work round after reset")
    }
    
    func testTotalRoundsCompletion() {
        viewModel.currentRound = TimerConfig.totalRounds
        
        viewModel.timeRemaining = 0
        viewModel.switchRound()
        
        XCTAssertFalse(viewModel.isRunning, "Timer should stop after total rounds")
        XCTAssertEqual(viewModel.currentRound, TimerConfig.totalRounds, "Should not increment beyond total rounds")
    }
    
    func testWarningTimeConfiguration() {
        XCTAssertEqual(TimerConfig.warningTime, 5, "Warning time should be 5 seconds")
    }
}
