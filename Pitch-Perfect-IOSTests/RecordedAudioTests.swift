//
//  RecordedAudioTests.swift
//  Pitch-Perfect-IOS
//
//  Created by Pedro Del Gallego on 20/03/15.
//  Copyright (c) 2015 Pedro Del Gallego. All rights reserved.
//


import XCTest

class RecordedAudioTests: XCTestCase {
    var recordedAudio: RecordedAudio!
    var filePathUrl: NSURL!
    
    override func setUp() {
        var testBundle = NSBundle(forClass: RecordedAudioTests.self)
        filePathUrl = testBundle.URLForResource("movie_quote", withExtension: "mp3")
    }
    
    func testInitWithFilePathUrlAndTitle(){
        recordedAudio = RecordedAudio(title: "A title", filePathUrl: filePathUrl)
        XCTAssertEqual(recordedAudio.title, "A title", "Should be initialized with a title")
        XCTAssertEqual(recordedAudio.filePathUrl, filePathUrl, "Should be initialized with a filePathUrl")
    }
}
