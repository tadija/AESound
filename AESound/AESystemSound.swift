/**
 *  https://github.com/tadija/AESystemSound
 *  Copyright (c) Marko Tadić 2018
 *  Licensed under the MIT license. See LICENSE file.
 */

import AudioToolbox

public struct AESystemSound {
    public static func play(fromPath path: String) {
        var id: SystemSoundID = 0
        let url = URL(fileURLWithPath: path)
        AudioServicesCreateSystemSoundID(url as CFURL, &id)
        play(withID: id)
    }
    public static func play(withID id: SystemSoundID) {
        AudioServicesPlaySystemSound(id)
    }
}
