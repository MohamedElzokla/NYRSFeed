//
//  LaunchVC.swift
//  NYRSFeed
//
//  Created by Mohamed Ismail on 11/11/18.
//  Copyright © 2018 elzokla. All rights reserved.
//

import UIKit
import MMDrawerController

class LaunchVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        constructDrawer()
    }
    
    func constructDrawer(){
        let centerVC =  UIViewController.storyboardNavigationController(storyBoardName: Enums.UIViewController.Storyboard.main.rawValue, identifier: "HomeNVC")
        let sideVC =  UIViewController.storyboardViewController(storyBoardName: Enums.UIViewController.Storyboard.main.rawValue, identifier: "SideMenuVC")
        let drawer = MMDrawerController.init(center: centerVC, leftDrawerViewController: sideVC)
        
        drawer?.shouldStretchDrawer = true
        drawer?.closeDrawerGestureModeMask = .all
        drawer?.openDrawerGestureModeMask = .all
        
        AppDelegate.getIntance().window?.rootViewController = drawer
        AppDelegate.getIntance().window?.makeKeyAndVisible()

    }
    
 

}
