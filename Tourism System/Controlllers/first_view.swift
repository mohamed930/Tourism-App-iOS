//
//  DetailsTableViewController.swift
//  Tourism_final
//
//  Created by Mohamed Ali on 7/20/20.
//  Copyright © 2020 mom. All rights reserved.
//

import UIKit

class first_view: UIViewController {
    
    var data:[String:Any] = [:]
     var timer : Timer?
    
     @IBOutlet weak var programm: UITextView!
     @IBOutlet weak var Time: UILabel!
     @IBOutlet weak var iamge: UIImageView!
     @IBOutlet weak var contin: UIButton!
     @IBOutlet weak var Cost: UILabel!
     @IBOutlet weak var first_label: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fornt_end_init()
      //  TabeViewCell.layer.frame.size.height = tableView.layer.frame.size.height
       // TabeViewCell.layer.frame.size.width = tableView.layer.frame.size.width
        //ButtonButtonConstraint.constant = 2.0
          //timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(loading), userInfo: nil, repeats: true)
          
         
         // print("the data is \(data)")
        //  print(type(of: data!))
        /*  self.activaty.startAnimating()
          self.activaty.stopAnimating()
          self.activaty.hidesWhenStopped = true*/
          self.first_label.text = data["title"] as? String
          self.Cost.text = data["OfferPrice"] as? String
          self.Time.text = data["Time"] as? String //wrong needs to change
          self.programm.text = data["OfferDetails"] as? String
          self.iamge.image = data["image"] as? UIImage

    }
    
    func fornt_end_init(){
        
        self.Cost.layer.cornerRadius = 20
        self.Time.layer.cornerRadius = 20
        self.programm.layer.cornerRadius = 20
        self.first_label.layer.cornerRadius = 20
        self.contin.layer.cornerRadius = 20
        
    }
    
    @IBAction func back(_ sender: Any) {
        print("deleting data")
        data.removeAll()
        Seat_reg.data2.removeAll()
        Seat_reg.registered.removeAll()
        haj_view.big_arr2.removeAll()
        haj_view.big_images2.removeAll()
        company.Big_company.removeAll()
       // self.navigationController?.popViewController(animated: true)
    //    let second = storyboard?.instantiateViewController(withIdentifier: "second") as! Seat_reg
        
        
      //  self.present(second, animated: true, completion: nil)
    }
    func get_image_storage(x : String){
        
        let photos_folder = storage_Ref.child(x)
        
        
        
        photos_folder.getData(maxSize: 1 * 800 * 600) { (Data, Error) in
            
            if let err = Error{
                print("an error has occured : \(err)")
                return
            }else{
                
                let data = Data
                let image = UIImage(data: data!)
                big_images.append(image!)
                print("done downloading image")
            }
        }
    }
    
    @IBAction func next(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main2", bundle: nil)
        let second = storyBoard.instantiateViewController(withIdentifier: "second") as! Seat_reg
        print("i am in first")
        Seat_reg.data2 = data
        Seat_reg.registered.append(contentsOf:  data["reg"] as! [Int]) //remove redundant data
        
        second.modalPresentationStyle = .fullScreen
        self.present(second, animated: true, completion: nil)
    }
}
