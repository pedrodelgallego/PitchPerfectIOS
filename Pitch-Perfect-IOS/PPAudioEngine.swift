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

    func playAudioWithVariableSpeed(rate: Float){
        stop()
        var effect = AVAudioUnitVarispeed()
        effect.rate = rate
        playAudioWithEffect(effect)
    }
    
    func playAudioWithVariablePitch(pitch: Float){
        stop()
        var effect = AVAudioUnitTimePitch()
        effect.pitch = pitch
        playAudioWithEffect(effect)
    }
    
    func playAudioWithVariableEcho(echo: Float){
        stop()
        var effect = AVAudioUnitReverb()
        effect.loadFactoryPreset(AVAudioUnitReverbPreset.Cathedral)
        effect.wetDryMix = echo
        playAudioWithEffect(effect)
    }
    
    func playAudioWithEffect(effect: AVAudioUnit){
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        audioEngine.attachNode(effect)
        
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