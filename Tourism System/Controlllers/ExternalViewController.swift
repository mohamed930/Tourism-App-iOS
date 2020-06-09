//
//  ExternalViewController.swift
//  Tourism System
//
//  Created by Mohamed Ali on 6/8/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit

class ExternalViewController: UIViewController {
    
    var buttonArray = ["BTNAsia","BTNEurope","BTNAfrica","BTNNorth Amercain"]
    @IBOutlet weak var collectionView:UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.register(UINib(nibName: "MapButtonCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
    }
    
    @IBAction func BTNBack(_ sender:Any){
        self.dismiss(animated: true, completion: nil)
    }
}

extension ExternalViewController:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return buttonArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : MapButtonCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MapButtonCell
        cell.ButtonLogo.image = UIImage(named: buttonArray[indexPath.row])
        return cell
    }
}

extension ExternalViewController: UICollectionViewDelegate {
    
}

extension ExternalViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath:
           IndexPath) -> CGSize {
           
            return CGSize(width: 197.0, height: self.collectionView.frame.height)
       }
}
