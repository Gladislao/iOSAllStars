//
//  RecommendService.swift
//  AllStars
//
//  Created by Gianfranco Yosida on 4/21/16.
//  Copyright © 2016 Belatrix. All rights reserved.
//

import Foundation

typealias GiveStar = (star: Star?, error: NSError?) -> Void

class StarService {
    
    class func giveStar(fromId: UInt, toId: UInt, subcategory: Category, comment: String?, onCompletion: GiveStar) {
        let segments: [(key: String, value: String)] = [
            (Constants.PathSegmentKeys.fromEmployee, String(fromId)),
            (Constants.PathSegmentKeys.toEmployee, String(toId))
        ]
        let url = BaseService.subtituteKeyInMethod(Constants.Methods.recommend, pathSegments: segments)
        var params: [String: AnyObject!] = [
            Constants.JSONBodyKeys.category : subcategory.parentCategoryPk,
            Constants.JSONBodyKeys.subcategory : subcategory.pk
        ]
        if let comment = comment {
            params[Constants.JSONBodyKeys.text] = comment
        }
        BaseService.makeRequest(url, method: .POST, parameters: params) { (json: AnyObject?, error: NSError?) in
            if error == nil {
                let star = Star.parseStar(json as! [String: AnyObject])
                onCompletion(star: star, error: nil)
            } else {
                onCompletion(star: nil, error: error)
            }
        }
    }
    
}
