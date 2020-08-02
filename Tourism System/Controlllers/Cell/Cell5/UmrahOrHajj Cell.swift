//
//  UmrahOrHajj Cell.swift
//  Tourism_final
//
//  Created by Mohamed Ali on 7/20/20.
//  Copyright © 2020 mom. All rights reserved.
//

import UIKit

class UmrahOrHajj_Cell: UITableViewCell {
    
    @IBOutlet weak var CoverImage:UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.layer.backgroundColor = UIColor.clear.cgColor
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0))

    }
    
}
