//
//  BaseRouter.swift
//  TeacherOnDemand
//
//  Created by Peter Bassem on 21/03/2022.
//

import Foundation
import UIKit
import SafariServices

class BaseRouter: BaseRouterProtocol {
    
    weak var viewController: UIViewController?
    private var listCountriesViewController: UIViewController!
    private var actionController: UIAlertController!
    
    func showCountriesList() {
//        let listNavigationController = PhoneNumberTextField.createListCountriesNavigationController()
//        if let listViewController = listNavigationController.viewControllers.first {
//            self.listCountriesViewController = listViewController
//            listViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(dismissCountries(_:)))
//        }
//        viewController?.present(listNavigationController, animated: true, completion: nil)
    }
    
    @objc
    private func dismissCountries(_ sender: UIBarButtonItem) {
        listCountriesViewController.dismiss(animated: true, completion: nil)
    }
    
    func popupViewController(completion: VoidCompletion? = nil) {
//        viewController?.navigationController?.popViewController(animated: true)
        viewController?.navigationController?.popupViewController(completion: completion)
    }
    
    func popup(to viewController: AnyClass) {
        self.viewController?.navigationController?.popToViewController(ofClass: viewController)
    }
    
    func dismissViewController() {
        viewController?.dismiss(animated: true)
    }
    
    func presentImagePickerViewController(sourceView: AnyObject? = nil, completion: @escaping (UIImage, URL?) -> Void) {
//        guard let viewController = viewController else { return }
//        ImagePickerManager().pickImage(viewController, sourceView: sourceView, completion)
    }
    
    func presentDocumentPickerViewController(allowMultipleSelection: Bool, completion: @escaping ([URL]) -> Void) {
//        guard let viewController = viewController else { return }
//        DocumentPickerSelectionManager.pickDocuments(viewController, allowMultipleSelection: allowMultipleSelection, completion)
    }
    
    func openBrowser(fromUrl url: String) {
        guard let url = URL(string: url) else { return }
        let safariViewController = SFSafariViewController(url: url)
        viewController?.present(safariViewController, animated: true)
    }
    
    func openMailClient() {
        let mailURL = URL(string: "message://")!
        if UIApplication.shared.canOpenURL(mailURL) {
            UIApplication.shared.open(mailURL)
        }
    }
    
    func showSettingsAlert() {
//        viewController?.goToSettings(completion: nil)
    }
    
    func presentActionControl(title: String?, message: String?, firstActionTitle: String?, firstAction: (() -> Void)?, secondActionTitle: String?, secondAction: (() -> Void)?) {
        actionController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let firstAction = UIAlertAction(title: firstActionTitle, style: .destructive) { _ in
            firstAction?()
        }
        let secondAction = UIAlertAction(title: secondActionTitle, style: .default) { _ in
            secondAction?()
        }
        actionController.addAction(firstAction)
        actionController.addAction(secondAction)
        viewController?.present(actionController, animated: true)
    }
    
    func dismissActionControl() {
        actionController.dismiss(animated: true)
    }
    
    func sendEmail(recipientEmail: String, subject: String = "", body: String = "") {
//        if EmailManager.canSendEmail() {
//            viewController?.present(EmailManager.sendEmailUsingDefaultMailApp(recipientEmail: recipientEmail, subject: subject, body: body), animated: true)
//        } else if let emailURL = EmailManager.createEmailUrl(to: recipientEmail, subject: subject, body: body) {
//            application.open(emailURL)
//        }
    }
    
    func makeCall(toPhone phone: String) {
        guard let number = URL(string: "tel://" + phone) else { return }
        application.open(number)
    }
    
    func startWhatpsappChat(withNumber number: String, errorCompletion: ((String) -> Void)?) {
        let urlWhatsapp = "whatsapp://send?phone=+919789384445"
        if let urlString = urlWhatsapp.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) {
            if let whatsappURL = URL(string: urlString) {
                if application.canOpenURL(whatsappURL){
                    if #available(iOS 10.0, *) {
                        application.open(whatsappURL, options: [:], completionHandler: nil)
                    } else {
                        application.openURL(whatsappURL)
                    }
                }
                else {
                    errorCompletion?("whatsapp_not_installed".localized())
                }
            }
        }
    }
}
