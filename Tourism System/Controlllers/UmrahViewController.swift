//
//  UmrahViewController.swift
//  Tourism System
//
//  Created by Mohamed Ali on 6/8/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit
import Gemini

class UmrahViewController: UIViewController {
    
    // MARK:- TODO:- This Sektion For Intialize varibles here.
    @IBOutlet weak var collectionView:GeminiCollectionView!
    var ImageArray = ["UmrahCell","HajjCell"]
    var screenedge : UIScreenEdgePanGestureRecognizer!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.register(UINib(nibName: "SektionCellUmrah", bundle: nil), forCellWithReuseIdentifier: "Cell")
        self.collectionView?.backgroundColor = UIColor.clear
        self.collectionView?.backgroundView = UIView(frame: CGRect.zero)
        configureAnimation()
        
        // MARK:- TODO:- This Line for adding Geusters.
        screenedge = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(Back(_:)))
        screenedge.edges = .left
        view.addGestureRecognizer(screenedge)
    }

    @IBAction func BTNBack(_ sender:Any) {
        Tools.makeNiceBackTransition(ob: self)
    }
    
    @objc func Back (_ sender:UIScreenEdgePanGestureRecognizer) {
        Tools.makeNiceBackTransition(ob: self)
    }
}

extension UmrahViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ImageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : SektionCellUmrah = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SektionCellUmrah
        
        self.collectionView.animateCell(cell)
        cell.travelCover.image = UIImage(named: ImageArray[indexPath.row])
        return cell
    }
}

extension UmrahViewController: UICollectionViewDelegate {
    
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
           // TabBarViewController.tag = 2
            
            Tools.MakeTransion(StoryName: "Main2", ViewName: "umrah_trips", ob: self)
        }
        else {
           // TabBarViewController.tag = 3
            Tools.MakeTransion(StoryName: "Main2", ViewName: "hajj_trips", ob: self)
        }
       // Tools.MakeTransion(StoryName: "Main2", ViewName: "Umrah", ob: self)
    }
}

extension UmrahViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath:
        IndexPath) -> CGSize {
        
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
