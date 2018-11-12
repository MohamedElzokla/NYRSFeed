//
//  SideMenuTVC.swift
//  NYRSFeed
//
//  Created by Mohamed Ismail on 11/12/18.
//  Copyright © 2018 elzokla. All rights reserved.
//

import UIKit

class SideMenuTVC: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func loadCell(data:JSON){
        if let imageName = data["image"] as? String {
            imageView?.image = UIImage(named: imageName)
        }
        if let title = data["title"] as? String {
            textLabel?.text = title
        }
    }

}
