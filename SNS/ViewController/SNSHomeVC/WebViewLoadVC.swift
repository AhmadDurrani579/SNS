//
//  WebViewLoadVC.swift
//  SNS
//
//  Created by Ahmed Durrani on 23/05/2019.
//  Copyright © 2019 CyberHost. All rights reserved.
//

import UIKit

protocol webViewLoadDelegate  {
    func isWebViewLoad()
}

class WebViewLoadVC: UIViewController  , UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var delegate : webViewLoadDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        
        if let url = URL(string: "https://form.jotform.me/psbeforms/hostelreg_phoneapp") {
            let request = URLRequest(url: url)
            webView.loadRequest(request)
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnBack_Pressed(_ sender : UIButton) {
        self.dismiss(animated: true) {
            self.delegate?.isWebViewLoad()
        }
    }

    func webViewDidStartLoad(_ webView: UIWebView) {
        //        SVProgressHUD.show()
         activityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
         activityIndicator.stopAnimating()
        
    }
    //
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
          activityIndicator.stopAnimating()
    }


}
