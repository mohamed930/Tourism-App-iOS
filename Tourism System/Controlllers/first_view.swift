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
    public static var type = 0
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
        if first_view.type == 0 {
            self.first_label.text = data["title"] as? String
            self.Cost.text = data["OfferPrice"] as? String
            self.Time.text = data["Time"] as? String //wrong needs to change
            self.programm.text = data["OfferDetails"] as? String
            self.iamge.image = data["image"] as? UIImage
        }
        else if first_view.type == 1 {
            FireBase.publicreadWithWhereCondtion(collectionName: "OffersInternal", key: "title", value: first_view.pickData!.Name) { (quary) in
                for doc in quary.documents {
                    self.first_label.text = first_view.pickData!.Name
                    self.Cost.text = (doc.get("price") as! String)
                    self.Time.text = (doc.get("date") as! String)
                    self.programm.text = (doc.get("content") as! String)
                    FireBase.DownloadImage(ReferenceURL: "gs://tourist-company.appspot.com", ImageURL: doc.get("fileref2") as! String, ImageView: self.iamge)
                }
            }
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
