//
//  TestSM2.swift
//  MGFlashcardDemo
//
//  Created by Tuan Truong on 6/25/15.
//  Copyright (c) 2015 Tuan Truong. All rights reserved.
//

import UIKit

class TestSM2: NSObject {
    func testIntervals() {
        var grades = [0, 3, 4, 5, 5, 1, 4, 5, 5, 5, 4, 3, 4, 5]
        var efs = [ Double(2.5) ]
        var intervals = [1]
        
        for (index, grade) in enumerate(grades) {
            let sm2 = SM2(eFactor: efs[index], qualityResponse: grades[index])
            let newEF = sm2.getNewEFactor()
            let newInterval = sm2.getNextInterval(index)
            efs.append(newEF)
            intervals.append(newInterval)
        }
        
        for interval in intervals {
            println(interval)
        }
        
        for ef in efs {
            println(ef)
        }
    }
   
}
