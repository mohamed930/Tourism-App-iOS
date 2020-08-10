//
//  Seat_reg.swift
//  Tourism_final
//
//  Created by mom on 3/22/20.
//  Copyright © 2020 mom. All rights reserved.
//

import UIKit


class Seat_reg: UIViewController {
    
    @IBOutlet weak var adder: UIButton!
    @IBOutlet weak var finish: UIButton!
    var screenedge : UIScreenEdgePanGestureRecognizer!
    
    static var registered:[Int] = []
    static var newly_added:[Int] = []
    static var data2:[String:Any] = [:]
   // var big_data:data!
    var new_reg:[Int] = []
    var selected:Int?
   static var flag = false
    var green:UIColor? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

     //   print("the seats registred are \(registered)")
       
        self.adder.layer.cornerRadius = 20
        self.finish.layer.cornerRadius = 20
       
        // MARK:- TODO:- This Line for adding Geusters.
        screenedge = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(Back(_:)))
        screenedge.edges = .left
        view.addGestureRecognizer(screenedge)
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
    }
    
    @objc func labler(_ sender:UITapGestureRecognizer){
        let my_label = sender.view as? UILabel
        //let green = UIColor.init(red: 0.269042, green: 1, blue: 0.624691, alpha: 1)
      //  print("the tag is \(my_label?.backgroundColor) and the color is \(green)")
        if(!Seat_reg.flag){
        if(my_label?.backgroundColor == green){
            my_label?.backgroundColor = UIColor.red
            Seat_reg.registered.append((my_label?.tag)!)
            Seat_reg.newly_added.append((my_label?.tag)!)
            Seat_reg.flag = true
            first_view.user_data["Seat_no"] = my_label?.tag
            print(new_reg)
            first_view.data = Seat_reg.data2
             
        }else{
            print("not equal")
        }
        }
    }
    @IBAction func booking_continues(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main2", bundle: nil)
        let result = storyBoard.instantiateViewController(withIdentifier: "third") as! company
        result.modalPresentationStyle = .fullScreen
       // company.registered = Seat_reg.registered
        self.present(result,animated: true,completion: nil)
    }
    
    @IBAction func back(_ sender: Any) {
        //self.navigationController?.popViewController(animated: true)
       /* let storyBoard : UIStoryboard = UIStoryboard(name: "Main2", bundle: nil)
        let result = storyBoard.instantiateViewController(withIdentifier: "first") as! first_view
        print("i am here man")
        
        result.modalPresentationStyle = .fullScreen
        
        self.present(result,animated: true,completion: nil)*/
        Tools.makeNiceBackTransition(ob: self)
    }
    
    // MARK:- TODO:- This Method For Add GuesterAction
    @objc func Back (_ sender:UIScreenEdgePanGestureRecognizer) {
       Tools.makeNiceBackTransition(ob: self)
    }
    @IBAction func finish_button(_ sender: Any) {
        print("finished")
        if(Seat_reg.flag){
          
            let alert = UIAlertController(title: "Are You Sure", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
            
              FireBase.updateDocumnt(collectionName: first_view.type, documntId: first_view.data["id"] as! String, data:
                  [
                      "reg" : Seat_reg.registered
                  ])
                if(!company.Big_company.isEmpty){
                    for x in 0...company.Big_company.count-1{
                         FireBase.addData(collectionName: "Companions", data: company.Big_company[x] as! [String : Any])
                    }
                }
                
                FireBase.addData(collectionName: "ReservedOffers", data: [
                
                    "fname" : first_view.user_data["Name"]!,
                    "User_id" : first_view.user_data["id"]!,
                    "ReservedOffer" : first_view.data["title"]!,
                    "phone" : first_view.user_data["Telephone"]!,
                    "email" : first_view.user_data["Email"]!,
                    "campany" : company.Big_company.count,
                    "seats" : Seat_reg.newly_added
                    
                ])
               
                
             
                Seat_reg.newly_added.removeAll()
                
                Seat_reg.flag = false
                  let storyBoard = UIStoryboard(name: "Main2", bundle: nil)
                         let correct = storyBoard.instantiateViewController(withIdentifier: "finish")
                         correct.modalPresentationStyle = .fullScreen
                         self.present(correct, animated: true, completion: nil)
            }))
            
             alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
      
            
        
        }else{
            let alert = UIAlertController(title: "Missing Info", message: "Please Choose Your Seat", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "return", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
      
      /*  FireBase.publicreadWithWhereCondtion(collectionName: "Users", key: "Email", value: LoginViewController.my_email) { (items) in
            for item in items.documents{
                print(item.data())
            }
        }*/
        print(first_view.user_data)
        print(company.Big_company)
        
       
    }
    
}
