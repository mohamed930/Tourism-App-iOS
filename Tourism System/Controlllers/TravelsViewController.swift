//
//  TravelsViewController.swift
//  Tourism System
//
//  Created by Mohamed Ali on 6/9/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit
import Gemini

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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        LoadData()
    }
    
    
    // MARK:- TODO:- This Action Method For Button Back.
    @IBAction func BTNBack(_ sender:Any){
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK:- TODO:- This Method That Worked on load page.
    func LoadData() {
        
        collectionView.register(UINib(nibName: "TravelCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        
        switch f {
        case 1:
            self.TitleLabel.text = "Cairo Travels"
            List.append(TravelsData(Image: "CairoTravel", Name: "Cairo (1)"))
            List.append(TravelsData(Image: "CairoTravel", Name: "Cairo (2)"))
            List.append(TravelsData(Image: "CairoTravel", Name: "Cairo (3)"))
            List.append(TravelsData(Image: "CairoTravel", Name: "Cairo (4)"))
            List.append(TravelsData(Image: "CairoTravel", Name: "Cairo (5)"))
            break
        case 2:
            self.TitleLabel.text = "Alexandria Travels"
            List.append(TravelsData(Image: "AlexCover", Name: "Alex (1)"))
            List.append(TravelsData(Image: "AlexCover", Name: "Alex (2)"))
            List.append(TravelsData(Image: "AlexCover", Name: "Alex (3)"))
            List.append(TravelsData(Image: "AlexCover", Name: "Alex (4)"))
            List.append(TravelsData(Image: "AlexCover", Name: "Alex (5)"))
            break
        case 3:
            self.TitleLabel.text = "Loxour & Aswan Travels"
            List.append(TravelsData(Image: "LoxourCover", Name: "Loxour (1)"))
            List.append(TravelsData(Image: "LoxourCover", Name: "Loxour (2)"))
            List.append(TravelsData(Image: "LoxourCover", Name: "Loxour (3)"))
            List.append(TravelsData(Image: "LoxourCover", Name: "Loxour (4)"))
            List.append(TravelsData(Image: "LoxourCover", Name: "Loxour (5)"))
            break
        case 4:
            self.TitleLabel.text = "Sharm el-sheikh Travels"
            List.append(TravelsData(Image: "SharmCover", Name: "Sharm (1)"))
            List.append(TravelsData(Image: "SharmCover", Name: "Sharm (2)"))
            List.append(TravelsData(Image: "SharmCover", Name: "Sharm (3)"))
            List.append(TravelsData(Image: "SharmCover", Name: "Sharm (4)"))
            List.append(TravelsData(Image: "SharmCover", Name: "Sharm (5)"))
            break
        default:
            print("Error!")
        }
        self.collectionView.reloadData()
        configureAnimation()
    }
}

extension TravelsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return List.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : TravelCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TravelCell
        self.collectionView.animateCell(cell)
        cell.TravelCover.image = UIImage(named: List[indexPath.row].Image!)
        cell.TravelNameLabel.text = List[indexPath.row].Name!
        
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
