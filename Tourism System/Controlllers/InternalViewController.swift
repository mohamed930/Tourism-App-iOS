//
//  InternalViewController.swift
//  Tourism System
//
//  Created by Mohamed Ali on 6/8/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit

class InternalViewController: UIViewController {
    
    
    // MARK:- TODO:- This Message for Cell
    @IBOutlet weak var CairoTravels:UIImageView!
    @IBOutlet weak var AlexTravels:UIImageView!
    @IBOutlet weak var LoxourTravels:UIImageView!
    @IBOutlet weak var SharmTravels:UIImageView!
    
    var flag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setInternalMove(Image: CairoTravels)
        setInternalMove(Image: AlexTravels)
        setInternalMove(Image: LoxourTravels)
        setInternalMove(Image: SharmTravels)
    }
    
    // MARK:- TODO:- This Action Button Back.
    @IBAction func BTNBack(_ sender:Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToCairoTravels" {
            let vc = segue.destination as! TravelsViewController
            vc.f = self.flag
        }
    }
    
    // MARK:- TODO:- This Sektion For Make one Segue to Internal Trips.
    // ----------------------------------------------------------------
    func setInternalMove(Image:UIImageView) {
        
        var tab = UITapGestureRecognizer()
        
        switch Image {
        case CairoTravels:
            tab = UITapGestureRecognizer(target: self, action: #selector(gotoCairo(tapGestureRecognizer:)))
            break
        case AlexTravels:
            tab = UITapGestureRecognizer(target: self, action: #selector(gotoAlex(tapGestureRecognizer:)))
            break
        case LoxourTravels:
            tab = UITapGestureRecognizer(target: self, action: #selector(gotoLoxour(tapGestureRecognizer:)))
            break
        default:
            tab = UITapGestureRecognizer(target: self, action: #selector(gotoSharm(tapGestureRecognizer:)))
            break
        }
        tab.numberOfTapsRequired = 1
        tab.numberOfTouchesRequired = 1
        Image.isUserInteractionEnabled = true
        Image.addGestureRecognizer(tab)
        
    }
    
    @objc func gotoCairo(tapGestureRecognizer: UITapGestureRecognizer) {
        self.flag = 1
        self.performSegue(withIdentifier: "GoToCairoTravels", sender: self)
    }
    // ----------------------------------------------------------------
    @objc func gotoAlex(tapGestureRecognizer: UITapGestureRecognizer) {
        self.flag = 2
        self.performSegue(withIdentifier: "GoToCairoTravels", sender: self)
    }
    // ----------------------------------------------------------------
    @objc func gotoLoxour(tapGestureRecognizer: UITapGestureRecognizer) {
        self.flag = 3
        self.performSegue(withIdentifier: "GoToCairoTravels", sender: self)
    }
    // ----------------------------------------------------------------
    @objc func gotoSharm(tapGestureRecognizer: UITapGestureRecognizer) {
        self.flag = 4
        self.performSegue(withIdentifier: "GoToCairoTravels", sender: self)
    }
}
