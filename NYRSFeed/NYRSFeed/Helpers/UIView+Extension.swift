//
//  UIView+Extension.swift
//  NYRSFeed
//
//  Created by Mohamed Ismail on 11/11/18.
//  Copyright © 2018 elzokla. All rights reserved.
//

import UIKit


extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            let color = UIColor(cgColor: layer.borderColor!)
            return color
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = CGSize(width: 0, height: 2)
            layer.shadowOpacity = 0.4
            layer.shadowRadius = shadowRadius
        }
    }
    
    
}


extension UIViewController {
    static func storyboardViewController(storyBoardName:String ,identifier:String) -> UIViewController? {
        let storyboard = UIStoryboard(name: storyBoardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }
    
    static func storyboardNavigationController(storyBoardName:String,identifier:String) -> UINavigationController {
        let storyboard = UIStoryboard(name: storyBoardName, bundle: nil)
        
        guard let nc = storyboard.instantiateViewController(withIdentifier: identifier) as? UINavigationController else {
            fatalError("Could not instantiate initial storyboard with name: \(storyBoardName)")
        }
        return nc
    }

}


