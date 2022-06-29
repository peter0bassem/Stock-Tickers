//
//  App+DeviceConstants.swift
//  TeacherOnDemand
//
//  Created by Peter Bassem on 21/03/2022.
//

import Foundation
import UIKit

var keyWindow: UIWindow? {
    if #available(iOS 13.0, *) {
        return UIApplication
            .shared
            .connectedScenes
            .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
            .first { $0.isKeyWindow }
    } else {
        return UIApplication.shared.keyWindow
    }
}

var screenWidth: CGFloat {
    UIScreen.main.bounds.width
}

var screenHeight: CGFloat {
    UIScreen.main.bounds.height
}

let application = UIApplication.shared
let appDelegate = UIApplication.shared.delegate as? AppDelegate

@available(iOS 13.0, *)
let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
