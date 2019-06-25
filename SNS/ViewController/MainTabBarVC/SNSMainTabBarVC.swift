//
//  SNSMainTabBarVC.swift
//  SNS
//
//  Created by Ahmed Durrani on 23/04/2019.
//  Copyright © 2019 CyberHost. All rights reserved.
//

import UIKit

class SNSMainTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let selectedColor   = UIColor.white
        let unselectedColor = UIColor.clear
        let appearance = UITabBarItem.appearance()
        let attributes = [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 14)]

        appearance.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: unselectedColor], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
        
        self.tabBar.items![0].selectedImage = UIImage(named:"homeS")!.withRenderingMode(.alwaysOriginal)
        (self.tabBar.items![0] ).image = UIImage(named:"homeS")!.withRenderingMode(.alwaysOriginal)
        
        
        self.tabBar.items![1].selectedImage = UIImage(named:"about")!.withRenderingMode(.alwaysOriginal)
        (self.tabBar.items![1] ).image = UIImage(named:"about")!.withRenderingMode(.alwaysOriginal)
        
        self.tabBar.items![2].selectedImage = UIImage(named:"login")!.withRenderingMode(.alwaysOriginal)
        (self.tabBar.items![2] ).image = UIImage(named:"login")!.withRenderingMode(.alwaysOriginal)
        
        self.tabBar.items![3].selectedImage = UIImage(named:"email")!.withRenderingMode(.alwaysOriginal)
        (self.tabBar.items![3] ).image = UIImage(named:"email")!.withRenderingMode(.alwaysOriginal)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
