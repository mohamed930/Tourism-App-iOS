//
//  ViewController.swift
//  Tourism System
//
//  Created by Mohamed Ali on 6/7/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit
import MarqueeLabel

class LoginViewController: UIViewController {
    
    var loginview: LoginView! {
        guard isViewLoaded else {
            return nil
        }
        return (view as! LoginView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Tools.SetLeftPadding(textBox: loginview.EmailText , padding: 90.0)
        Tools.SetLeftPadding(textBox: loginview.PasswordText , padding: 90.0)
        Tools.setMarqueeOption(MyLabel: loginview.MarqueeLabel)
    }
    
    // MARK:- TODO:- This Action For Making Login Method.
    @IBAction func BTNLogin(_ sender:Any) {
        self.performSegue(withIdentifier: "GoToHome", sender: self)
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginview.EmailText{
            loginview.PasswordText.becomeFirstResponder()
        }
        else {
            // Make Login Operation.
        }
        return true
    }
    
}

