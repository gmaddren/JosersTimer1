<div align="center">
    <img src="assets/your_logo_filename.png" alt="JosesTimer Logo" width="250" height="250">
    
    # JosesTimer
    
    **Interval Timer for Focused Work and Rest**
</div>

## Overview
JosesTimer is a Swift-based interval timer application designed for structured work and rest cycles.

## Features
- Configurable work and rest intervals
- Total round tracking
- Audio notifications
- Flexible timer management

## Installation

### Swift Package Manager
Add to your project's dependencies:

```swift
dependencies: [
    .package(url: "https://github.com/yourusername/JosesTimer.git", from: "1.0.0")
]
```

## Usage

### Basic Timer Configuration
```swift
let timer = TimerViewModel()
timer.startTimer() // Begin timer
timer.stopTimer()  // Stop timer
timer.resetTimer() // Reset to initial state
```

## Configuration

### Timer Settings
- Work Round Duration: 3 minutes
- Rest Round Duration: 1 minute
- Total Rounds: 15

## Development

### Running Tests
```bash
swift test
```

## Contributing
Please read our [Contributing Guidelines](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## License
MIT License
