//
//  HomeTVC.swift
//  NYRSFeed
//
//  Created by Mohamed Ismail on 11/12/18.
//  Copyright © 2018 elzokla. All rights reserved.
//

import UIKit

class HomeTVC: UITableViewCell {
    
    @IBOutlet weak var abstractLabel: UILabel?
    @IBOutlet weak var publishDateLabel: UILabel?
    @IBOutlet weak var byLineLabel: UILabel?
    @IBOutlet weak var sourceLabel: UILabel?
    
    var article:Article?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
   
    
    func loadArticle(article:Article){
        self.article = article
        abstractLabel?.text = article.abstract
        byLineLabel?.text = article.byline
        sourceLabel?.text = article.source
        publishDateLabel?.text = article.publishedDateString
        selectionStyle = .none
    }

}
