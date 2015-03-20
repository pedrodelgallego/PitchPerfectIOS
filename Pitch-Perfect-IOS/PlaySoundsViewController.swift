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
    
    @IBAction func playSoundFast(sender: UIButton) {
        println("play sound at 2.0 rate")
    }
    
    @IBAction func playSoundSlow(sender: UIButton) {
        println("play sound at 0.5 rate")
    }
    
    @IBAction func playSoundChipmunk(sender: UIButton) {
        println("play sound pitch +1000")
    }
    
    @IBAction func playSoundDarthVader(sender: UIButton) {
        println("play sound pitch -1000")
    }
    
    @IBAction func stopPlayingAudio(sender: UIButton) {
        println("stop playing sound")
    }
}
