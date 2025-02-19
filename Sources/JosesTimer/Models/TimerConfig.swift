import Foundation

public struct TimerConfig {
    public static let workRoundDuration: TimeInterval = 180 // 3 minutes
    public static let restRoundDuration: TimeInterval = 60  // 1 minute
    public static let totalRounds = 15
    public static let warningTime: TimeInterval = 5 // Alert sound threshold
}
