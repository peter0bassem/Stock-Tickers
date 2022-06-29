//
//  SVProgressHUDManager.swift
//  Stock Tickers
//
//  Created by Peter Bassem on 29/06/2022.
//

import Foundation
#if canImport(SVProgressHUD)
import SVProgressHUD

class SVProgressHUDManager {
    static func showLoading(onView view: UIView) {
        SVProgressHUD.show()
    }
    
    static func hideLoading() {
        SVProgressHUD.dismiss()
    }
}

#endif
