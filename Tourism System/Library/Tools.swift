//
//  Tools.swift
//  Tourism System
//
//  Created by Mohamed Ali on 6/7/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit
import MarqueeLabel

class Tools {
    
    public static func SetLeftPadding(textBox:UITextField , padding:Double) {
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: padding, height: 2.0))
        textBox.leftView = leftView
        textBox.leftViewMode = .always
    }
    
    public static func setMarqueeOption(MyLabel:MarqueeLabel){
        MyLabel.type = .continuous
        MyLabel.animationCurve = .easeInOut
        MyLabel.speed = .duration(5)
        MyLabel.leadingBuffer = 30.0
        MyLabel.trailingBuffer = 20.0
        MyLabel.restartLabel()
    }
    
    public static func createAlert (Title:String , Mess:String , ob:UIViewController)
    {
        let alert = UIAlertController(title: Title , message:Mess
            , preferredStyle:UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title:"OK",style:UIAlertAction.Style.default,handler: {(action) in alert.dismiss(animated: true, completion: nil)}))
        ob.present(alert,animated:true,completion: nil)
    }
    
    public static func makeNiceBackTransition(ob:UIViewController) {
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        ob.view.window!.layer.add(transition, forKey: nil)
        ob.dismiss(animated: false, completion: nil)
    }
    
    public static func MakeTransion (StoryName:String,ViewName:String,ob:UIViewController) {
        let story : UIStoryboard = UIStoryboard(name: StoryName, bundle: nil)
        let result = story.instantiateViewController(withIdentifier: ViewName)
        result.modalPresentationStyle = .fullScreen
        ob.present(result, animated: true, completion: nil)
    }
}
