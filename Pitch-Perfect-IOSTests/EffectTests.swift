//
//  PPAudioEffectTests.swift
//  Pitch-Perfect-IOS
//
//  Created by Pedro Del Gallego on 25/03/15.
//  Copyright (c) 2015 Pedro Del Gallego. All rights reserved.
//

import XCTest
import AVFoundation

class EffectTests: XCTestCase {
    func testSpeedRateForSlowEffect() {
        let effect: AVAudioUnitVarispeed = Effect.slowRate()
        XCTAssertEqual(effect.rate, 0.5, "It should play the audio at .5 rate")
    }

    func testSpeedRateForFastEffect() {
        let effect: AVAudioUnitVarispeed = Effect.fastRate()
        XCTAssertEqual(effect.rate, 2.0, "It should play the audio at 2.0 rate")
    }

    func testPitchForChipmunkEffect() {
        let effect: AVAudioUnitTimePitch = Effect.chipmunk()
        XCTAssertEqual(effect.pitch, 1000, "It should play the audio at pitch 1000")
    }

    func testPitchForDarthVaderEffect() {
        let effect: AVAudioUnitTimePitch = Effect.darthVader()
        XCTAssertEqual(effect.pitch, -1000, "It should play the audio at pitch -1000")
    }

    func testPitchForReverbEffect() {
        let effect: AVAudioUnitReverb = Effect.reverb()
        XCTAssertEqual(effect.wetDryMix, 50, "It should play the audio at wetDryMix 50")
    }
}
