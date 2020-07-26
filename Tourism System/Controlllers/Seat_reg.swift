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
    static var data2:[String:Any] = [:]
   // var big_data:data!
    var new_reg:[Int] = []
    var selected:Int?
    var flag = false
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
        if(!flag){
        if(my_label?.backgroundColor == green){
            my_label?.backgroundColor = UIColor.red
            Seat_reg.registered.append((my_label?.tag)!)
            flag = true
          
            print(new_reg)
            first_view.data = Seat_reg.data2
             
        }else{
            print("not equal")
        }
        }
    }
    @IBAction func booking_continues(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main2", bundle: nil)
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

}
