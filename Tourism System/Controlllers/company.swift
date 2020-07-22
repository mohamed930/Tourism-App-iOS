//
//  company.swift
//  Tourism_final
//
//  Created by mom on 3/22/20.
//  Copyright © 2020 mom. All rights reserved.
//

import UIKit

class company: UIViewController {
    
  //  static var registered:[Int] = []
    var new_reg:[Int] = []
    static var Big_company:[NSDictionary] = []
    var green:UIColor?
    var comapny_names:[String] = []
    var flag = false
    var image_flag = false
    

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var SSN: UITextField!
    @IBOutlet weak var finish: UIButton!
    @IBOutlet weak var add_company: UIButton!
   // @IBOutlet weak var SSN: UILabel!
   // @IBOutlet weak var name: UILabel!
    @IBOutlet weak var my_passport: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // self.SSN.keyboardType = .numberPad
      //  self.name.layer.cornerRadius = 20
      //  print(self.my_passport.image!)
        self.add_company.layer.cornerRadius = 20
        self.finish.layer.cornerRadius = 20
        for i in 1...41{
            let label = self.view.viewWithTag(i) as? UILabel
            green = UIColor.init(red: 0.269042, green: 1, blue: 0.624691, alpha: 1)
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.labler))
            label?.backgroundColor = green
            
            label?.addGestureRecognizer(tap)
        }
        for y in Seat_reg.registered{
            let label = self.view.viewWithTag(y) as? UILabel
            label?.backgroundColor = UIColor.purple
        }
        
        
        

        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tap_me_once))
        
        self.my_passport.addGestureRecognizer(tap)
        
        /*for i in 40...41{
            let label = self.view.viewWithTag(i) as! UILabel
            
         //   let tap_2 = UITapGestureRecognizer(target: self, action: #selector(self.tap_me_twice))
            
         //   label.addGestureRecognizer(tap_2)
            
            
        }*/
       
    }
    
    @objc func tap_me_once(){
        print("here")
        image_picker()
    }
    
    /*@objc func tap_me_twice( sender:UITapGestureRecognizer){
        let my_label = sender.view as! UILabel
        print("shame on you")
        let alert = UIAlertController(title: "Enter Data", message: nil, preferredStyle: .alert)
        alert.addTextField { (field) in
            print("i am here in field")
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
            my_label.text = alert.textFields![0].text
           
        }))
        present(alert,animated: true)
        
    }*/
    
    @objc func labler(sender:UITapGestureRecognizer){
        
        let my_label = sender.view as? UILabel
        //let green = UIColor.init(red: 0.269042, green: 1, blue: 0.624691, alpha: 1)
        //  print("the tag is \(my_label?.backgroundColor) and the color is \(green)")
        if(!flag){
        if(my_label?.backgroundColor == green){
            my_label?.backgroundColor = UIColor.red
            flag = true
            new_reg.append((my_label?.tag)!)
            
            print(new_reg)
        }else{
            print("not equal")
        }
        }
        
    }
    
    // MARK:- TODO:- This List is full Big_Arr.
    @IBAction func company_list(_ sender: Any) {
        let last = self.storyboard?.instantiateViewController(withIdentifier: "last") as! last_page
       // last.big_arr = Big_company
        present(last , animated: true)
    }
    
    @IBAction func addcompany(_ sender: Any) {
        //print(self.my_passport.getsiz)
        if((self.name.text?.isEmpty)! || (self.SSN.text?.isEmpty)! || flag == false || image_flag == false){
            print("not complelete")
            let alert = UIAlertController(title: "missing data", message: "Please Fill The Missing Data", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "return", style: .default, handler: nil))
          
            
            self.present(alert, animated: true)
        }
        else{
            let company2: NSDictionary =  [
                
                "name" : self.name.text!,
                "ssn" : self.SSN.text!,
                "registered" : self.new_reg,
                "passport" : self.my_passport.image!
                
            ]
            
            
            //   print(company)
            //company.Big_company.append(company)
            company.Big_company.append(company2)
            self.new_reg.removeAll()
        }
       
     //   print("the new reg is " , self.new_reg)
    }
    
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension company:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func image_picker(){
        let image_picker23 = UIImagePickerController()
        image_picker23.allowsEditing = true
        image_picker23.delegate = self
        image_picker23.sourceType = .photoLibrary
        present(image_picker23,animated: true)
        
        print("ay7aga")
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selected_image = info[UIImagePickerController.InfoKey .editedImage] as? UIImage{
            self.my_passport.image = selected_image
            print("image is set")
            image_flag = true
        }else{
            let orinigal_image = info[UIImagePickerController.InfoKey .originalImage] as? UIImage
            self.my_passport.image = orinigal_image
            print("image is set")
            image_flag = true
        }
        dismiss(animated: true, completion: nil)
    }
}


extension company : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == name {
            SSN.becomeFirstResponder()
        }
        else {
            self.view.endEditing(true)
        }
        return true
    }
}
