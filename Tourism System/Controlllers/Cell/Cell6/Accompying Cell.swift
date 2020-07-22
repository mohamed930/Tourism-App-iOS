//
//  Accompying Cell.swift
//  Tourism_final
//
//  Created by Mohamed Ali on 7/19/20.
//  Copyright © 2020 mom. All rights reserved.
//

import UIKit

class Accompying_Cell: UITableViewCell {
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var ImageCover: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0))

    }
}
