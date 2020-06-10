//
//  CommonofferCell.swift
//  Tourism System
//
//  Created by Mohamed Ali on 6/9/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit

class CommonofferCell: UICollectionViewCell {
    
    @IBOutlet weak var TravelCover:UIImageView!
    @IBOutlet weak var TravelNameLabel:UILabel!
    @IBOutlet weak var ImageHight:NSLayoutConstraint!
    @IBOutlet weak var TitleHight:NSLayoutConstraint!
    @IBOutlet weak var ContainerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //TitleHight.constant = (ContainerView.frame.size.height * 0.2)
        
        TravelCover.layer.cornerRadius = 39.0
        TravelCover.layer.borderColor = UIColor.clear.cgColor
        TravelCover.layer.masksToBounds = true
        
        TravelNameLabel.layer.cornerRadius = 31.0
        TravelNameLabel.layer.masksToBounds = true
        TravelNameLabel.layer.borderColor = UIColor.lightGray.cgColor
        
    }

}
