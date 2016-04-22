//
//  RecommendService.swift
//  AllStars
//
//  Created by Gianfranco Yosida on 4/21/16.
//  Copyright © 2016 Belatrix. All rights reserved.
//

import Foundation

class RecommendService: BaseService {
    
    
    class func recommend(fromId: UInt, toId: UInt, subcategory: Category, comment: String?, onCompletion: ServiceResponse) {
        let segments: [(key: String, value: String)] = [
            (Constants.PathSegmentKeys.fromEmployee, String(fromId)),
            (Constants.PathSegmentKeys.toEmployee, String(toId))
        ]
        let url = subtituteKeyInMethod(Constants.Methods.recommend, pathSegments: segments)
        var params: [String: AnyObject!] = [
            Constants.JSONBodyKeys.category : subcategory.parentCategoryPk,
            Constants.JSONBodyKeys.subcategory : subcategory.pk
        ]
        if let comment = comment {
            params[Constants.JSONBodyKeys.text] = comment
        }
        makeRequest(url, method: .POST, parameters: params) { (json: AnyObject?, error: NSError?) in
            if error == nil {
                onCompletion(json, nil)
            } else {
                onCompletion(nil, error)
            }
        }
    }
    
}
