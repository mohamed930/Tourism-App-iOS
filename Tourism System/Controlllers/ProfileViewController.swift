//
//  ProfileViewController.swift
//  Tourism System
//
//  Created by Mohamed Ali on 6/8/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController , UINavigationControllerDelegate {
    
    var profileview:ProfileView! {
        guard isViewLoaded else {return nil}
        return (view as! ProfileView)
    }
    
    var flag = 1
    var image1:UIImage!
    var image2:UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        SSNImageTouch()
        PassportImageTouch()
        profileview.AddressText.layer.cornerRadius = 26.0
        profileview.AddressText.text = "Enter Your Address"
        profileview.AddressText.textColor = UIColor.darkGray
        
        let tab = UITapGestureRecognizer(target: self, action: #selector(ScrollTouched))
        tab.numberOfTouchesRequired = 1
        profileview.Scroll.addGestureRecognizer(tab)
        profileview.Scroll.keyboardDismissMode = .interactive
        
    }
    
    // MARK:- TODO:- This Method for make tab geuster to SSNImage.
    func SSNImageTouch() {
        let g = UITapGestureRecognizer(target: self, action: #selector(imagetouchAction(tapGestureRecognizer:)))
        g.numberOfTapsRequired = 1
        g.numberOfTouchesRequired = 1
        profileview.SSNImage.isUserInteractionEnabled = true
        profileview.SSNImage.addGestureRecognizer(g)
    }
    
    // MARK:- TODO:- This Method for Pick image and put flage = 2.
    @objc func imagetouchAction(tapGestureRecognizer: UITapGestureRecognizer) {
        let image1 = UIImagePickerController()
                image1.delegate = self
                image1.sourceType = UIImagePickerController.SourceType.photoLibrary
                image1.allowsEditing = false
                self.present(image1,animated: false)
                {

                }
        flag = 2
    }
    
    // MARK:- TODO:- This Method for make tab geuster to Passport.
    func PassportImageTouch() {
        let g = UITapGestureRecognizer(target: self, action: #selector(image1touchAction(tapGestureRecognizer:)))
        g.numberOfTapsRequired = 1
        g.numberOfTouchesRequired = 1
        profileview.PassportImage.isUserInteractionEnabled = true
        profileview.PassportImage.addGestureRecognizer(g)
    }
    
    // MARK:- TODO:- This Method for Pick image and put flage = 3.
    @objc func image1touchAction(tapGestureRecognizer: UITapGestureRecognizer) {
        let image1 = UIImagePickerController()
                image1.delegate = self
                image1.sourceType = UIImagePickerController.SourceType.photoLibrary
                image1.allowsEditing = false
                self.present(image1,animated: false)
                {
                    
                }
        flag = 3
    }
    
    // MARK:- TODO:- This Method for dismiss keypad when touch scrollview.
    @objc func ScrollTouched() {
        profileview.Scroll.endEditing(true)
    }
    
    // MARK:- TODO:- This Method for end keypad.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}


extension ProfileViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            if flag == 2 {
                profileview.SSNImage.image = image
                image1 = image
            }
            else if flag == 3 {
                profileview.PassportImage.image = image
                image2 = image
            }
        }
        else
        {
            
        }
        self.dismiss(animated: true, completion: nil)
    }
}

extension ProfileViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.darkGray {
            profileview.AddressText.text = nil
            profileview.AddressText.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            profileview.AddressText.text = "Enter Your Address"
            profileview.AddressText.textColor = UIColor.darkGray
        }
    }
}

extension ProfileViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case profileview.NameText:
            profileview.TelehponeText.becomeFirstResponder()
            break
        case profileview.TelehponeText:
            profileview.AddressText.becomeFirstResponder()
            break
        default:
            print("Error!")
        }
        return true
    }
}


