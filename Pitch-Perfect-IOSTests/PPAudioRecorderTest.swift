//
//  PPAudioRecorderTest.swift
//  Pitch-Perfect-IOS
//
//  Created by Pedro Del Gallego on 20/03/15.
//  Copyright (c) 2015 Pedro Del Gallego. All rights reserved.
//

import UIKit
import XCTest

class PPAudioRecorderTest: XCTestCase {
    var audioRecorder: PPAudioRecorder!
    
    override func setUp() {
        super.setUp()
    }

    func testStartRecordingAudioUseAnAudioVideo(){
        audioRecorder = PPAudioRecorder()
        XCTAssertNotNil(audioRecorder.url, "should add a url")
    }
}
