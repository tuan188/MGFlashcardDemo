//
//  SM2.swift
//  MGFlashcardDemo
//
//  Created by Tuan Truong on 6/25/15.
//  Copyright (c) 2015 Tuan Truong. All rights reserved.
//

import UIKit

class SM2: SchedulingAlgorithm {
    override init() {
        super.init()
        eFactor = 2.5
        qualityResponse = 0
    }
    
    init(eFactor: Double, qualityResponse: Int) {
        super.init()
        self.eFactor = eFactor
        self.qualityResponse = qualityResponse
    }
    
    override func getNextInterval(n: Int) -> Int {
        if (n==1) {
            return 1
        }
        else if (n==2) {
            return 6
        }
        else if (n>2) {
            return Int(Double(n-1)*eFactor)
        }
        else {
            return 0
        }
    }
    
    override func getNewEFactor() -> Double {
        var newEFactor: Double = eFactor + (0.1-Double(5-qualityResponse)*(0.08+Double(5-qualityResponse)*0.02))
        
        if (newEFactor < 1.3) {
            newEFactor = 1.3
        }
        return newEFactor
    }
   
}
