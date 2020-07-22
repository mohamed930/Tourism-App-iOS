//
//  Umrah_view.swift
//  Tourism_final
//
//  Created by mom on 3/15/20.
//  Copyright © 2020 mom. All rights reserved.
//

import UIKit
import Firebase






let db2 = Firestore.firestore()

class haj_view: UIViewController {
    static var big_arr2:[Any] = []
    static var big_images2: [UIImage] = []
    
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
        
        self.my_table.delegate = self
        self.my_table.dataSource = self
        self.my_table.register(UINib(nibName: "UmrahOrHajj Cell", bundle: nil), forCellReuseIdentifier: "Cell")
 
        
        db2.collection("Offers").getDocuments(){ (snapshot , err) in
            if let err2 = err{
                print("An error has occured => \(err2)")
            }else{
                for item in snapshot!.documents{
                    
                    if(item.data()["type"] as? String == "haj"){
                        haj_view.big_arr2.append(item.data())
                       // images_arr2.append("haj.jpg")
                        self.get_image_storage(x: item.data()["image"] as! String )
                    }
            
                }
                self.my_table.reloadData()
            }
            
        }
        
        
        
    }
    
    
    func get_image_storage(x : String){
        
        let photos_folder = storage_Ref.child(x)
        
        
        photos_folder.getData(maxSize: 1 * 800 * 600) { (Data, Error) in
            
            if let err = Error{
                print("an error has occured 2020 : \(err)")
                return
            }else{
                
                let data = Data
                let image = UIImage(data: data!)
                haj_view.big_images2.append(image!)
                print("done downloading image")
                self.my_table.reloadData()
            }
            
            
            
            
        }
    }
    
    @objc func Back (_ sender:UIScreenEdgePanGestureRecognizer) {
        Tools.makeNiceBackTransition(ob: self)
    }
    
}



extension haj_view : UITableViewDelegate,UITableViewDataSource{
    
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return haj_view.big_images2.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UmrahOrHajj_Cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UmrahOrHajj_Cell
        
        // Configure the cell...
        //  print(big_arr[0])
        //let imagee = cell.viewWithTag(2) as! UIImageView
        //imagee.image = UIImage(named: images_arr2[indexPath.row])
        
        cell.CoverImage.image = haj_view.big_images2[indexPath.row]
        
        
        // imagee.image = try! UIImage.init(data: NSData.init(contentsOf: URL.init(string: big_arr[0])!) as Data)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return 229;
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(images_arr[indexPath.row])
        
        print("inside did seleect")
        // selected_row = indexPath.row
        // performSegue(withIdentifier: "first", sender: self)
        
        let story : UIStoryboard = UIStoryboard(name: "Main2", bundle: nil)
        let first = story.instantiateViewController(withIdentifier: "first") as! first_view
        print("the index path is \(big_arr.count)")
        first.data = haj_view.big_arr2[indexPath.row] as! [String : Any]
        //  data.init(bigArr: big_arr2[indexPath.row] as! [String : Any])
        first.data["image"] = haj_view.big_images2[indexPath.row]
        first.modalPresentationStyle = .fullScreen
        self.present(first, animated: true, completion: nil)
    }
    
    /*  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if(segue.identifier == "first"){
     
     let first = segue.destination as! first_view
     var indexPathForSelectedRow: IndexPath?
     
     print("inside prepare at \(IndexPath.)")
     // first.data = big_arr[indexPathForSelectedRow?.row]
     
     
     // first.data = big_arr[IndexPath.Index]
     }
     }*/
}
