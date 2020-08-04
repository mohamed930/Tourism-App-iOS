//
//  registrations.swift
//  Tourism System
//
//  Created by hesham elbermbaly on 8/3/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit

class registrations: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
     var big_arr:[NSDictionary] = []

    
    @IBOutlet weak var tableView2:UITableView!
       var screenedge : UIScreenEdgePanGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView2.register(UINib(nibName: "Accompying Cell", bundle: nil), forCellReuseIdentifier: "Cell")
               
               // MARK:- TODO:- This Line for adding Geusters.
               screenedge = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(Back(_:)))
               screenedge.edges = .left
               view.addGestureRecognizer(screenedge)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        FireBase.publicreadWithWhereCondtion(collectionName: "ReservedOffers", key: "User_id", value: first_view.user_data["id"] as! String) { (query) in
            for doc in query.documents{
                
                let record = [
                    "user_name" : doc.data()["fname"]!,
                    "user_seat" : doc.data()["user_seat"]!,
                    "Offer-id" :  doc.data()["ReservedOffer"]!
                ]
                
                self.big_arr.append(record as NSDictionary)
                
                
            }
        }
        
        print(self.big_arr)
    }
    
    
    
    @objc func Back (_ sender:UIScreenEdgePanGestureRecognizer) {
         Tools.makeNiceBackTransition(ob: self)
      }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.big_arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "justaCell", for: indexPath)
        
        
        
        
        return cell

    }

}
