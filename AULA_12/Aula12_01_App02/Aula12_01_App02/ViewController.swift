//
//  ViewController.swift
//  Aula12_01_App02
//
//  Created by SP11793 on 22/03/22.
//

import UIKit
import MessageUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "App 2"
        view.backgroundColor = .lightGray
    }
    
    @IBAction func getMaps() {
        let customUrl = "maps://"
        
        if let url = URL(string: customUrl) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }
    
    @IBAction func getPhoneNumber() {
        let scheme = "sms://+55(11)947245874"
        
        if let url = URL(string: scheme) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }
    
    @IBAction func getEmail() {
        
        let recipientEmail = "lgkokumai.dev@gmail.com"
        let subject = "Email Subject"
        let body = "Email Body"
        
        if MFMailComposeViewController.canSendMail() {
            
            let mail = MFMailComposeViewController()
            
            mail.mailComposeDelegate = self
            mail.setCcRecipients([recipientEmail])
            mail.setSubject(subject)
            mail.setMessageBody(body, isHTML: false)
            
            present(mail, animated: true)
        }
        
    }


}

extension ViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        switch result {
            
        case .cancelled:
            print("Canceled")
        case .saved:
            print("Saved")
        case .sent:
            print("Sent")
        case .failed:
            print("Failed")
        @unknown default:
            print("Defaul")
        }
    }
}
