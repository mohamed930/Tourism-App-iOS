//
//  company.swift
//  Tourism_final
//
//  Created by mom on 3/22/20.
//  Copyright © 2020 mom. All rights reserved.
//

import UIKit
import RappleProgressHUD

class company: UIViewController {
    
  //  static var registered:[Int] = []
    var new_reg:Int = 0
    
    static var Big_company:[NSDictionary] = []
    static var big_images4: [UIImage] = []
    var green:UIColor?
    var comapny_names:[String] = []
    var flag = false
    var image_flag = false
    var screenedge : UIScreenEdgePanGestureRecognizer!
    

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var SSN: UITextField!
    @IBOutlet weak var finish: UIButton!
    @IBOutlet weak var add_company: UIButton!
   // @IBOutlet weak var SSN: UILabel!
   // @IBOutlet weak var name: UILabel!
    @IBOutlet weak var my_passport: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.add_company.layer.cornerRadius = 20
        self.finish.layer.cornerRadius = 20
        

        // MARK:- TODO:- This Line for adding Geusters.
        screenedge = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(Back(_:)))
        screenedge.edges = .left
        view.addGestureRecognizer(screenedge)
        
        

        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tap_me_once))
        
        self.my_passport.addGestureRecognizer(tap)
        
        
        
       
               
           
           
    
       
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
         print("mody \(Seat_reg.registered)")
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
        if(Seat_reg.flag){
        let label = self.view.viewWithTag(first_view.user_data["Seat_no"] as! Int) as? UILabel
        label?.backgroundColor = UIColor.purple
        }
        
    }
    
    @objc func tap_me_once(){
        print("here")
        image_picker()
    }
    
  
    
    @objc func labler(sender:UITapGestureRecognizer){
        print("ssda is \(flag)")
        let my_label = sender.view as? UILabel
      
        if(!flag){
        if(my_label?.backgroundColor == green){
            my_label?.backgroundColor = UIColor.red
            flag = true
            new_reg = ((my_label?.tag)!)
            
            print(new_reg)
        }
        }else{
           my_label?.backgroundColor = UIColor.red
           let label_not = view.viewWithTag(new_reg)
           
           label_not?.backgroundColor = green
            new_reg = ((my_label?.tag)!)
           print("not equal")
        }
        
        
    }
    
    // MARK:- TODO:- This List is full Big_Arr.
    @IBAction func company_list(_ sender: Any) {
        let last = self.storyboard?.instantiateViewController(withIdentifier: "last") as! last_page
       // last.big_arr = Big_company
        last.modalPresentationStyle = .fullScreen
        flag = false
        present(last , animated: true)
    }
    
    
    func reset(){
        self.new_reg = 0
        self.name.text = ""
        self.SSN.text = ""
        flag = false
        image_flag = false
        self.my_passport.image = UIImage(named: "ay7aga.jpg")
    }
    @IBAction func addcompany(_ sender: Any) {
        //print(self.my_passport.getsiz)
        if((self.name.text?.isEmpty)! || (self.SSN.text?.isEmpty)! || flag == false || image_flag == false){
            
            let alert = UIAlertController(title: "missing data", message: "Please Fill The Missing Data", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "return", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        else{
            
           
   
        
            let image = FireBase.uploadImage(LinkImage: "gs://graduation-a0b66.appspot.com/UsersImages", Image: self.my_passport.image!, Name: "\(self.SSN.text!)_")//gs://tourist-company.appspot.com/UsersImages
            company.big_images4.append(self.my_passport.image!)
            let company2: NSDictionary =  [
                
                "name" : self.name.text!,
                "ssn" : self.SSN.text!,
                "registered" : self.new_reg,
                "passport" : image,
                "Parent_id" : first_view.user_data["id"]!,
                "Offer_id" : first_view.data["id"]!
                
            ]
            
            Seat_reg.newly_added.append(self.new_reg)
            
            company.Big_company.append(company2)
            let label = self.view.viewWithTag(self.new_reg) as! UILabel
            label.backgroundColor = UIColor.purple
            Seat_reg.registered.append(self.new_reg)
            
            reset()
            
            self.my_passport.image = UIImage(named: "load_image.jpg")
             RappleActivityIndicatorView.stopAnimation()
            
        }

    }
    
    
    @IBAction func back(_ sender: Any) {

        Tools.makeNiceBackTransition(ob: self)
    }
    
    // MARK:- TODO:- This Method For Add GuesterAction
    @objc func Back (_ sender:UIScreenEdgePanGestureRecognizer) {
       Tools.makeNiceBackTransition(ob: self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    @IBAction func finisher(_ sender: Any) {
        
         print("finished")
                   
                     
                     if(Seat_reg.flag){
                         
                         let alert = UIAlertController(title: "Are You Sure", message: "", preferredStyle: .alert)
                         alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
                         
                           Seat_reg.finish_me()
                            
                            let storyBoard = UIStoryboard(name: "Main3", bundle: nil)
                            let correct = storyBoard.instantiateViewController(withIdentifier: "PayPage")
                            correct.modalPresentationStyle = .fullScreen
                            self.present(correct, animated: true, completion: nil)
                           
                              /* let storyBoard = UIStoryboard(name: "Main2", bundle: nil)
                                      let correct = storyBoard.instantiateViewController(withIdentifier: "finish")
                                      correct.modalPresentationStyle = .fullScreen
                                      self.present(correct, animated: true, completion: nil)*/
                         }))
                         
                          alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
                         self.present(alert, animated: true, completion: nil)

                     }else{
                         let alert = UIAlertController(title: "Missing Info", message: "Please Choose Your Seat", preferredStyle: .alert)
                         
                         alert.addAction(UIAlertAction(title: "return", style: .default, handler: nil))
                         self.present(alert, animated: true)
                     }
        
        
        print(first_view.user_data)
        print(company.Big_company)
           
        
        
    }
}

extension company:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func image_picker(){
        let image_picker23 = UIImagePickerController()
        image_picker23.allowsEditing = true
        image_picker23.delegate = self
        image_picker23.sourceType = .photoLibrary
        present(image_picker23,animated: true)
     
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
