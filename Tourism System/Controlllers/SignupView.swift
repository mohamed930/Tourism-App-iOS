//
//  SignupView.swift
//  Tourism System
//
//  Created by Mohamed Ali on 6/7/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit
import MarqueeLabel

class SignupView: UIView {
    @IBOutlet weak var MarqueeLabel:MarqueeLabel!
    @IBOutlet weak var Image1:UIImageView!
    @IBOutlet weak var Image2:UIImageView!
    @IBOutlet weak var NameText:UITextField!
    @IBOutlet weak var EmailText:UITextField!
    @IBOutlet weak var TelephoneText:UITextField!
    @IBOutlet weak var Password:UITextField!
    @IBOutlet weak var ConfirmPassword:UITextField!
    @IBOutlet weak var Scroll:UIScrollView!
    @IBOutlet weak var ScrollButtom: NSLayoutConstraint!
    @IBOutlet weak var ViewButtom: NSLayoutConstraint!
}
