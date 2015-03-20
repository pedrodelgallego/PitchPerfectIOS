//
//  PlaySoundsViewController.swift
//  Pitch-Perfect-IOS
//
//  Created by Pedro Del Gallego on 20/03/15.
//  Copyright (c) 2015 Pedro Del Gallego. All rights reserved.
//

import UIKit

class PlaySoundsViewController: UIViewController {
    var recordedAudio: RecordedAudio!
    var audioEngine: PPAudioEngine!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        audioEngine = PPAudioEngine(recordedAudio: recordedAudio)
    }
    
    @IBAction func playSoundFast(sender: UIButton) {
        audioEngine.playAudioWithVariableSpeed(2)
    }
    
    @IBAction func playSoundSlow(sender: UIButton) {
        audioEngine.playAudioWithVariableSpeed(0.5)
    }
    
    @IBAction func playSoundChipmunk(sender: UIButton) {
        audioEngine.playAudioWithVariablePitch(2400)
    }
    
    @IBAction func playSoundDarthVader(sender: UIButton) {
        audioEngine.playAudioWithVariablePitch(-2400)
    }
    
    @IBAction func stopPlayingAudio(sender: UIButton) {
        audioEngine.stop()
    }
}
