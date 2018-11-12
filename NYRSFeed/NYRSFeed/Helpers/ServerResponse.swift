//
//  ServerResponse.swift
//  NYRSFeed
//
//  Created by Mohamed Ismail on 11/12/18.
//  Copyright © 2018 elzokla. All rights reserved.
//

import UIKit
import ObjectMapper

class  ServerResponse: Mappable {
    var error : WebError?
    required public init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        error = WebError.init(json: map.JSON);
    }
    func isSuccess()->Bool{
        return (error?.isSuccess) ?? false
    }
}


class ArticleResponse : ServerResponse {
    var copyright : String?
    var numOfResults : Int?
    var articles : [Article]?
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        copyright <- map["copyright"]
        numOfResults <- map["num_results"]
        articles <- map["results"]
    }
    
}
