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
        audioEngine.playAudioWithEffect(Effect.fastRate())
    }
    
    @IBAction func playSoundSlow(sender: UIButton) {
        audioEngine.playAudioWithEffect(Effect.slowRate())
    }
    
    @IBAction func playSoundChipmunk(sender: UIButton) {
        audioEngine.playAudioWithEffect(Effect.chipmunk())
    }
    
    @IBAction func playSoundDarthVader(sender: UIButton) {
        audioEngine.playAudioWithEffect(Effect.darthVader())
    }
    
    @IBAction func stopPlayingAudio(sender: UIButton) {
        audioEngine.stop()
    }
    
    @IBAction func playSoundEcho(sender: UIButton) {
        audioEngine.playAudioWithEffect(Effect.reverb())
    }
    
}
