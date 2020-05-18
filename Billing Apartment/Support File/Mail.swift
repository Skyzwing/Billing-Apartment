//
//  Mail.swift
//  Billing Apartment
//
//  Created by Surachat Yaitammasan on 27/4/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import Foundation
import SwiftUI
import MessageUI

// MARK: The mail part
//class SendMail: NSObject, MFMailComposeViewControllerDelegate {
//
//    func mailComposeController(_ controller: MFMailComposeViewController,
//                               didFinishWith result: MFMailComposeResult,
//                               error: Error?) {
//        // Customize here
//        controller.dismiss(animated: true)
//    }
//
//    /// Present an mail compose view controller modally in UIKit environment
//    func presentMailCompose() {
//
//        guard MFMailComposeViewController.canSendMail() else {
//            return
//        }
//        let vc = UIApplication.shared.keyWindow?.rootViewController
//
//        let composeVC = MFMailComposeViewController()
//        composeVC.setToRecipients(["surachet.y.edu@gmail.com"])
//        composeVC.setSubject("Report problem app: Billing Apartment")
//        composeVC.setMessageBody("Please tell me about detail problem in here. If you're insert image problem we will repair problem is fast", isHTML: false)
//        composeVC.mailComposeDelegate = self
//
//        // Customize here
//
//        vc?.present(composeVC, animated: true)
//    }
//
//}
struct MailView: UIViewControllerRepresentable {

    @Binding var isShowing: Bool
    @Binding var result: Result<MFMailComposeResult, Error>?

    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {

        @Binding var isShowing: Bool
        @Binding var result: Result<MFMailComposeResult, Error>?

        init(isShowing: Binding<Bool>,
             result: Binding<Result<MFMailComposeResult, Error>?>) {
            _isShowing = isShowing
            _result = result
        }

        func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
            defer {
                isShowing = false
            }
            guard error == nil else {
                self.result = .failure(error!)
                return
            }
            self.result = .success(result)
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(isShowing: $isShowing,
                           result: $result)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = context.coordinator
        return vc
    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                context: UIViewControllerRepresentableContext<MailView>) {

    }
}
