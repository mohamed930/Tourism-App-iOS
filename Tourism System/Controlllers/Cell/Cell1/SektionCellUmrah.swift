//
//  SektionCellUmrah.swift
//  Tourism System
//
//  Created by Mohamed Ali on 6/8/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit
import Gemini

class SektionCellUmrah: GeminiCell {
    
    @IBOutlet weak var travelCover:UIImageView!
    @IBOutlet weak var travelTitleLabel:UILabel!
    @IBOutlet weak var ImageHight: NSLayoutConstraint!
    @IBOutlet weak var ContainerView: UIView!
    @IBOutlet weak var LabelHight:NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        ImageHight.constant = (ContainerView.frame.size.height * 0.8)
        LabelHight.constant = (ContainerView.frame.size.height * 0.2)
        
        self.travelTitleLabel.layer.cornerRadius = 30.0
        self.travelTitleLabel.layer.borderColor = UIColor.clear.cgColor
        self.travelTitleLabel.layer.masksToBounds = true
    }

}
