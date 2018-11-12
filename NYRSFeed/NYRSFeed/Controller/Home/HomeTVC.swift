//
//  HomeTVC.swift
//  NYRSFeed
//
//  Created by Mohamed Ismail on 11/12/18.
//  Copyright © 2018 elzokla. All rights reserved.
//

import UIKit

class HomeTVC: UITableViewCell {
    var article:Article?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func loadArticle(article:Article){
        self.article = article
        
    }

}
