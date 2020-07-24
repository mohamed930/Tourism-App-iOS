//
//  SektionViewController.swift
//  Tourism System
//
//  Created by Mohamed Ali on 6/8/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit

class SektionViewController: UIViewController {
    
    // MARK:- TODO:- This Sektion For Intialize Varible.
    @IBOutlet weak var InternalImage:UIImageView!
    @IBOutlet weak var UmrahImage:UIImageView!
    @IBOutlet weak var ExternalImage:UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setInternalMove()
        setUmrahMove()
        setExternalMove()
    }
    
    // MARK:- TODO:- This Sektion For Make one Segue to Internal Trips.
    // ----------------------------------------------------------------
    func setInternalMove() {
        
        let tab = UITapGestureRecognizer(target: self, action: #selector(gotointernal(tapGestureRecognizer:)))
        tab.numberOfTapsRequired = 1
        tab.numberOfTouchesRequired = 1
        InternalImage.isUserInteractionEnabled = true
        InternalImage.addGestureRecognizer(tab)
        
    }
    @objc func gotointernal(tapGestureRecognizer: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "GoToInternal", sender: self)
    }
    // ----------------------------------------------------------------
    
    
    // MARK:- TODO:- This Sektion For Make one Segue to Umrah/Hajj Trips.
    // ----------------------------------------------------------------
    func setUmrahMove() {
        
        let tab = UITapGestureRecognizer(target: self, action: #selector(gotoumrah(tapGestureRecognizer:)))
        tab.numberOfTapsRequired = 1
        tab.numberOfTouchesRequired = 1
        UmrahImage.isUserInteractionEnabled = true
        UmrahImage.addGestureRecognizer(tab)
        
    }
    @objc func gotoumrah(tapGestureRecognizer: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "GoToUmrah", sender: self)
    }
    // ----------------------------------------------------------------
    
    // MARK:- TODO:- This Section For Make one Segue to External Trips.
    // ----------------------------------------------------------------
    func setExternalMove() {
        
        let tab = UITapGestureRecognizer(target: self, action: #selector(gotoExternal(tapGestureRecognizer:)))
        tab.numberOfTapsRequired = 1
        tab.numberOfTouchesRequired = 1
        ExternalImage.isUserInteractionEnabled = true
        ExternalImage.addGestureRecognizer(tab)
        
    }
    @objc func gotoExternal(tapGestureRecognizer: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "GoToExternal", sender: self)
    }
    // ----------------------------------------------------------------
}
