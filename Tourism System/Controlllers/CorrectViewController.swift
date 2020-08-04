//
//  CorrectViewController.swift
//  Tourism System
//
//  Created by Mohamed Ali on 7/26/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit

class CorrectViewController: UIViewController {

    var screenedge : UIScreenEdgePanGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK:- TODO:- This Line for adding Geusters.
        screenedge = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(Back(_:)))
        screenedge.edges = .left
        view.addGestureRecognizer(screenedge)
    }
    
    // MARK:- TODO:- This Method For Add GuesterAction
    @objc func Back (_ sender:UIScreenEdgePanGestureRecognizer) {
        first_view.delelte_all()
             
       Tools.MakeTransion(StoryName: "Main", ViewName: "Home", ob: self)
    }
}
