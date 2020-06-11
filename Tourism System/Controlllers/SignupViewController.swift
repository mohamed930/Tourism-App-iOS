//
//  SignupViewController.swift
//  Tourism System
//
//  Created by Mohamed Ali on 6/7/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController , UINavigationControllerDelegate {
    
    // MARK:- TODO:- This Sektion is for initialize varible.
    var signupview: SignupView! {
        guard isViewLoaded else {return nil}
        return (view as! SignupView)
    }
    var flag = 1
    var image1:UIImage!
    var image2:UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK:- TODO:- This Sektion for Design launching
        // -----------------------------------------
        Tools.setMarqueeOption(MyLabel: signupview.MarqueeLabel)
        
        signupview.Scroll.keyboardDismissMode = .interactive
        //put this where you initialize your scroll view
        let theTap = UITapGestureRecognizer(target: self, action: #selector(scrollViewTapped))
        signupview.Scroll.addGestureRecognizer(theTap)
        // -----------------------------------------
    }
    
    // MARK:- TODO:- This Action Method For PickImageOne.
    @IBAction func BTNPickImage1(_ sender:Any) {

         let image1 = UIImagePickerController()
                image1.delegate = self
                image1.sourceType = UIImagePickerController.SourceType.photoLibrary
                image1.allowsEditing = false
                self.present(image1,animated: false)
                {
                    
                }
        flag = 2
    }
    
    // MARK:- TODO:- This Action Method For PickImageTwo.
    @IBAction func BTNPickImage2(_ sender:Any){
        
        let image2 = UIImagePickerController()
            image2.delegate = self
            image2.sourceType = UIImagePickerController.SourceType.photoLibrary
            image2.allowsEditing = false
            self.present(image2,animated: false)
            {
                
            }
        flag = 3
        
    }
    
    // MARK:- TODO:- This Action Method For Button Back.
    @IBAction func BTNBack (_ sender:Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK:- TODO:- This Action Method For Save Button.
    @IBAction func BTNSave (_ sender:Any) {
        SaveData()
    }
    
    func SaveData () {
        
        if signupview.NameText.text == "" || signupview.EmailText.text == "" || signupview.TelephoneText.text == "" || signupview.Password.text == "" || signupview.ConfirmPassword.text == "" || signupview.Image1.image == UIImage(named: "load_image") || self.image1 == nil || self.image2 == nil {
            Tools.createAlert(Title: "Error", Mess: "Please, Fill All Fiedls", ob: self)
        }
        else {
            if signupview.Password.text != signupview.ConfirmPassword.text {
                
                Tools.createAlert(Title: "Error", Mess: "You must confirm Password!", ob: self)
                signupview.Password.text = ""
                signupview.ConfirmPassword.text = ""
                signupview.Password.becomeFirstResponder()
                
            }
            else {
                
                // Add Data To DataBase.
                let ssnUrl = FireBase.uploadImage(LinkImage: "gs://tourist-company.appspot.com/UsersImages", Image: image1 , Name: signupview.EmailText.text!)
                let PassportUrl = FireBase.uploadImage(LinkImage: "gs://tourist-company.appspot.com/UsersImages", Image: image2 , Name: signupview.EmailText.text!)
                
                let UserData = [
                                  "Name":signupview.NameText.text!,
                                  "Email":signupview.EmailText.text!,
                                  "Telephone":signupview.TelephoneText.text!,
                                  "Address":"nil",
                                  "ssnUrl":ssnUrl,
                                  "PassportUrl":PassportUrl
                               ]
                FireBase.createAccount(Email: signupview.EmailText.text!, Password: signupview.Password.text!, collectionName: "Users", data: UserData)
                
            }
        }
    }
    
    @objc func scrollViewTapped(recognizer: UIGestureRecognizer) {
        signupview.Scroll.endEditing(true)
    }
    // MARK:- TODO:- This method for dismissing keypad when touch on screen view.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension SignupViewController:UITextFieldDelegate {
    
    //TODO: Declare textFieldDidEndEditing here:
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        UIView.animate(withDuration: 0.5) {
            self.signupview.ViewButtom.constant = 34
            self.view.layoutIfNeeded()
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
           
           UIView.animate(withDuration: 0.5) {
               self.signupview.ViewButtom.constant = 200
               self.view.layoutIfNeeded()
           }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case signupview.NameText:
            signupview.EmailText.becomeFirstResponder()
            break
        case signupview.EmailText:
            signupview.TelephoneText.becomeFirstResponder()
            break
        case signupview.TelephoneText:
            signupview.Password.becomeFirstResponder()
            break
        case signupview.Password:
            signupview.ConfirmPassword.becomeFirstResponder()
            break
        default:
            self.view.endEditing(true)
            break
        }
        return true
    }
}

extension SignupViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            if flag == 2 {
                signupview.Image1.image = image
                image1 = image
            }
            else if flag == 3 {
                signupview.Image2.image = image
                image2 = image
            }
        }
        else
        {
            
        }
        self.dismiss(animated: true, completion: nil)
    }
}

