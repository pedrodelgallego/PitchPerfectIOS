//
//  PPAudioRecorder.swift
//  Pitch-Perfect-IOS
//
//  Created by Pedro Del Gallego on 20/03/15.
//  Copyright (c) 2015 Pedro Del Gallego. All rights reserved.
//

import Foundation
import AVFoundation

/// The PPAudioRecorder encapsulate the specific behavior of the 
/// AVAudioRecorder in the Perfect Pitch application
class PPAudioRecorder: AVAudioRecorder {
    
    /**
        Initializes a new PPAudioRecorder with a url path to the file that
        will contains the audio file.
    
        The name of the file will be NSBundle.url + ddMMyyyy-HHmmss.wav
    
        :returns: A new PPAudioRecorder
    */
    override init() {
        // found path to store
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
        
        // Initial time, that will be use as file name
        let currentDateTime = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "ddMMyyyy-HHmmss"
        
        // Set file name
        let recordingName = formatter.stringFromDate(currentDateTime)+".wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        
        // Start recording
        super.init(URL: filePath, settings: nil, error: nil)

        self.meteringEnabled = true
    }
}
