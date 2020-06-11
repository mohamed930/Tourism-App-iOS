//
//  LocationMapViewController.swift
//  Tourism System
//
//  Created by Mohamed Ali on 6/7/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit
import DropDown

class LocationMapViewController: UIViewController {
    
    var location_mapview:LocationMapView! {
        guard isViewLoaded else {return nil}
        return (view as! LocationMapView)
    }
    
    var menu:DropDown!
    var flag = 1

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        MakeDropDown()
    }
    
    // MARK:- TODO:- This Action Method For Preview Map.
    @IBAction func ShowMap (_ sender:Any) {
        
        if location_mapview.CityNameLabel.text == "Portsaid City" {
            self.flag = 1
        }
        else if location_mapview.CityNameLabel.text == "London City" {
            self.flag = 2
        }
        else if location_mapview.CityNameLabel.text == "Abu Zabi City" {
            self.flag = 3
        }
        else {
            self.flag = 1
        }
        self.performSegue(withIdentifier: "ShowMap", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowMap" {
            let vc = segue.destination as! MapViewController
            vc.flag = self.flag
        }
    }
    
    func MakeDropDown() {
        menu = {
            let menu = DropDown()
            menu.dataSource = ["Portsaid","London","Abu Zabi"]
            return menu
        }()
        menu.anchorView = location_mapview.CompoView
        
        let g = UITapGestureRecognizer(target: self, action: #selector(didTapTop))
        g.numberOfTapsRequired = 1
        g.numberOfTouchesRequired = 1
        location_mapview.CompoView.addGestureRecognizer(g)
        
        menu.selectionAction = {
            index , title in
            self.location_mapview.PickCity.text = title
            
            switch self.location_mapview.PickCity.text {
            case "Portsaid":
                self.location_mapview.MapImage.image = UIImage(named: "Egpt,PortSaid")
                self.location_mapview.FlagImage.image = UIImage(named: "flag-400")
                self.location_mapview.CityNameLabel.text = "Portsaid City"
                self.location_mapview.CityPopulationLabel.text = "1M People"
                self.location_mapview.AddressLabel.text = "Protfouad, new build in front of see"
                break
            case "London":
                self.location_mapview.MapImage.image = UIImage(named: "London")
                self.location_mapview.FlagImage.image = UIImage(named: "England")
                self.location_mapview.CityNameLabel.text = "London City"
                self.location_mapview.CityPopulationLabel.text = "5.5M People"
                self.location_mapview.AddressLabel.text = "London, in front of Bigban"
                break
            default:
                self.location_mapview.MapImage.image = UIImage(named: "UnitedArabUnited")
                self.location_mapview.FlagImage.image = UIImage(named: "UAD")
                self.location_mapview.CityNameLabel.text = "Abu Zabi City"
                self.location_mapview.CityPopulationLabel.text = "10M People"
                self.location_mapview.AddressLabel.text = "Abu Zabi 10th floor in khalifa twor"
                break
            }
        }
    }
    
    @objc func didTapTop() {
        menu.show()
    }
    
}
