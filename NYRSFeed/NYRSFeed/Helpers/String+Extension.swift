//
//  String+Extension.swift
//  NYRSFeed
//
//  Created by Mohamed Ismail on 11/12/18.
//  Copyright © 2018 elzokla. All rights reserved.
//

import Foundation
extension String {
    func url()->URL?{
        return URL.init(string: encodeURLStringUTF8(self)!)
    }
    func encodeURLStringUTF8(_ url: String?) -> String? {
        var url = url
        let allowedCharacters = CharacterSet.urlFragmentAllowed
        url = url?.addingPercentEncoding(withAllowedCharacters: allowedCharacters)
        return url
    }
}
