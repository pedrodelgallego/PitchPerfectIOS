//
//  Controllers_test.swift
//  Controllers test
//
//  Created by Pedro Del Gallego on 20/03/15.
//  Copyright (c) 2015 Pedro Del Gallego. All rights reserved.
//


import UIKit
import XCTest

class RecordSoundViewControllerTest: XCTestCase {
    var vc : RecordAudioViewController!
    
    override func setUp() {
        var storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: NSBundle(forClass: self.dynamicType))
        vc = storyboard.instantiateViewControllerWithIdentifier("RecordAudioVC") as! RecordAudioViewController
        
        let _ = vc.view
    }
    
    func testStartRecordingAudioControllers(){
        XCTAssertTrue(vc.stopRecordingButton.hidden,   "The stop button should be hidden")
        XCTAssertTrue(vc.pauseRecordingButton.hidden,  "The pause button should be hidden")
        XCTAssertTrue(vc.resumeRecordingButton.hidden, "The resume button should be hidden")
        XCTAssertTrue(vc.recordingLabel.hidden,        "The recording label should be hidden")
        XCTAssertTrue(vc.startRecordingButton.enabled, "The recording button should be enabled")
        
        vc.startRecordingAudio(vc.startRecordingButton)
        XCTAssertFalse(vc.stopRecordingButton.hidden,   "The stop recording button should be visible")
        XCTAssertFalse(vc.pauseRecordingButton.hidden,  "The pause button should be visible")
        XCTAssertFalse(vc.resumeRecordingButton.hidden, "The resume button should be visible")
        XCTAssertFalse(vc.startRecordingButton.hidden,  "The recording label should be visible")
        XCTAssertFalse(vc.startRecordingButton.enabled, "The record button should be disabled")
    }
    
    func testStopRecordingAudioControllers(){
        vc.startRecordingAudio(vc.startRecordingButton)
        XCTAssertFalse(vc.stopRecordingButton.hidden,   "The stop recording button should be visible")
        XCTAssertFalse(vc.startRecordingButton.hidden,  "The recording label should be visible")
        XCTAssertFalse(vc.startRecordingButton.enabled, "The record button should be disabled")
        
        vc.stopRecordingAudio(vc.stopRecordingButton)
        XCTAssertTrue(vc.stopRecordingButton.hidden,   "The stop recording button should be hidden")
        XCTAssertTrue(vc.recordingLabel.hidden,        "The recording label should be hidden")
        XCTAssertTrue(vc.pauseRecordingButton.hidden,  "The pause button should be hidden")
        XCTAssertTrue(vc.resumeRecordingButton.hidden, "The resume button should be hidden")
        XCTAssertTrue(vc.startRecordingButton.enabled, "The recording button should be enabled")
    }
}
