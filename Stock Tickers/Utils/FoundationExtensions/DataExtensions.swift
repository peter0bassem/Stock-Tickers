//
//  DataExtensions.swift
//  Technician App
//
//  Created by Peter Bassem on 02/06/2022.
//  Copyright © 2022 Technician App. All rights reserved.
//

import Foundation
import UIKit

extension Data {
    var toImage: UIImage? {
        return UIImage(data: self)
    }
}
