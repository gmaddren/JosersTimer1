# Product Requirements Document (PRD)

## 1. Product Overview
**Product Name:** Jose's Timer  
**Description:** An iPhone app designed for boxing training, providing a structured countdown timer for workout and rest rounds. The timer follows a 3-minute work round and a 1-minute rest round for 15 cycles, with an alert sound within 5 seconds of each transition.

## 2. Objectives & Goals
- Provide a simple and effective boxing training timer
- Ensure clear audio cues for round transitions
- Allow users to start and stop the timer as needed
- Deliver a seamless and user-friendly experience for athletes and trainers

## 3. Target Audience
- Boxers (amateur and professional)
- Fitness enthusiasts practicing interval training
- Coaches and trainers
- General users looking for structured workout timers

## 4. Features & Requirements

### 4.1 Core Features
- **Countdown Timer:**
  - 3-minute work round
  - 1-minute rest round
  - 15 cycles in total
- **Audio Alerts:**
  - Beep within 5 seconds of each round transition (both work and rest rounds)
- **Start/Stop Functionality:**
  - Users can start and stop the timer at any point
- **Simple UI:**
  - Clear visual representation of time remaining
  - Intuitive start/stop button

### 4.2 Optional Features (Future Enhancements)
- Customizable round and rest durations
- Different sound options for round transitions
- Vibration support for silent alerts
- Integration with Apple Health for workout tracking

## 5. Technical Requirements
- **Platform:** iOS (iPhone)
- **Language:** Swift
- **Minimum iOS Version:** iOS 15.0+
- **Device Support:** iPhone only (portrait orientation)
- **Frameworks:**
  - UIKit/SwiftUI for UI
  - AVFoundation for audio
  - Timer functionality using native iOS components