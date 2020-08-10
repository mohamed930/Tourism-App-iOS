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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "Accompying Cell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        // MARK:- TODO:- This Line for adding Geusters.
        screenedge = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(Back(_:)))
        screenedge.edges = .left
        view.addGestureRecognizer(screenedge)
    }
    
    @IBAction func BTNBack(_ sender:Any) {

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
        return (company.Big_company.count)
       }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
       let cell : Accompying_Cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Accompying_Cell

    
       
       cell.NameLabel.text = company.Big_company[indexPath.row]["name"] as? String

        cell.ImageCover.image = company.big_images4[indexPath.row]
       

       return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func data_remover(x:Int , index:Int){
       Seat_reg.registered =  Seat_reg.registered.filter {$0 != x}
       Seat_reg.newly_added =  Seat_reg.newly_added.filter {$0 != x}
       company.Big_company.remove(at: index)
       company.big_images4.remove(at: index)
                   
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
          let y =  company.Big_company[indexPath.row]["registered"] as! Int
            print(y)
            data_remover(x: y, index: indexPath.row)
            print("record no#\(indexPath.row) deleted")
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        
        
    }
    
    
}
