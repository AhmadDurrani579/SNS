//
//  HomeScreenFooterCell.swift
//  SNS
//
//  Created by Ahmed Durrani on 24/04/2019.
//  Copyright © 2019 CyberHost. All rights reserved.
//

import UIKit

protocol InfoOpenDelegate {
    func checkInfo(cell : HomeScreenFooterCell , index : IndexPath)
}
class HomeScreenFooterCell: UITableViewCell {
    @IBOutlet weak var imgOfCell: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!

    @IBOutlet weak var btnLinkClickble: UIButton!
    var delegate : InfoOpenDelegate?
    var selectIndex : IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnClickLink_Pressed(_ sender: UIButton) {
        
        self.delegate?.checkInfo(cell: self, index: selectIndex!)
        
    }
}
