//
//  RecordAudioViewController.swift
//  Pitch-Perfect-IOS
//
//  Created by Pedro Del Gallego on 20/03/15.
//  Copyright (c) 2015 Pedro Del Gallego. All rights reserved.
//

import UIKit
import AVFoundation

class RecordAudioViewController: UIViewController, AVAudioRecorderDelegate {
    var audioRecorder: PPAudioRecorder!
    
    @IBOutlet weak var recordingLabel: UILabel!
    
    @IBOutlet weak var startRecordingButton: UIButton!

    @IBOutlet weak var stopRecordingButton: UIButton!

    override func viewDidLoad() { super.viewDidLoad() }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        recordingLabel.hidden = true
        stopRecordingButton.hidden = true
    }
    
    @IBAction func startRecordingAudio(sender: UIButton) {
        recordingLabel.hidden = false
        stopRecordingButton.hidden = false
        startRecordingButton.enabled = false
        startRecording()
    }
    
    func startRecording() {
        audioRecorder = PPAudioRecorder()
        audioRecorder.delegate = self
        
        var session = AVAudioSession.sharedInstance()
        session.setCategory(AVAudioSessionCategoryPlayAndRecord, error: nil)

        audioRecorder.record()
    }
    
    @IBAction func stopRecordingAudio(sender: UIButton) {
        recordingLabel.hidden = true
        stopRecordingButton.hidden = true
        startRecordingButton.enabled = true
    
        audioRecorder.stop()
        var audioSession = AVAudioSession.sharedInstance()
        audioSession.setActive(false, error: nil)
    }
}