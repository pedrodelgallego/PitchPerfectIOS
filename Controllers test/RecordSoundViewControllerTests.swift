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
        XCTAssertEqual(vc.stopRecordingButton.hidden, true, "The stop recording button should be hidden")
        XCTAssertEqual(vc.recordingLabel.hidden, true, "The recording label should be hidden")
        XCTAssertEqual(vc.startRecordingButton.enabled, true, "The recording button should be enabled")
        
        vc.startRecordingAudio(vc.startRecordingButton)
        XCTAssertEqual(vc.stopRecordingButton.hidden, false, "The stop recording button should be visible")
        XCTAssertEqual(vc.startRecordingButton.hidden, false, "The recording label should be visible")
        XCTAssertEqual(vc.startRecordingButton.enabled, false, "The record button should be disabled")
    }
    
    func testStopRecordingAudioControllers(){
        vc.startRecordingAudio(vc.startRecordingButton)
        XCTAssertEqual(vc.stopRecordingButton.hidden, false, "The stop recording button should be visible")
        XCTAssertEqual(vc.startRecordingButton.hidden, false, "The recording label should be visible")
        XCTAssertEqual(vc.startRecordingButton.enabled, false, "The record button should be disabled")
        
        vc.stopRecordingAudio(vc.stopRecordingButton)
        XCTAssertEqual(vc.stopRecordingButton.hidden, true, "The stop recording button should be hidden")
        XCTAssertEqual(vc.recordingLabel.hidden, true, "The recording label should be hidden")
        XCTAssertEqual(vc.startRecordingButton.enabled, true, "The recording button should be enabled")
    }
}
