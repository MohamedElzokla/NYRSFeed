//
//  SideMenuVC.swift
//  NYRSFeed
//
//  Created by Mohamed Ismail on 11/11/18.
//  Copyright © 2018 elzokla. All rights reserved.
//

import UIKit
import MMDrawerController
class SideMenuVC: BaseVC {

    @IBOutlet weak var tableView: UITableView?
    
    var rows : [JSON] = [["title":"Home","image":"home","id":"HomeNVC"]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    func openCenterWithId(identifier:String,storyboard:String){
        if let drawer = (AppDelegate.getIntance().window?.rootViewController as? MMDrawerController) {
            drawer.setCenterView(UIViewController.storyboardNavigationController(storyBoardName: storyboard, identifier: identifier), withCloseAnimation: true, completion: nil)
            
        }
    }
}



extension SideMenuVC : UITableViewDelegate , UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? SideMenuTVC
        cell?.loadCell(data: rows[indexPath.row])
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
        let id = rows[indexPath.row]["id"] as? String
        openCenterWithId(identifier: id ?? "" , storyboard: Enums.UIViewController.Storyboard.main.rawValue)
    }
}
