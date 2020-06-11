//
//  FireBase.swift
//  Tourism System
//
//  Created by Mohamed Ali on 6/11/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage
import RappleProgressHUD

class FireBase {
    
    public static func addData (collectionName:String,data:[String:Any]) {
        
        RappleActivityIndicatorView.startAnimatingWithLabel("loading", attributes: RappleModernAttributes)
        Firestore.firestore().collection(collectionName).document().setData(data){
            error in
            if error != nil {
                RappleActivityIndicatorView.stopAnimation()
                ProgressHUD.showError("Your Data not created Successed!")
            }
            else {
                RappleActivityIndicatorView.stopAnimation()
                ProgressHUD.showSuccess("Your Data created Successed!")
            }
        }
    }
    
    public static func createAccount(Email:String,Password:String,collectionName:String,data:[String:String]) {
        
        Auth.auth().createUser(withEmail: Email, password: Password) { (auth, error) in
            if error != nil {
                RappleActivityIndicatorView.stopAnimation()
                ProgressHUD.showError("Your Data not created Successed!")
            }
            else {
                self.addData(collectionName: collectionName, data: data)
            }
        }
    }
    
    public static func uploadImage (LinkImage:String,Image:UIImage,Name:String) -> String  {
        RappleActivityIndicatorView.startAnimatingWithLabel("loading", attributes: RappleModernAttributes)
        
        let StorageRef = Storage.storage().reference(forURL: LinkImage)
        
        // convert image to Data
        var data = Data()
        data = Image.jpegData(compressionQuality: 0.8)! as Data
        let dateFormate = DateFormatter()
        dateFormate.dateFormat = "DD_MM_yy_h_mm_a"
        let imagename = dateFormate.string(from: NSDate() as Date)
        let SS = String(Name)
        let imagepath = "Images/\(SS)\(imagename).jpg"
        // Create storage reference
        let mainReference = StorageRef.child(imagepath)
        
        // Create file metadata including the content type
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        // upload file and metadata
        mainReference.putData(data, metadata: metadata)
        
        return imagepath
    }
}
