import XCTest
import SwiftUI
@testable import JosesTimer

final class UITests: XCTestCase {
    func testContentViewInitialization() {
        let contentView = ContentView()
        XCTAssertNotNil(contentView, "ContentView should initialize")
    }
    
    func testTimerDisplayView() {
        let viewModel = TimerViewModel()
        let displayView = TimerDisplayView(viewModel: viewModel)
        XCTAssertNotNil(displayView, "TimerDisplayView should initialize")
    }
    
    func testTimerControlsView() {
        let viewModel = TimerViewModel()
        let controlsView = TimerControlsView(viewModel: viewModel)
        XCTAssertNotNil(controlsView, "TimerControlsView should initialize")
    }
} 