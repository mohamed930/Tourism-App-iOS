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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.register(UINib(nibName: "SektionCellUmrah", bundle: nil), forCellWithReuseIdentifier: "Cell")
        configureAnimation()
    }

    @IBAction func BTNBack(_ sender:Any) {
        self.dismiss(animated: true, completion: nil)
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
