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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    /// Everytime the users go to the record page, the page should
    /// be ready to start recording again
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setRecordingStatus(false)
    }

    // MARK: User Actions
    @IBAction func startRecordingAudio(sender: UIButton) {
        setRecordingStatus(true)
        startRecording()
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
        setRecordingStatus(false)
        audioRecorder.stop()
        var audioSession = AVAudioSession.sharedInstance()
        audioSession.setActive(false, error: nil)
    }
    
    
    // MARK: UI component status
    
    /// Set the UI components according to the recording status
    /// display/hide the specific elementes of the UI
    func setRecordingStatus(isRecording: Bool){
        recordingLabel.hidden = !isRecording
        stopRecordingButton.hidden = !isRecording
        pauseRecordingButton.hidden = !isRecording
        resumeRecordingButton.hidden = !isRecording
        startRecordingButton.enabled = !isRecording
    }
   
    // MARK: Recording functions
    
    /// Creates an new audioRecorder, initialize a new shareSession
    /// and start recording use the audioRecorder
    func startRecording() {
        audioRecorder = PPAudioRecorder()
        audioRecorder.delegate = self
        recordingLabel.text = "Recording"
        
        var session = AVAudioSession.sharedInstance()
        session.setCategory(AVAudioSessionCategoryPlayAndRecord, error: nil)
        
        audioRecorder.record()
    }
    
    /// Waits for the audioRecorder to finish recording, if the recording was successful, then 
    /// creates a new recordAudio and activage the segue. Otherwise
    /// logs the error, and restore the UI components
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder!, successfully flag: Bool) {
        if (flag){
            recordedAudio = RecordedAudio(title: recorder.url.lastPathComponent!, filePathUrl: recorder.url)
            self.performSegueWithIdentifier("stopRecording", sender: recordedAudio)
        } else {
            println("Recording was not succesful")
            setRecordingStatus(false)
        }
    }

    /// Initialize the recordAudio property in the next PlaySoundsViewController
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "stopRecording"){
            let playSoundsViewController:PlaySoundsViewController = segue.destinationViewController as! PlaySoundsViewController

            playSoundsViewController.recordedAudio = sender as! RecordedAudio
        }
    }
}