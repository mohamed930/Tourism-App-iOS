//
//  PayPageViewController.swift
//  Test-Pay-Form
//
//  Created by Mohamed Ali on 8/1/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit

class PayPageViewController: UIViewController {
    @IBOutlet weak var card_no: UITextField!
    static var save_flag = false
    
    var paypage: PayView! {
        guard isViewLoaded else { return nil }
        return (view as! PayView)
    }
    
    var screenedge : UIScreenEdgePanGestureRecognizer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK:- TODO:- This Line for adding Geusters.
        screenedge = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(Back(_:)))
        screenedge.edges = .left
        view.addGestureRecognizer(screenedge)
     
        setDesign()
        
     
    }
    
    @IBAction func BTNVisa (_ sender:Any) {
        paypage.VisaButton.layer.borderColor = UIColor.yellow.cgColor
        paypage.VisaButton.layer.borderWidth = 5.0
        
        paypage.MasterCardButton.layer.borderColor = UIColor.clear.cgColor
        paypage.MasterCardButton.layer.borderWidth = 0.0
        
        paypage.ContainerView.isHidden = false
    }
    
    @IBAction func BTNMasterCard (_ sender:Any) {
        paypage.MasterCardButton.layer.borderColor = UIColor.yellow.cgColor
        paypage.MasterCardButton.layer.borderWidth = 5.0
        
        paypage.VisaButton.layer.borderColor = UIColor.clear.cgColor
        paypage.VisaButton.layer.borderWidth = 0.0
        
        paypage.ContainerView.isHidden = false
    }
    
    @IBAction func BTNSaveCheckMark (sender: UIButton) {
        print("Exsist!!")
        if sender.isSelected{
            sender.isSelected = false
            PayPageViewController.save_flag = false
        }
        else {
            sender.isSelected = true
            PayPageViewController.save_flag = true
        }
       // sender.setImage(UIImage(named: "Radio Button"),for: UIControl.State.selected)
    }
    
    @IBAction func BTNNext(_ sender:Any) {
        let textfieeld = view.viewWithTag(2) as! UITextField
        let card_no = textfieeld.text
        first_view.user_data["card_no"] = card_no
        let index = (card_no?.index(card_no!.endIndex, offsetBy: -4))!
        let mySubstring = card_no?.suffix(from: index)// playground
 
        
        
        let story : UIStoryboard = UIStoryboard(name: "Main3", bundle: nil)
        let next = story.instantiateViewController(withIdentifier: "SummaryPay") as! SummaryPayViewController
        next.text = mySubstring!.lowercased()
        next.modalPresentationStyle = .fullScreen
        self.present(next, animated: true, completion: nil)
    }
    
    @objc func Back(_ sender:UIScreenEdgePanGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setDesign () {
        
        makecornerCircle(View: paypage.outView1, borderColor: "#DDDDDD")
        makecornerCirclewithoutborder(View: paypage.inView1)
        
        paypage.lineView.layer.borderColor = UIColor().hexStringToUIColor(hex: "#DDDDDD").cgColor
        paypage.lineView.layer.borderWidth = 1.0
        
        makecornerCirclewithoutborder(View: paypage.inView2)
        makecornerCircle(View: paypage.outView2, borderColor: "#DDDDDD")
        
        paypage.MonthText.attributedPlaceholder = NSAttributedString(string: "MM", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        paypage.YearText.attributedPlaceholder = NSAttributedString(string: "YY", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        paypage.CCVText.attributedPlaceholder = NSAttributedString(string: "###", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        
        paypage.VisaButton.layer.cornerRadius = 10.0
        paypage.VisaButton.layer.masksToBounds = true
        paypage.MasterCardButton.layer.cornerRadius = 10.0
        paypage.MasterCardButton.layer.masksToBounds = true
        
       // paypage.BTNCheck.setImage(UIImage(named: "Circle_file.487"), for:.normal);
       // paypage.BTNCheck.setImage(UIImage(named: "Radio Button"), for:.selected);
    }
    
    func makecornerCircle (View:UIView , borderColor:String) {
        View.layer.cornerRadius = View.frame.size.width/2
        View.clipsToBounds = true

        View.layer.borderColor = UIColor().hexStringToUIColor(hex: "#DDDDDD").cgColor
        View.layer.borderWidth = 1.0
    }
    
    func makecornerCirclewithoutborder (View:UIView) {
        View.layer.cornerRadius = View.frame.size.width/2
        View.clipsToBounds = true

        View.layer.borderColor = UIColor.clear.cgColor
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension PayPageViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField.tag {
        case 1:
            paypage.line1.layer.backgroundColor = UIColor().hexStringToUIColor(hex: "#FA4248").cgColor
            paypage.line2.layer.backgroundColor = UIColor().hexStringToUIColor(hex: "#BDC4CC").cgColor
            paypage.line3.layer.backgroundColor = UIColor().hexStringToUIColor(hex: "#BDC4CC").cgColor
            paypage.line4.layer.backgroundColor = UIColor().hexStringToUIColor(hex: "#BDC4CC").cgColor
            paypage.line5.layer.backgroundColor = UIColor().hexStringToUIColor(hex: "#BDC4CC").cgColor
            break
        case 2:
            paypage.line1.layer.backgroundColor = UIColor().hexStringToUIColor(hex: "#BDC4CC").cgColor
            paypage.line2.layer.backgroundColor = UIColor().hexStringToUIColor(hex: "#FA4248").cgColor
            paypage.line3.layer.backgroundColor = UIColor().hexStringToUIColor(hex: "#BDC4CC").cgColor
            paypage.line4.layer.backgroundColor = UIColor().hexStringToUIColor(hex: "#BDC4CC").cgColor
            paypage.line5.layer.backgroundColor = UIColor().hexStringToUIColor(hex: "#BDC4CC").cgColor
            break
        case 3:
            paypage.line1.layer.backgroundColor = UIColor().hexStringToUIColor(hex: "#BDC4CC").cgColor
            paypage.line2.layer.backgroundColor = UIColor().hexStringToUIColor(hex: "#BDC4CC").cgColor
            paypage.line3.layer.backgroundColor = UIColor().hexStringToUIColor(hex: "#FA4248").cgColor
            paypage.line4.layer.backgroundColor = UIColor().hexStringToUIColor(hex: "#BDC4CC").cgColor
            paypage.line5.layer.backgroundColor = UIColor().hexStringToUIColor(hex: "#BDC4CC").cgColor
            break
        case 4:
            paypage.line1.layer.backgroundColor = UIColor().hexStringToUIColor(hex: "#BDC4CC").cgColor
            paypage.line2.layer.backgroundColor = UIColor().hexStringToUIColor(hex: "#BDC4CC").cgColor
            paypage.line3.layer.backgroundColor = UIColor().hexStringToUIColor(hex: "#BDC4CC").cgColor
            paypage.line4.layer.backgroundColor = UIColor().hexStringToUIColor(hex: "#FA4248").cgColor
            paypage.line5.layer.backgroundColor = UIColor().hexStringToUIColor(hex: "#BDC4CC").cgColor
            break
        case 5:
            paypage.line1.layer.backgroundColor = UIColor().hexStringToUIColor(hex: "#BDC4CC").cgColor
            paypage.line2.layer.backgroundColor = UIColor().hexStringToUIColor(hex: "#BDC4CC").cgColor
            paypage.line3.layer.backgroundColor = UIColor().hexStringToUIColor(hex: "#BDC4CC").cgColor
            paypage.line4.layer.backgroundColor = UIColor().hexStringToUIColor(hex: "#BDC4CC").cgColor
            paypage.line5.layer.backgroundColor = UIColor().hexStringToUIColor(hex: "#FA4248").cgColor
            break
        default:
            print("Error!")
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let count = textField.text?.count
         if textField.tag == 2 {
                   if count! > 14 {
                    textField.deleteBackward()
                       print("Done")
                   }/*else if (count! % 4 == 0) {
                    textField.insertText(" ")
                   }*/
                   else {
                    //   textField.isEditing = false
                       print("Please Enter Correct Number Card!")
                   }
               }
         else if (textField.tag == 3 || textField.tag == 4){
            
            if count! > 2 {
               textField.deleteBackward()
                  print("Done")
              }
              else {
               //   textField.isEditing = false
                  print("Please Enter Correct Number Card!")
              }
        }
         else if textField.tag == 5{
            if(count! > 3){
                textField.deleteBackward()
                print("Done")
            }
        }
        
        
    }
  /*  func textFieldDidEndEditing(_ textField: UITextField) {
       
    }*/
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case paypage.NameText:
            paypage.NumberCardText.becomeFirstResponder()
            break
        case paypage.CCVText:
            self.view.endEditing(true)
            break
        default:
            print("Error")
        }
        return true
    }
}
