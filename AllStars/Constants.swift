//
//  Constants.swift
//  AllStars
//
//  Created by Gianfranco Yosida on 4/22/16.
//  Copyright © 2016 Belatrix. All rights reserved.
//

import Foundation

struct Constants {
    
    struct JSONBodyKeys {
        static let category = "category"
        static let subcategory = "subcategory"
        static let text = "text"
    }
    
    struct Methods {
        static let recommend = "/api/star/{\(PathSegmentKeys.fromEmployee)}/give/star/to/{\(PathSegmentKeys.toEmployee)}"
        static let subcategoryList = "/api/category/{\(PathSegmentKeys.categoryId)}/subcategory/list"
        static let employeeCategoryList = "/api/employee/{\(PathSegmentKeys.employeeId)}/category/list"
    }
    
    struct PathSegmentKeys {
        static let fromEmployee = "from_employee_id"
        static let toEmployee = "to_employee_id"
        static let categoryId = "category_id"
        static let employeeId = "employee_id"
    }
    
}
