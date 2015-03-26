//
//  RecordedAudio.swift
//  Pitch-Perfect-IOS
//
//  Created by Pedro Del Gallego on 20/03/15.
//  Copyright (c) 2015 Pedro Del Gallego. All rights reserved.
//

import Foundation

/// Store the information about the current audio file
class RecordedAudio: NSObject {
    var title: String!
    var filePathUrl: NSURL!
    
    init(title: String, filePathUrl: NSURL){
        self.title = title
        self.filePathUrl = filePathUrl
    }
}