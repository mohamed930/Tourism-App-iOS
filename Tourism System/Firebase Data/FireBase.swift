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
    
    // MARK:- TODO:- This Method For Adding Data to Firebase.
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
    
    // MARK:- TODO:- This Method For Signup completly to Firebase.
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
    
    // MARK:- TODO:- This Method For Make a login opertation.
    public func MakeLogin (Email:String,Password:String,completion: @escaping (String) -> ())  {
        
        RappleActivityIndicatorView.startAnimatingWithLabel("loading", attributes: RappleModernAttributes)
        
        Auth.auth().signIn(withEmail: Email, password: Password) { (auth, error) in
            if error != nil {
                RappleActivityIndicatorView.stopAnimation()
                ProgressHUD.showError("Your \(error!.localizedDescription)")
                completion("Failed")
            }
            else {
                RappleActivityIndicatorView.stopAnimation()
                ProgressHUD.showSuccess("Success in login")
                completion("Success")
            }
        }
        
    }
    
    // MARK:- TODO:- This Method for Read Data from Firebase with condtion.
    public static func readWithWhereCondtion (collectionName:String,Email:String , complention: @escaping (QuerySnapshot) -> ()) {
        
        RappleActivityIndicatorView.startAnimatingWithLabel("loading", attributes: RappleModernAttributes)
        Firestore.firestore().collection(collectionName).whereField("Email", isEqualTo: Email).getDocuments { (quary, error) in
            if error != nil {
                RappleActivityIndicatorView.stopAnimation()
                ProgressHUD.showError("We Can't Find Your Data!")
            }
            else {
                complention(quary!)
            }
        }
    }
    
    // MARK:- TODO:- This Method For Update Data from Firebase.
    public static func updateDocumnt (collectionName:String,documntId:String,data:[String:Any]) {
        
        Firestore.firestore().collection(collectionName).document(documntId).updateData(data){
            error in
            if error != nil {
                RappleActivityIndicatorView.stopAnimation()
                ProgressHUD.showError("Your Data isn't updated Successfully!")
            }
            else {
                RappleActivityIndicatorView.stopAnimation()
                ProgressHUD.showSuccess("Your Data is updated Successfully!")
            }
        }
        
    }
    
    // MARK:- TODO:- This Method For Upload Image to FireStorage.
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
        let imagepath = "\(SS)\(imagename).jpg"
        // Create storage reference
        let mainReference = StorageRef.child(imagepath)
        
        // Create file metadata including the content type
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        // upload file and metadata
        mainReference.putData(data, metadata: metadata)
        
        return imagepath
    }
    
    // MARK:- TODO:- This Method For Download Image from FireStorage and show it into imageView.
    public static func DownloadImage (ReferenceURL:String,ImageURL:String,ImageView:UIImageView) {
        
        let StorageRef = Storage.storage().reference(forURL: ReferenceURL)
        let islandRef = StorageRef.child(ImageURL)
        
        islandRef.getData(maxSize: 8*1024*1024) { (data, error) in
            if let error = error {
                print(error)
            } else {
                // print Image From Data.
                ImageView.image = UIImage(data: data!)
            }
        }
    }
}
