//
//  Article.swift
//  NYRSFeed
//
//  Created by Mohamed Ismail on 11/12/18.
//  Copyright © 2018 elzokla. All rights reserved.
//

import UIKit
import ObjectMapper

class Article: NSObject,Mappable {
    var url : String?
    var column : String?
    var section : String?
    var byline : String?
    var title : String?
    var publishedDateString : String? // 2018-01-23"
    var source : String?
    var abstract : String?
    var id :Int?
    var assetId :Int?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        assetId <- map["asset_id"]
        url <- map["url"]
        column <- map["column"]
        section <- map["section"]
        byline <- map["byline"]
        publishedDateString <- map["published_date"]
        source <- map["source"]
        title <- map["title"]
        abstract <- map["abstract"]

    }
    

}
