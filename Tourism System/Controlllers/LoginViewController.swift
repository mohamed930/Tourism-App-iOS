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
        
        checkforUserDefaultpreference()
    }
    
    // MARK:- TODO:- This Action For Making Login Method.
    @IBAction func BTNLogin(_ sender:Any) {
        let f = FireBase()
        f.MakeLogin(Email: loginview.EmailText.text!, Password: loginview.PasswordText.text!) { (flag) in
            if flag == "Success" {
                UserDefaults.standard.set(self.loginview.EmailText.text, forKey: "Email")
                UserDefaults.standard.set(self.loginview.PasswordText.text, forKey: "Password")
                self.performSegue(withIdentifier: "GoToHome", sender: self)
            }
            else {
                self.loginview.PasswordText.text = ""
            }
        }
    }
    

    func checkforUserDefaultpreference () {
//        if let value = UserDefaults.value(forKey: "Email") as? String, let value2 = UserDefaults.value(forKey: "Password") as? String {
//            loginview.EmailText.text = value
//            loginview.PasswordText.text = value2
//        }
        
        let value  = UserDefaults.standard.object(forKey: "Email")
        let value2 = UserDefaults.standard.object(forKey: "Password")
        
        if value != nil && value2 != nil {
            loginview.EmailText.text = value as? String
            loginview.PasswordText.text = value2 as? String
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

