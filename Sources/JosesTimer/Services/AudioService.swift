import Foundation
import AVFoundation

public protocol AudioServiceProtocol {
    func playSound(_ soundName: String)
}

public class AudioService: AudioServiceProtocol {
    public static let shared = AudioService()
    private var audioPlayer: AVAudioPlayer?
    
    public func playSound(_ soundName: String) {
        // Try multiple bundle loading strategies
        guard let url = findSoundURL(for: soundName) else {
            print("Sound file not found: \(soundName)")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error playing sound \(soundName): \(error)")
        }
    }
    
    private func findSoundURL(for soundName: String) -> URL? {
        let possibleBundles = [
            Bundle.main,
            Bundle(for: AudioService.self),
            Bundle.module
        ]
        
        for bundle in possibleBundles {
            if let url = bundle.url(forResource: soundName, withExtension: "wav") {
                return url
            }
        }
        
        return nil
    }
} 