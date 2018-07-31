# AESound

**Convenience API for playing iOS system sounds**

> I made this for personal use, but feel free to use it or contribute.

## Usage

```swift
// AudioToolbox
AESound().playSystemSound(.uisounds_go_to_sleep_alert)

// AVFoundation
let output = AESound()
let path = AESound.SystemSound.uisounds_go_to_sleep_alert.rawValue
output.prepareSound(atPath: path)
output.playSound(atPath: path)
output.cleanupSound(atPath: path)
```

## Installation

- Add [AESound.swift](AESound/AESound.swift) file into project

## License
This code is released under the MIT license. See [LICENSE](LICENSE) for details.
