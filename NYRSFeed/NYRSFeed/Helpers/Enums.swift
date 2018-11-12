//
//  Enums.swift
//  NYRSFeed
//
//  Created by Mohamed Ismail on 11/12/18.
//  Copyright © 2018 elzokla. All rights reserved.
//

import Foundation

struct Enums {
    struct UIViewController {
        enum Storyboard : String{
            case main = "Main"
        }
    }
    
    struct WebService {
        public enum ErrorCode : String {
            case ok = "OK"
            case error = "ERROR"
            case timeOut = "TIME_OUT"
            case other = "OTHER"
        }
        
        public enum EndPoint :String {
            case mostViewed = "/mostpopular/v2/mostviewed/"
        }
    }
    
    

}
