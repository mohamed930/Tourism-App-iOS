//
//  DetailsTableViewController.swift
//  Tourism_final
//
//  Created by Mohamed Ali on 7/20/20.
//  Copyright © 2020 mom. All rights reserved.
//

import UIKit

class first_view: UIViewController {
    
    static var data:[String:Any] = [:]
    static var flag = false
     var timer : Timer?
    public static var type = "Offers"
    public static var pickData:TravelsData?
    
     @IBOutlet weak var programm: UITextView!
     @IBOutlet weak var Time: UILabel!
     @IBOutlet weak var iamge: UIImageView!
     @IBOutlet weak var contin: UIButton!
     @IBOutlet weak var Cost: UILabel!
     @IBOutlet weak var first_label: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fornt_end_init()
        
        print("tocken: \(first_view.type)")
        print(first_view.data["title"] as! String)
        if(first_view.type == "OffersInternal"){
            FireBase.publicreadWithWhereCondtion(collectionName: first_view.type, key: "title", value: (first_view.pickData?.Name)!) { (quary) in
                for doc in quary.documents {
                    self.first_label.text = doc.get("title") as? String
                    self.Cost.text = doc.get("price") as? String
                    self.Time.text = doc.get("date") as? String
                    self.programm.text = doc.get("content") as? String
                    FireBase.DownloadImage(ReferenceURL: "gs://tourist-company.appspot.com", ImageURL: doc.get("fileref2") as! String, ImageView: self.iamge) //gs://tourist-company.appspot.com"
                    
                }
            }
            
            
        }else{
            FireBase.publicreadWithWhereCondtion(collectionName: first_view.type, key: "title", value: first_view.data["title"] as! String) { (quary) in
                for doc in quary.documents {
                    self.first_label.text = first_view.data["title"] as? String
                    self.Cost.text = first_view.data["price"] as? String
                    self.Time.text = first_view.data["date"] as? String
                    self.programm.text = first_view.data["content"] as? String
                    FireBase.DownloadImage(ReferenceURL: "gs://tourist-company.appspot.com", ImageURL: doc.get("fileref2") as! String, ImageView: self.iamge) //gs://tourist-company.appspot.com"
                    
                }
            }
        }
        
       
       
          

    }
    
    override func viewDidAppear(_ animated: Bool) {
        Seat_reg.data2 = first_view.data
        let registered_now = first_view.data["reg"] as? [Int]
       // print(first_view.flag , "is the falag" )
        if((registered_now) != nil && !first_view.flag){
            
        Seat_reg.registered.append(contentsOf:  (first_view.data["reg"] as? [Int])!) //remove redundant data
          //  first_view.flag = true
            
        
        }
    }
    
    func fornt_end_init(){
        
        self.Cost.layer.cornerRadius = 20
        self.Time.layer.cornerRadius = 20
        self.programm.layer.cornerRadius = 20
        self.first_label.layer.cornerRadius = 20
        self.contin.layer.cornerRadius = 20
        
    }
    
    @IBAction func back(_ sender: Any) {
        print("better fixes")
        
        first_view.data.removeAll()
        Seat_reg.data2.removeAll()
        Seat_reg.registered.removeAll()
        company.Big_company.removeAll()
        self.dismiss(animated: true, completion: nil) //needs further fixing

    }

    
    @IBAction func next(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main2", bundle: nil)
        let second = storyBoard.instantiateViewController(withIdentifier: "second") as! Seat_reg
        second.modalPresentationStyle = .fullScreen
      
        self.present(second, animated: true, completion: nil)
    }
}
