//
//  ExternalViewController.swift
//  Tourism System
//
//  Created by Mohamed Ali on 6/8/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit

class OffersData {
    var travelImage:String?
    var travelName:String?
    
    init(travelImage:String,travelName:String) {
        self.travelName = travelName
        self.travelImage = travelImage
    }
}

class ExternalViewController: UIViewController {
    
    var buttonArray = ["BTNAsia","BTNEurope","BTNAfrica","BTNNorth Amercain"]
    @IBOutlet weak var collectionView:UICollectionView!
    @IBOutlet weak var collectionView2:UICollectionView!
    
    var screenedge : UIScreenEdgePanGestureRecognizer!
    
    var TravelList = Array<OffersData>()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.register(UINib(nibName: "MapButtonCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        
        collectionView2.register(UINib(nibName: "CommonofferCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        TravelList.append(OffersData(travelImage: "AlexCover", travelName: "Alex1"))
        TravelList.append(OffersData(travelImage: "AlexCover", travelName: "Alex2"))
        TravelList.append(OffersData(travelImage: "AlexCover", travelName: "Alex3"))
        collectionView2.reloadData()
        
        // MARK:- TODO:- This Line for adding Geusters.
               screenedge = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(Back(_:)))
               screenedge.edges = .left
               view.addGestureRecognizer(screenedge)
        
    }
    
    @IBAction func BTNBack(_ sender:Any){
        Tools.makeNiceBackTransition(ob: self)
    }
    
    @objc func Back (_ sender:UIScreenEdgePanGestureRecognizer) {
         Tools.makeNiceBackTransition(ob: self)
   }
}

extension ExternalViewController:UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            return buttonArray.count
        }
        else {
            return TravelList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 1 {
            let cell : MapButtonCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MapButtonCell
            cell.ButtonLogo.image = UIImage(named: buttonArray[indexPath.row])
            return cell
        }
        else {
            let cell : CommonofferCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CommonofferCell
            cell.TravelCover.image = UIImage(named: TravelList[indexPath.row].travelImage!)
            cell.TravelNameLabel.text = TravelList[indexPath.row].travelName!
            return cell
        }
    }
}

extension ExternalViewController: UICollectionViewDelegate {
    
}

extension ExternalViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath:
           IndexPath) -> CGSize {
        
            if collectionView.tag == 1 {
                return CGSize(width: 197.0, height: self.collectionView.frame.height)
            }
            else {
                return CGSize(width: 190, height: self.collectionView2.frame.height)
            }
       }
}
