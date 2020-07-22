//
//  TravelsViewController.swift
//  Tourism System
//
//  Created by Mohamed Ali on 6/9/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit
import Gemini
import RappleProgressHUD

class TravelsData {
    var Image:String!
    var Name:String!
    
    init(Image:String,Name:String) {
        self.Image = Image
        self.Name = Name
    }
}

class TravelsViewController: UIViewController {
    
    var f = 0
    @IBOutlet weak var TitleLabel:UILabel!
    @IBOutlet weak var collectionView:GeminiCollectionView!
    var List = Array<TravelsData>()
    
    var screenedge : UIScreenEdgePanGestureRecognizer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        LoadData()
        
        // MARK:- TODO:- This Line for adding Geusters.
        screenedge = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(Back(_:)))
        screenedge.edges = .left
        view.addGestureRecognizer(screenedge)
    }
    
    
    // MARK:- TODO:- This Action Method For Button Back.
    @IBAction func BTNBack(_ sender:Any){
        Tools.makeNiceBackTransition(ob: self)
    }
    
    // MARK:- TODO:- This Method For Add GuesterAction
    @objc func Back (_ sender:UIScreenEdgePanGestureRecognizer) {
       Tools.makeNiceBackTransition(ob: self)
    }
    
    // MARK:- TODO:- This Method For Download Data From Firebase.
    func DownloadData(k:String,v:String) {
        List.removeAll()
        RappleActivityIndicatorView.startAnimatingWithLabel("loading", attributes: RappleModernAttributes)
        FireBase.publicreadWithWhereCondtion(collectionName: "OffersInternal", key: k, value: v) { (query) in
            for doc in query.documents {
                let ob = TravelsData(Image: doc.get("fileref") as! String, Name: doc.get("title") as! String)
                self.List.append(ob)
                self.collectionView.reloadData()
                self.configureAnimation()
            }
            RappleActivityIndicatorView.stopAnimation()
        }
    }
    
    // MARK:- TODO:- This Method That Worked on load page.
    func LoadData() {
        
        collectionView.register(UINib(nibName: "TravelCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        
        switch f {
        case 1:
            self.TitleLabel.text = "Cairo Travels"
            self.DownloadData(k: "to", v: "Cairo")
            break
        case 2:
            self.TitleLabel.text = "Alexandria Travels"
            self.DownloadData(k: "to", v: "Alex")
            break
        case 3:
            self.TitleLabel.text = "Loxour & Aswan Travels"
            self.DownloadData(k: "to", v: "Loxour")
            break
        case 4:
            self.TitleLabel.text = "Sharm el-sheikh Travels"
            self.DownloadData(k: "to", v: "Sharm")
            break
        default:
            print("Error!")
        }
    }
}

extension TravelsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return List.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : TravelCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TravelCell
        self.collectionView.animateCell(cell)
        cell.TravelNameLabel.text = List[indexPath.row].Name!
        FireBase.DownloadImage(ReferenceURL: "gs://tourist-company.appspot.com/", ImageURL: List[indexPath.row].Image, ImageView: cell.TravelCover)
        
        switch f {
        case 1:
            cell.TravelNameLabel.layer.backgroundColor = UIColor().hexStringToUIColor(hex: "#43729D").cgColor
            break
        case 2:
        cell.TravelNameLabel.layer.backgroundColor = UIColor().hexStringToUIColor(hex: "#943B80").cgColor
            break
        case 3:
        cell.TravelNameLabel.layer.backgroundColor = UIColor().hexStringToUIColor(hex: "#943B3B").cgColor
            break
        case 4:
            cell.TravelNameLabel.layer.backgroundColor = UIColor().hexStringToUIColor(hex: "#3B3F94").cgColor
            break
        default:
            print("Error!")
        }
        
        return cell
    }
}

extension TravelsViewController: UICollectionViewDelegate {
    
    // Configure animation and properties
   func configureAnimation() {
       collectionView.gemini
       .scaleAnimation()
       .scale(0.75)
       .scaleEffect(.scaleUp) // or .scaleDown
   }
       
   // Call animation function
   func scrollViewDidScroll(_ scrollView: UIScrollView) {
       collectionView.animateVisibleCells()
   }

   func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
       if let cell = cell as? GeminiCell {
           self.collectionView.animateCell(cell)
       }
   }
    
    // Make Transection.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //TabBarViewController.tag = 1
        Tools.MakeTransion(StoryName: "Main2", ViewName: "first", ob: self)
    }

    
}

extension TravelsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath:
        IndexPath) -> CGSize {
        
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
