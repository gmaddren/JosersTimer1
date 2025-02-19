import XCTest
@testable import JosesTimer

final class JosesTimerTests: XCTestCase {
    func testTimerViewModel() {
        let viewModel = TimerViewModel()
        XCTAssertFalse(viewModel.isRunning, "Timer should not be running initially")
    }
    
    func testTimerConfig() {
        XCTAssertEqual(TimerConfig.totalRounds, 15, "Total rounds should be 15")
    }
}
