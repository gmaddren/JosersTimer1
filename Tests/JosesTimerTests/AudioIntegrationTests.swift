import XCTest
@testable import JosesTimer

class MockAudioService: AudioServiceProtocol {
    var playedSounds: [String] = []
    
    public func playSound(_ soundName: String) {
        playedSounds.append(soundName)
    }
}

final class AudioIntegrationTests: XCTestCase {
    func testWorkToRestRoundSoundPlay() {
        let mockAudioService = MockAudioService()
        let viewModel = TimerViewModel(audioService: mockAudioService)
        
        // Simulate work to rest round switch
        viewModel.isWorkRound = true
        viewModel.timeRemaining = 0
        viewModel.switchRound()
        
        XCTAssertEqual(mockAudioService.playedSounds.first, TimerConfig.restStartSound, "Rest start sound should play")
    }
    
    func testRestToWorkRoundSoundPlay() {
        let mockAudioService = MockAudioService()
        let viewModel = TimerViewModel(audioService: mockAudioService)
        
        // Simulate rest to work round switch
        viewModel.isWorkRound = false
        viewModel.timeRemaining = 0
        viewModel.switchRound()
        
        XCTAssertEqual(mockAudioService.playedSounds.first, TimerConfig.workStartSound, "Work start sound should play")
    }
} 