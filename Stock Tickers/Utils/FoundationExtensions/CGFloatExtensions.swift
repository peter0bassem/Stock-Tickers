//
//  CGFloatExtensions.swift
//  Driver
//
//  Created by Peter Bassem on 27/12/2020.
//  Copyright © 2020 Eslam Maged. All rights reserved.
//

import UIKit

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
    
    func toDouble() -> Double {
        return Double(self)
    }
    
    func toInt() -> Int {
        return Int(self)
    }
    
    func toFloat() -> Float {
        return Float(self)
    }
}
