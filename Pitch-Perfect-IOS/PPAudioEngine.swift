//
//  PPAudioEngine.swift
//  Pitch-Perfect-IOS
//
//  Created by Pedro Del Gallego on 20/03/15.
//  Copyright (c) 2015 Pedro Del Gallego. All rights reserved.
//

import Foundation
import AVFoundation

class PPAudioEngine:NSObject {
    var audioEngine: AVAudioEngine!
    var audioFile:AVAudioFile!
    
    override init() {
        audioEngine = AVAudioEngine()
    }
    
    init(recordedAudio: RecordedAudio) {
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: recordedAudio.filePathUrl, error: nil)
    }
}