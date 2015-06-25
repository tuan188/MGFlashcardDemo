//
//  SchedulingAlgorithm.swift
//  MGFlashcardDemo
//
//  Created by Tuan Truong on 6/25/15.
//  Copyright (c) 2015 Tuan Truong. All rights reserved.
//

import UIKit

class SchedulingAlgorithm: NSObject {
    var eFactor: Double = 0
    
    private var _qualityResponse: Int = 0
    
    var qualityResponse: Int {
        get {
            return _qualityResponse
        }
        set {
            _qualityResponse = newValue
            if _qualityResponse < 3 {
                eFactor = defaultEFactor
            }
        }
    }
    
    var defaultEFactor: Double = 2.5
    
    
    func getNextInterval(n: Int) -> Int {
        return 0 // Abstract class
    }
    
    func getNewEFactor() -> Double {
        return 0 // Abstract class
    }
    
}
