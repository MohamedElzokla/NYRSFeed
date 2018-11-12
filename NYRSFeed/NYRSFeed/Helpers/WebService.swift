//
//  AppConstants.swift
//  NYRSFeed
//
//  Created by Mohamed Ismail on 11/12/18.
//  Copyright © 2018 elzokla. All rights reserved.
//

import Foundation
import Alamofire

public typealias JSON = [String: Any]
public typealias HTTPHeaders = [String: String]

class WebError:NSObject {
    
    var isSuccess = false
    var status : Enums.WebService.ErrorCode?
    var message :String?
    
    init(json:JSON?) {
        super.init()
        if let code = json?["status"] as? String{
            isSuccess = (code == Enums.WebService.ErrorCode.ok.rawValue)
            message = (json?["errors"] as? [String])?.first
            status = Enums.WebService.ErrorCode(rawValue: code)
        }else {
            isSuccess = false
            message = ""
            status = Enums.WebService.ErrorCode.other
        }
    }
}


class WebService {
    static let apiKey = "b9013cf58a364220b32265754781e3ae"
    static let baseUrl = "http://api.nytimes.com/svc"
    
    class func getMostViewedArticles(section:String = "all-sections",period:String = "7",onComplete:@escaping (ArticleResponse?)->()){
        WebService.sendGetBaseRequest(endPoint: .mostViewed, params: [section,period]) { (result) in
            onComplete(ArticleResponse(JSON: result!))
        }
    }
    
    
    /// Sends get request to server to certain endpoint
    ///
    /// - Parameters:
    ///   - endPoint: targeted endpoint
    ///   - params: array of strings that will be added to the path
    ///   - onComplete: it returns the result as json. If request faild then an error will be returned
    private class func sendGetBaseRequest(endPoint:Enums.WebService.EndPoint,params:[String],onComplete:@escaping (JSON?)->()) {
        let url = WebService.baseUrl + endPoint.rawValue + params.joined(separator: "/") + ".json?api-key=" + WebService.apiKey
        let session = URLSession.init(configuration: URLSessionConfiguration.default)
        session.dataTask(with: URL(string: url)!) { (data, response, error) in
                do {
                    guard let data = data else {
                        throw JSONError.NoData
                    }
                    guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? JSON else {
                        throw JSONError.ConversionFailed
                    }
                    onComplete(json)
                } catch let error as JSONError {
                    onComplete(["errors":["server error",error.rawValue]])
                }   catch let error as NSError {
                    onComplete(["errors":["server error",error.debugDescription]])
            }
            
        }.resume()

    }
}

enum JSONError: String, Error {
    case NoData = "ERROR: no data"
    case ConversionFailed = "ERROR: conversion from JSON failed"
}
