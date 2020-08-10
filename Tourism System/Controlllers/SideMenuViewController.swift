//
//  SideMenuViewController.swift
//  Tourism System
//
//  Created by Mohamed Ali on 8/8/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit

class D {
    var image:String
    var Name:String
    
    init(image:String,Name:String) {
        self.image = image
        self.Name = Name
    }
}

class SideMenuViewController: UIViewController {

    @IBOutlet weak var tableView:UITableView!
    var arr = Array<D>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "SideMenyCell", bundle: nil), forCellReuseIdentifier: "Cell")
        arr.append(D(image: "BR", Name: "Your Cards"))
        arr.append(D(image: "android-chrome-256x256", Name: "Send your opinion"))
        arr.append(D(image: "unnamed", Name: "info"))
    }
}

extension SideMenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : SideMenyCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
         as! SideMenyCell
        
        cell.NameTitleLabel.text = arr[indexPath.row].Name
        cell.logo.image = UIImage(named: arr[indexPath.row].image)
        cell.backgroundColor = UIColor.clear
        
        return cell
    }
    
    
}

extension SideMenuViewController: UITableViewDelegate {
    
}
