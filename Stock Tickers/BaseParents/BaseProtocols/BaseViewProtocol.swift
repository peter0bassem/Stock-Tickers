//
//  BaseViewProtocol.swift
//  TeacherOnDemand
//
//  Created by Peter Bassem on 21/03/2022.
//

import Foundation

protocol BaseViewProtocol: AnyObject {
    func showLoading()
    func hideLoading()
    func showToastMessage(_ message: String)
    func showBottomMessage(_ message: String)
}
