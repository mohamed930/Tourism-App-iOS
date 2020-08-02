//
//  Umrah_view.swift
//  Tourism_final
//
//  Created by mom on 3/15/20.
//  Copyright © 2020 mom. All rights reserved.
//

import Foundation
import UIKit
import Firebase






let db = Firestore.firestore()
let storage_Ref = Storage.storage().reference()

class Umrah_view: UIViewController {
    
    var big_arr:[Any] = []
    var big_images: [UIImage] = []
    
    @IBOutlet weak var my_table: UITableView!
    var screenedge : UIScreenEdgePanGestureRecognizer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK:- TODO:- This Line for adding Geusters.
        screenedge = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(Back(_:)))
        screenedge.edges = .left
        view.addGestureRecognizer(screenedge)
        
          let size = CGSize(width: UIScreen.main.bounds.size.width, height: 10)
          self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        my_table?.backgroundColor = UIColor.clear
        my_table.backgroundView = UIView(frame: CGRect.zero)
        
        
        
       /* photos_folder.downloadURL { (URL, error) in
            if let err = error{
                print("eror ay 7aga : \(err)")
                return
            }else{
                big_images.append(URL!)
                print("the url is \(URL!)")
            }
        }*/
        
       

        self.my_table.delegate = self
        self.my_table.dataSource = self
        self.my_table.register(UINib(nibName: "UmrahOrHajj Cell", bundle: nil), forCellReuseIdentifier: "Cell")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
         db.collection("Offers").getDocuments(){ (snapshot , err) in
                   if let err2 = err{
                       print("An error has occured => \(err2)")
                   }else{
                       for item in snapshot!.documents{
                           
                           if(item.data()["type"] as? String == "umrah"){
                            self.big_arr.append(item.data())
                    
                               self.get_image_storage(x: item.data()["fileref"] as! String )
                           }
                           
                           
                       }
                       self.my_table.reloadData()
                   }
                   
               }
    }
    
    func get_image_storage(x : String){
        
        let photos_folder = storage_Ref.child(x)
        
        
        photos_folder.getData(maxSize: 8 * 1024 * 768) { (Data, Error) in
            
            if let err = Error{
                print("an error has occured : \(err)")
                return
            }else{
                
                let data = Data
                let image = UIImage(data: data!)
                self.big_images.append(image!)
                print("done downloading image")
                
                self.my_table.reloadData()
            }
            
            
            
            
        }
    }
    
    @objc func Back (_ sender:UIScreenEdgePanGestureRecognizer) {
      
       
           Tools.makeNiceBackTransition(ob: self)
       }
    
}



extension Umrah_view : UITableViewDelegate,UITableViewDataSource{
    
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return big_images.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UmrahOrHajj_Cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UmrahOrHajj_Cell
        
        cell.layer.backgroundColor = UIColor.clear.cgColor
       
        cell.CoverImage.image = big_images[indexPath.row]
     
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 229.0;
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let story : UIStoryboard = UIStoryboard(name: "Main2", bundle: nil)
        let first = story.instantiateViewController(withIdentifier: "first") as! first_view
        
        first_view.data = big_arr[indexPath.row] as! [String : Any]
        first_view.data["image"] = big_images[indexPath.row]
        first_view.type = "Offers"
        self.big_arr.removeAll()
        self.big_images.removeAll()
        first.modalPresentationStyle = .fullScreen
        self.present(first, animated: true, completion: nil)
    }
    

}
