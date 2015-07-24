//
//  CardDto.swift
//  MGFlashcardDemo
//
//  Created by Tuan Truong on 6/25/15.
//  Copyright (c) 2015 Tuan Truong. All rights reserved.
//

import UIKit

enum CardType: Int {
    case New                     = 0
    case Learning                = 1
    case Due                     = 2
}

enum CardQueue: Int {
    case ScheduleBuried          = -3
    case UserBuried              = -2
    case Suspended               = -1
    case New                     = 0
    case Learning                = 1
    case Due                     = 2
}

class CardDto: NSObject {
    var id: String               = ""
    var creationTime: NSDate     = NSDate()
    var modificationTime: NSDate = NSDate()
    
    var type                     = CardType.New
    var queue                    = CardQueue.New
    var due                      = 0
    var interval                 = 0
    var factor: Double           = 2.5
    var reviews                  = 0
    var lapses                   = 0

    var front                    = ""
    var back                     = ""
    
    var qualityResponse          = -1

}
