//
//  MainAppRouter.swift
//  TeacherOnDemand
//
//  Created by Peter Bassem on 21/03/2022.
//  Copyright © 2022 LighthouseHF. All rights reserved.
//

import Foundation
import UIKit

class MainAppRouter {
    private static var mWindow: UIWindow!
    
    static func setRoot(_ window: UIWindow? = nil) -> UIWindow? {
        if let window = window {
            self.mWindow = window
        }
        mWindow.rootViewController = UINavigationController(rootViewController: HomeRouter.createModule())
        mWindow.makeKeyAndVisible()
        return mWindow
    }
}
