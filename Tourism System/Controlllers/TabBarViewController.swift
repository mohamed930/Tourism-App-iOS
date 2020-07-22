//
//  TabBarViewController.swift
//  Tourism System
//
//  Created by Mohamed Ali on 7/22/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    public static var tag:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        print("I am tag \((TabBarViewController.tag)!)")

        // Do any additional setup after loading the view.
        if TabBarViewController.tag! == 2 {
            print("Action1")
            self.selectedIndex = 0
        }
        else {
            print("Action2")
            self.selectedIndex = 1
        }
    }
}
