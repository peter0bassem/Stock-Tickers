//
//  BoolExtensions.swift
//  Technician App
//
//  Created by GNS Eg on 6/7/22.
//  Copyright © 2022 Technician App. All rights reserved.
//

import Foundation

extension Bool {
    func toData() -> Data {
        var valueInInt = Int(truncating: NSNumber(value: self)) //Convert Bool to Int
        return Data(bytes: &valueInInt, count: MemoryLayout.size(ofValue: valueInInt)) //Int to Data
    }
}
