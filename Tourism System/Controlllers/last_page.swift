//
//  AccompyningViewController.swift
//  Tourism_final
//
//  Created by Mohamed Ali on 7/19/20.
//  Copyright © 2020 mom. All rights reserved.
//

import UIKit

class last_page :UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var tableView:UITableView!
    var screenedge : UIScreenEdgePanGestureRecognizer!
  //  static var big_arr:[NSDictionary]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "Accompying Cell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        // MARK:- TODO:- This Line for adding Geusters.
        screenedge = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(Back(_:)))
        screenedge.edges = .left
        view.addGestureRecognizer(screenedge)
    }
    
    @IBAction func BTNBack(_ sender:Any) {
      /*  let storyBoard : UIStoryboard = UIStoryboard(name: "Main2", bundle: nil)
        let company3 = storyBoard.instantiateViewController(withIdentifier: "third") as! company
        
       
     
        
        print("in herer " , company.Big_company.count)
        company3.modalPresentationStyle = .fullScreen
        self.present(company3 , animated: true)*/
        Tools.makeNiceBackTransition(ob: self)
    }
    
    // MARK:- TODO:- This Method For Add GuesterAction
    @objc func Back (_ sender:UIScreenEdgePanGestureRecognizer) {
       Tools.makeNiceBackTransition(ob: self)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           // #warning Incomplete implementation, return the number of rows
        return (company.Big_company.count)
       }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
       let cell : Accompying_Cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Accompying_Cell

       // Configure the cell...
       
       //let label = cell.viewWithTag(2) as? UILabel
       
       cell.NameLabel.text = company.Big_company[indexPath.row]["name"] as? String
       
       //let imagee = cell.viewWithTag(3) as? UIImageView
       cell.ImageCover.image = company.Big_company[indexPath.row]["passport"] as? UIImage
       

       return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
          let x =  company.Big_company[indexPath.row]["registered"] as! Int
            print(x)
            Seat_reg.registered =  Seat_reg.registered.filter {$0 != x}
            /*for y in 0...arr.count-1{
                print("the y is " , arr[y])
                Seat_reg.registered =  Seat_reg.registered.filter {$0 != arr[y]}
            }*/
            company.Big_company.remove(at: indexPath.row)
            
            if(company.Big_company.count != 0){
                 for i in 0...company.Big_company.count-1{
                     Seat_reg.registered.append(company.Big_company[i]["registered"] as! Int)
                 }
             }
            
            tableView.reloadData()
            print("record no#\(indexPath.row) deleted")
        }
        
    }
}
