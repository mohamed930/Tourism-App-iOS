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
        let f = FireBase()
        f.MakeLogin(Email: loginview.EmailText.text!, Password: loginview.PasswordText.text!) { (flag) in
            if flag == "Success" {
                self.performSegue(withIdentifier: "GoToHome", sender: self)
            }
            else {
                self.loginview.PasswordText.text = ""
            }
        }
    }
    


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        loginview.line1.backgroundColor = UIColor().hexStringToUIColor(hex: "#FFFFFF")
        loginview.line2.backgroundColor = UIColor().hexStringToUIColor(hex: "#FFFFFF")
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 1 {
            loginview.line1.backgroundColor = UIColor().hexStringToUIColor(hex: "#03DAC5")
            loginview.line2.backgroundColor = UIColor().hexStringToUIColor(hex: "#FFFFFF")
        }
        else {
            loginview.line2.backgroundColor = UIColor().hexStringToUIColor(hex: "#03DAC5")
            loginview.line1.backgroundColor = UIColor().hexStringToUIColor(hex: "#FFFFFF")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginview.EmailText{
            loginview.PasswordText.becomeFirstResponder()
        }
        else {
            // Make Login Operation.
            self.view.endEditing(true)
            let f = FireBase()
            f.MakeLogin(Email: loginview.EmailText.text!, Password: loginview.PasswordText.text!) { (flag) in
                if flag == "Success" {
                    self.performSegue(withIdentifier: "GoToHome", sender: self)
                }
                else {
                    self.loginview.PasswordText.text = ""
                }
            }
        }
        return true
    }
    
}

