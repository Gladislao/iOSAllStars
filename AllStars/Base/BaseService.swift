//
//  BaseService.swift
//  AllStars
//
//  Created by Rodrigo Gonzalez on 4/11/16.
//  Copyright © 2016 Belatrix. All rights reserved.
//

import UIKit
import Alamofire

typealias ServiceResponse = (AnyObject?, NSError?) -> Void

class BaseService {

    static let allStarsURL = "https://allstars-belatrix.herokuapp.com"
    
    class func makeRequest(endpoint : String?, method : Alamofire.Method, parameters : Dictionary<String,AnyObject>?, onCompletion : ServiceResponse) {

        guard let safeEndpoint = endpoint where endpoint?.characters.count > 0 else {
            return
        }
        
        let endpoint = allStarsURL + safeEndpoint
        
        Alamofire.request(method, endpoint, parameters: parameters)
            .responseJSON { response in
                if let JSON = response.result.value {
                    onCompletion(JSON , nil)
                } else {
                    onCompletion(nil, NSError(domain: "", code: 0, userInfo: nil))
                }
        }

    }
    
    class func subtituteKeyInMethod(method: String, pathSegments: [(key: String, value: String)]) -> String? {
        var methodCopy = method
        for segment in pathSegments {
            if let result = BaseService.subtituteKeyInMethod(methodCopy, pathSegment: segment) {
                methodCopy = result
            } else {
                return nil
            }
        }
        return methodCopy
    }
    
    class func subtituteKeyInMethod(method: String, pathSegment: (key: String, value: String)) -> String? {
        if method.rangeOfString("{\(pathSegment.key)}") != nil {
            return method.stringByReplacingOccurrencesOfString("{\(pathSegment.key)}", withString: pathSegment.value)
        } else {
            return nil
        }
    }
    
}
