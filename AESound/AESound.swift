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
    
    // MARK: - API
    
    public class func play(fromPath path: String) {
        var soundID: SystemSoundID = 0
        let pathURL = URL(fileURLWithPath: path)
        AudioServicesCreateSystemSoundID(pathURL as CFURL, &soundID)
        play(soundID)
    }
    
    public class func play(_ soundID: SystemSoundID) {
        AudioServicesPlaySystemSound(soundID)
    }
    
}
