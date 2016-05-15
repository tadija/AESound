//
//  AESound.swift
//  Touch League
//
//  Created by Marko Tadic on 5/15/16.
//  Copyright © 2016 AE. All rights reserved.
//

import AudioToolbox
import UIKit

// MARK: - AESound

public class AESound {
    
    public class func play(soundPath: String) {
        var soundID: SystemSoundID = 0
        let pathURL = NSURL(fileURLWithPath: soundPath)
        AudioServicesCreateSystemSoundID(pathURL as CFURLRef, &soundID)
        play(soundID)
    }
    
    public class func play(soundID: SystemSoundID) {
        AudioServicesPlaySystemSound(soundID)
    }
    
}


