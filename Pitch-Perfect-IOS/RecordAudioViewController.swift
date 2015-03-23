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
    var recordedAudio: RecordedAudio!
    
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var startRecordingButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    @IBOutlet weak var pauseRecordingButton: UIButton!
    @IBOutlet weak var resumeRecordingButton: UIButton!
    
    override func viewDidLoad() { super.viewDidLoad() }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        recordingLabel.hidden = true
        stopRecordingButton.hidden = true
    }
    
    @IBAction func startRecordingAudio(sender: UIButton) {
        recordingLabel.hidden = false
        stopRecordingButton.hidden = false
        pauseRecordingButton.hidden = false
        resumeRecordingButton.hidden = false
        startRecordingButton.enabled = false
        
        startRecording()
    }
    
    func startRecording() {
        audioRecorder = PPAudioRecorder()
        audioRecorder.delegate = self
        recordingLabel.text = "Recording"

        var session = AVAudioSession.sharedInstance()
        session.setCategory(AVAudioSessionCategoryPlayAndRecord, error: nil)

        audioRecorder.record()
    }
    
    @IBAction func pauseRecordingAudio(sender: UIButton) {
        recordingLabel.text = "Paused"
        audioRecorder.pause()
    }
    
    @IBAction func resumeRecordingAudio(sender: UIButton) {
        recordingLabel.text = "Recording"
        audioRecorder.record()
    }
    
    @IBAction func stopRecordingAudio(sender: UIButton) {
        recordingLabel.hidden = true
        stopRecordingButton.hidden = true
        pauseRecordingButton.hidden  = true
        resumeRecordingButton.hidden = true
        startRecordingButton.enabled = true
    
        audioRecorder.stop()
        var audioSession = AVAudioSession.sharedInstance()
        audioSession.setActive(false, error: nil)
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder!, successfully flag: Bool) {
        if (flag){
            recordedAudio = RecordedAudio(title: recorder.url.lastPathComponent!, filePathUrl: recorder.url)
            self.performSegueWithIdentifier("stopRecording", sender: recordedAudio)
        } else {
            println("Recording was not succesful")
            startRecordingButton.enabled = true
            stopRecordingButton.hidden = true
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "stopRecording"){
            let playSoundsViewController:PlaySoundsViewController = segue.destinationViewController as! PlaySoundsViewController

            playSoundsViewController.recordedAudio = sender as! RecordedAudio
        }
    }
}