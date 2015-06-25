//
//  DeckDto.swift
//  MGFlashcardDemo
//
//  Created by Tuan Truong on 6/25/15.
//  Copyright (c) 2015 Tuan Truong. All rights reserved.
//

import UIKit

class DeckDto: NSObject {
    var id: String = ""
    var creationTime: NSDate = NSDate()
    var modificationTime: NSDate = NSDate()
    var title = ""
    
    var cards = [CardDto]()
}
