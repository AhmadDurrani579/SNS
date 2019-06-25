//
//  SNSHomeVC.swift
//  SNS
//
//  Created by Ahmed Durrani on 24/04/2019.
//  Copyright © 2019 CyberHost. All rights reserved.
//

import UIKit

class SNSHomeVC: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    let arrayOfTitle = ["Eyecon optical" , "IHR" , "IFEM" , "IMC medical group"]
    let arrayOfDetail = ["Optical services" , "Employment agency" , "Fitness equipment and management company" , "Integrated dental and medical centre"]
    let arrayOfLink = ["https://www.eyeconoptical.com" , "http://ihrsvc.com/" , "https://www.ifem.com.sg/" , "http://imcmedicalgroup.com/"]
    let imgeName = ["eyecon.jpeg" , "logo_ihr.png" , "ifem.jpg" , "Another.jpeg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.register(UINib(nibName: "HomeScreenHeader", bundle: nil), forCellReuseIdentifier: "HomeScreenHeader")
        tblView.register(UINib(nibName: "HomeScreenFooterCell", bundle: nil), forCellReuseIdentifier: "HomeScreenFooterCell")

        tblView.delegate = self
        tblView.dataSource = self
        tblView.estimatedRowHeight = 150.0
        tblView.rowHeight = UITableView.automaticDimension
        tblView.reloadData()
        // Do any additional setup after loading the view.
    }
    

    
}

extension SNSHomeVC : UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if section == 0 {
            return 1
        } else {
            return arrayOfLink.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeScreenHeader", for: indexPath) as? HomeScreenHeader
            return cell!
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeScreenFooterCell", for: indexPath) as? HomeScreenFooterCell
            cell?.lblTitle.text = arrayOfTitle[indexPath.row]
            cell?.lblSubtitle.text = arrayOfDetail[indexPath.row]
            let clickLink = arrayOfLink[indexPath.row]
            cell?.btnLinkClickble.setTitle(clickLink, for: .normal)
            cell?.delegate = self
            cell?.selectIndex = indexPath
            if indexPath.row == 3 {
                cell?.imgOfCell.contentMode = .scaleAspectFit
            }
            let imgName = imgeName[indexPath.row]
            cell?.imgOfCell.image = UIImage(named: imgName)
            
            print(imgName)
            
            return cell!
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 185.0
        }
        else {
            return 125.0
        }
//            if indexPath.row == 0 {
//                return 170.0
//            } else if indexPath.row == 1 {
//                return 150.0
//            }
//            else {
//                return 270.0
//            }
//
//        }
        
        
    }
   
}
extension SNSHomeVC  : InfoOpenDelegate {
    func checkInfo(cell : HomeScreenFooterCell , index : IndexPath) {
        
        let websiteLink = self.arrayOfLink[index.row]
        if let url = URL(string: websiteLink) {
            UIApplication.shared.open(url)
        }
        
    }

}

extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
}

