//
//  Tools.swift
//  Tourism System
//
//  Created by Mohamed Ali on 6/7/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit
import MarqueeLabel

class Tools {
    
    public static func SetLeftPadding(textBox:UITextField , padding:Double) {
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: padding, height: 2.0))
        textBox.leftView = leftView
        textBox.leftViewMode = .always
    }
    
    public static func setMarqueeOption(MyLabel:MarqueeLabel){
        MyLabel.type = .continuous
        MyLabel.animationCurve = .easeInOut
        MyLabel.speed = .duration(5)
        MyLabel.leadingBuffer = 30.0
        MyLabel.trailingBuffer = 20.0
        MyLabel.restartLabel()
    }
}
