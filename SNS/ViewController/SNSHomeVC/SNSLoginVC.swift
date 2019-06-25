//
//  SNSLoginVC.swift
//  SNS
//
//  Created by Ahmed Durrani on 24/04/2019.
//  Copyright © 2019 CyberHost. All rights reserved.
//

import UIKit

class SNSLoginVC: UIViewController {
    
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPassword: UITextField!
    var presenter: RegistrationPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtEmail.setLeftPaddingPoints(10)
        txtPassword.setLeftPaddingPoints(10)
//                txtEmail.text = "123123"
//                txtPassword.text = "123456"
        presenter = RegistrationPresenter(delegate: self)

    }
    
    @IBAction func btnLogin_Pressed(_ sender: UIButton) {
        self.presenter?.signIn(email: txtEmail.text!, password: txtPassword.text!)
        
    }

    

}

extension SNSLoginVC : RegistrationDelegate {
    
    func showProgress(){
        
    }
    func hideProgress(){
        
    }
    func registrationDidSucceed() {
        
        let loginParam =      [ Klogin_id         : txtEmail.text!,
                                kPassword         : txtPassword.text! ,
                              ] as [String : Any]
        WebServiceManager.post(params:loginParam as Dictionary<String, AnyObject> , serviceName: LOGIN, isLoaderShow: true, serviceType: "Login", modelType: UserResponse.self, success: { [weak self] (response) in
            let responseObj = response as! UserResponse
            if responseObj.success == true {
                let vc = self?.storyboard?.instantiateViewController(withIdentifier: "ManullyEntryVC") as? ManullyEntryVC
                vc?.userInfo = responseObj.data
//                self?.navigationController?.pushViewController(vc!, animated: true)
                self?.present(vc!, animated: true, completion: {
                    
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

extension UITextView {
    
    private class PlaceholderLabel: UILabel { }
    
    private var placeholderLabel: PlaceholderLabel {
        if let label = subviews.compactMap( { $0 as? PlaceholderLabel }).first {
            return label
        } else {
            let label = PlaceholderLabel(frame: .zero)
            label.font = font
            addSubview(label)
            return label
        }
    }
    
    @IBInspectable
    var placeholder: String {
        get {
            return subviews.compactMap( { $0 as? PlaceholderLabel }).first?.text ?? ""
        }
        set {
            let placeholderLabel = self.placeholderLabel
            placeholderLabel.text = newValue
            placeholderLabel.numberOfLines = 0
            let width = frame.width - textContainer.lineFragmentPadding * 2
            let size = placeholderLabel.sizeThatFits(CGSize(width: width, height: .greatestFiniteMagnitude))
            placeholderLabel.frame.size.height = size.height
            placeholderLabel.frame.size.width = width
            placeholderLabel.frame.origin = CGPoint(x: textContainer.lineFragmentPadding, y: textContainerInset.top)
            
            textStorage.delegate = self
        }
    }
    
}

extension UITextView: NSTextStorageDelegate {
    
    public func textStorage(_ textStorage: NSTextStorage, didProcessEditing editedMask: NSTextStorage.EditActions, range editedRange: NSRange, changeInLength delta: Int) {
        if editedMask.contains(.editedCharacters) {
            placeholderLabel.isHidden = !text.isEmpty
        }
    }
    
}
