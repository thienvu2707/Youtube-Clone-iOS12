//
//  Video.swift
//  Youtube-clone
//
//  Created by Thien Vu Le on Nov/5/18.
//  Copyright © 2018 Thien Vu Le. All rights reserved.
//

import UIKit

class Video: NSObject {
    var thumbnailImage: String?
    var title: String?
    var numberOfViews: NSNumber?
    var uploadDate: NSDate?
    
    var channel: Channel?
}

class Channel: NSObject {
    var name: String?
    var profileImage: String?
}
