//
//  TravelCell.swift
//  Tourism System
//
//  Created by Mohamed Ali on 6/9/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit
import Gemini

class TravelCell: GeminiCell {
    
    @IBOutlet weak var TravelCover:UIImageView!
    @IBOutlet weak var TravelNameLabel:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        TravelNameLabel.layer.cornerRadius = 31.0
        TravelNameLabel.layer.masksToBounds = true
        TravelNameLabel.layer.borderColor = UIColor.lightGray.cgColor
    }

}
