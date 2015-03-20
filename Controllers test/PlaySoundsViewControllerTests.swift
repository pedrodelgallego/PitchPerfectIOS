//
//  PlaySoundsViewControllerTests.swift
//  Pitch-Perfect-IOS
//
//  Created by Pedro Del Gallego on 20/03/15.
//  Copyright (c) 2015 Pedro Del Gallego. All rights reserved.
//

import UIKit
import XCTest

class PlaySoundsViewControllerTests: XCTestCase {
    var vc : PlaySoundsViewController!
    var recordedAudio: RecordedAudio!
    
    override func setUp() {
        let testBundle:NSBundle = NSBundle(forClass: PlaySoundsViewControllerTests.self)
        let filePathUrl:NSURL! = testBundle.URLForResource("movie_quote", withExtension: "mp3")
        recordedAudio = RecordedAudio(title: "A title", filePathUrl: filePathUrl)
        
        var storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: NSBundle(forClass: self.dynamicType))
        vc = storyboard.instantiateViewControllerWithIdentifier("PlaySoundsVC") as! PlaySoundsViewController
        
        vc.recordedAudio = recordedAudio
        let _ = vc.view
    }

    func testItCreatesAnPPAudioEngineWithARecordedAudio(){
        XCTAssertNotNil(vc.audioEngine, "it should have an audioEngine")
        XCTAssertEqual(vc.audioEngine.audioFile.url, recordedAudio.filePathUrl, "the audioEngine should play the file that was paased to the VC")
    }
}
