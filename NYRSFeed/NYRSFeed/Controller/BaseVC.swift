//
//  BaseVC.swift
//  NYRSFeed
//
//  Created by Mohamed Ismail on 11/11/18.
//  Copyright © 2018 elzokla. All rights reserved.
//

import UIKit
import MMDrawerController
import SVProgressHUD

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    //MARK:- Loading indicators
    func showLoadingIndicator (message:String = ""){
        if message == "" {
            SVProgressHUD.show()
        }else{
            SVProgressHUD.show(withStatus: message)
        }
    }
    func hideLoadingIndicator (){
        SVProgressHUD.dismiss()
    }
    //MARK:- Alert
    func showAlert(title:String = "Message",message:String){
        let alertController = UIAlertController.init(title: title, message: message
            , preferredStyle: .alert)
        alertController.addAction(UIAlertAction.init(title: "Close", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    //MARK:- Side menu button
    
    func addSideMenuBtn(){
        let leftBtn = MMDrawerBarButtonItem.init(target: self, action: #selector(sideMenuBtnPressed))
        leftBtn?.tintColor = .white
        navigationItem.leftBarButtonItem = leftBtn
    }
    
    @objc func sideMenuBtnPressed(){
        mm_drawerController.toggle(MMDrawerSide.left, animated: true, completion: nil)
    }
  
    

}
