//
//  CategoryService.swift
//  AllStars
//
//  Created by Gianfranco Yosida on 4/25/16.
//  Copyright © 2016 Belatrix. All rights reserved.
//

import Foundation

typealias SubcategoryList = (subcategories: [Category]?, error: NSError?) -> Void

class CategoryService {
    
    class func getSubcategoryList(categoryPk: UInt, onCompletion: SubcategoryList) {
        let fullPath = BaseService.subtituteKeyInMethod(Constants.Methods.subcategoryList, pathSegment: (key: Constants.PathSegmentKeys.categoryId, value: String(categoryPk)))
        BaseService.makeRequest(fullPath, method: .GET, parameters: nil) { (json: AnyObject?, error: NSError?) in
            if error == nil {
                let subcategories = Category.parseCategories(json as! [[String: AnyObject]])
                onCompletion(subcategories: subcategories, error: nil)
            } else {
                onCompletion(subcategories: nil, error: error)
            }
        }
        
    }
    
}
