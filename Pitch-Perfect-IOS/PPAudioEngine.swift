//
//  PPAudioEngine.swift
//  Pitch-Perfect-IOS
//
//  Created by Pedro Del Gallego on 20/03/15.
//  Copyright (c) 2015 Pedro Del Gallego. All rights reserved.
//

import Foundation
import AVFoundation

// Encapsulate the AudioEngine specific logic of the Pitch Perfect app
class PPAudioEngine: NSObject {
    var audioEngine: AVAudioEngine!
    var audioFile:   AVAudioFile!
    
    override init() {
        audioEngine = AVAudioEngine()
    }
    
    /**
        Creates a new PPAudioEngine that will use the RecordedAudio file
        when it creates
    **/
    init(recordedAudio: RecordedAudio) {
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: recordedAudio.filePathUrl, error: nil)
    }
    
    /**
        Play an AVAudioUnit effect
    
        :param: The AVAudioUnit effect that creates will be use to modify 
        the audio engine output
    **/
    func playAudioWithEffect(effect: AVAudioUnit){
        stop()

        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        audioEngine.attachNode(effect)
        
        // Concatened the audio nodes that will alter the output of the audioEngine
        audioEngine.connect(audioPlayerNode, to: effect, format: nil)
        audioEngine.connect(effect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        
        audioPlayerNode.play()
    }
    
    func stop(){
        audioEngine.stop()
        audioEngine.reset()
    }
}