//
//  BaseRouterPorotocol.swift
//  TeacherOnDemand
//
//  Created by Peter Bassem on 21/03/2022.
//

import Foundation
import UIKit

protocol BaseRouterProtocol {
    func showCountriesList()
    func popupViewController(completion: VoidCompletion?)
    func popup(to viewController: AnyClass)
    func dismissViewController()
    func presentImagePickerViewController(sourceView: AnyObject?, completion: @escaping (UIImage, URL?) -> Void)
    func presentDocumentPickerViewController(allowMultipleSelection: Bool, completion: @escaping ([URL]) -> Void)
    func openBrowser(fromUrl url: String)
    func openMailClient()
    func showSettingsAlert()
    func presentActionControl(title: String?, message: String?, firstActionTitle: String?, firstAction: (() -> Void)?, secondActionTitle: String?, secondAction: (() -> Void)?)
    func dismissActionControl()
    func sendEmail(recipientEmail: String, subject: String, body: String)
    func makeCall(toPhone phone: String)
    func startWhatpsappChat(withNumber number: String, errorCompletion: ((String) -> Void)?)
}
