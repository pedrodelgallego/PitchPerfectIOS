//
//  PPAudioEngineTests.swift
//  Pitch-Perfect-IOS
//
//  Created by Pedro Del Gallego on 20/03/15.
//  Copyright (c) 2015 Pedro Del Gallego. All rights reserved.
//

import AVFoundation
import XCTest

class PPAudioEngineTests: XCTestCase {
    var audioEngine: PPAudioEngine!
    var recordedAudio: RecordedAudio!
    var filePathUrl:NSURL!

    override func setUp() {
        super.setUp()
        
        var testBundle = NSBundle(forClass: RecordedAudioTests.self)
        filePathUrl = testBundle.URLForResource("movie_quote", withExtension: "mp3")!
        
        recordedAudio = RecordedAudio(title: "A title", filePathUrl: filePathUrl)
    }
    
    func testInitWithRecordedAudio(){
        audioEngine = PPAudioEngine(recordedAudio: recordedAudio)
        XCTAssertNotNil(audioEngine.audioEngine, "After initializing it should have a audioEngine")
        XCTAssertNotNil(audioEngine.audioFile, "After initializing it should have a audioFile")
        XCTAssertEqual(audioEngine.audioFile.url, filePathUrl,"the audio file should be the same that we pass to the recordedAudio")
    }

}
