//
//  Effect.swift
//  Pitch-Perfect-IOS
//
//  Created by Pedro Del Gallego on 25/03/15.
//  Copyright (c) 2015 Pedro Del Gallego. All rights reserved.
//

import Foundation
import AVFoundation

/**
    A singleton class that encapsulate the logic to create specific effects for 
    Pitch Perfect

    Each static method generates an AVAudioUnit effect that can be consume by the 
    PPAudioEngine
**/
class Effect: NSObject {

    /// MARK: Effect Builders
    class func variableSpeedRateEffect(rate: Float) -> AVAudioUnitVarispeed {
        let effect: AVAudioUnitVarispeed = AVAudioUnitVarispeed()
        effect.rate = rate
        return effect
    }
    
    class func variableTimePitchEffect(pitch: Float) -> AVAudioUnitTimePitch{
        let effect: AVAudioUnitTimePitch = AVAudioUnitTimePitch()
        effect.pitch = pitch
        return effect
    }
    
    class func reverb() -> AVAudioUnitReverb {
        let effect:AVAudioUnitReverb = AVAudioUnitReverb()
        effect.loadFactoryPreset(AVAudioUnitReverbPreset.Cathedral)
        effect.wetDryMix = 50
        return effect
    }
    
    /// MARK: Built-in effects
    class func slowRate() -> AVAudioUnitVarispeed {
        return variableSpeedRateEffect(0.5)
    }

    class func fastRate() -> AVAudioUnitVarispeed {
        return variableSpeedRateEffect(2)
    }
    
    class func chipmunk() -> AVAudioUnitTimePitch {
        return variableTimePitchEffect(1000)
    }
    
    class func darthVader() -> AVAudioUnitTimePitch {
        return variableTimePitchEffect(-1000)
    }
    
}