import XCTest
@testable import JosesTimer

final class JosesTimerTests: XCTestCase {
    func testTimerInitialization() {
        let viewModel = TimerViewModel()
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
}
