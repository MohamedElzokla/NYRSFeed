//
//  HomeDetailsVC.swift
//  NYRSFeed
//
//  Created by Mohamed Ismail on 11/12/18.
//  Copyright © 2018 elzokla. All rights reserved.
//

import UIKit
import SDWebImage
class HomeDetailsVC: BaseVC {

    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var abstractLabel: UILabel?
    @IBOutlet weak var captionLabel: UILabel?
    @IBOutlet weak var imageView: UIImageView?
    
    var articleInfo : Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel?.text = articleInfo?.title
        abstractLabel?.text = articleInfo?.abstract
        captionLabel?.text = articleInfo?.media?.first?.caption
        
        let metadata = articleInfo?.media?.first?.meta?.filter({ (meta) -> Bool in
            return !(meta.url?.isEmpty ?? false)
        }).first
        imageView?.sd_setImage(with: metadata?.url?.url(), placeholderImage: #imageLiteral(resourceName: "image_placeholder"), options: SDWebImageOptions.highPriority, completed: nil)

    }
}
