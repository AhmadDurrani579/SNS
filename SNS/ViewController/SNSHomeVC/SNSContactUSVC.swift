//
//  SNSContactUSVC.swift
//  SNS
//
//  Created by Ahmed Durrani on 24/04/2019.
//  Copyright © 2019 CyberHost. All rights reserved.
//

import UIKit
import MessageUI

class SNSContactUSVC: UIViewController {
    
    @IBOutlet weak var txtName      : UITextField!
    @IBOutlet weak var txtPhoneNum  : UITextField!
    @IBOutlet weak var txtEmail     : UITextField!
    @IBOutlet weak var txtMessage   : UITextView!
    
    var presenter: RegistrationPresenter?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtName.setLeftPaddingPoints(10)
        txtPhoneNum.setLeftPaddingPoints(10)
        txtEmail.setLeftPaddingPoints(10)
        presenter = RegistrationPresenter(delegate: self)
        WAShareHelper.setBorderAndCornerRadius(layer: txtName.layer, width: 1.0, radius: 1.0, color: UIColor.white)
        WAShareHelper.setBorderAndCornerRadius(layer: txtPhoneNum.layer, width: 1.0, radius: 1.0, color: UIColor.white)
        WAShareHelper.setBorderAndCornerRadius(layer: txtEmail.layer, width: 1.0, radius: 1.0, color: UIColor.white)
        WAShareHelper.setBorderAndCornerRadius(layer: txtMessage.layer, width: 1.0, radius: 1.0, color: UIColor.white)
        txtMessage.placeholder = "Enter your message"

        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        txtMessage.text = ""
        txtEmail.text  = ""
        txtPhoneNum.text = ""
        txtName.text = ""
        
    }
   
    @IBAction func btnSubmit_Pressed(_ sender: UIButton) {
        self.presenter?.registerValidation(fullName: txtName.text!, phone: txtPhoneNum.text!, email: txtEmail.text!, message: txtMessage.text!)
        

    }
    
}

extension SNSContactUSVC : RegistrationDelegate {
    
    func showProgress(){
        
    }
    func hideProgress(){
        
    }
    func registrationDidSucceed() {
        
        let loginParam =      [ "name"         : txtName.text!,
                                "email"         : txtEmail.text! ,
                                "phone_no"         : txtPhoneNum.text! ,
                                "message"         : txtMessage.text!
                              ] as [String : Any]
        WebServiceManager.post(params:loginParam as Dictionary<String, AnyObject> , serviceName: CONTACT_US, isLoaderShow: true, serviceType: "Login", modelType: UserResponse.self, success: { [weak self] (response) in
            let responseObj = response as! UserResponse
            if responseObj.success == true {
                self?.showAlertViewWithTitle(title: KMessageTitle, message: responseObj.message!, dismissCompletion: {
                    if MFMailComposeViewController.canSendMail() {
                        let name = responseObj.userProfileInfo?.name!
                        let email = responseObj.userProfileInfo?.email!
                        let phoneNo = responseObj.userProfileInfo?.phone_no!
                        let message = responseObj.userProfileInfo?.message!

                        let messageBody = "Name : \(name!)\n" +  " Email :\(email!)\n" +  "Phone Num :\(phoneNo!)\n" + "Message : \(message!) "
                        let mail = MFMailComposeViewController()
                        mail.mailComposeDelegate = self
                        mail.setSubject("Students Network Services")
                        
                        mail.setToRecipients(["hostel@psb-academy.edu.sg" , "general@snsemail.com"])
                        mail.setMessageBody(messageBody, isHTML: false)
                        self!.present(mail, animated: true)
                    } else {
                        print("Hello")
                        // show failure alert
                    }

                })
            }
            else {
                self!.showAlert(title: KMessageTitle , message: responseObj.message!, controller: self)
            }
            }, fail: { (error) in
                
        }, showHUD: true)
        
    }
    
    func registrationDidFailed(message: String){
        self.showAlert(title: KMessageTitle , message: message, controller: self)
    }
}
