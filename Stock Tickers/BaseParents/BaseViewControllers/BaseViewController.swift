//
//  BaseViewController.swift
//  TeacherOnDemand
//
//  Created by Peter Bassem on 21/03/2022.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: Properties
    
    // MARK: Initializers
    init() {
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

// MARK: BaseViewProtocol
extension BaseViewController: BaseViewProtocol {
    
    func showLoading() {
        view.subviews.forEach { $0.alpha = 0 }
        SVProgressHUDManager.showLoading()
    }
    
    func hideLoading() {
        view.subviews.forEach { $0.alpha = 1 }
        SVProgressHUDManager.hideLoading()
    }
    
    func showToastMessage(_ message: String) {
    }
    
    func showBottomMessage(_ message: String) {
    }
}
