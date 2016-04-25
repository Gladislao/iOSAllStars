//
//  UserService.swift
//  AllStars
//
//  Created by Rodrigo Gonzalez on 4/11/16.
//  Copyright © 2016 Belatrix. All rights reserved.
//

import Foundation

typealias UserListServiceResponse = (Array<User>?, NSError?) -> Void
typealias UserCategoriesList = (categories: [Category]?, error: NSError?) -> Void

class UserService: BaseService {

    private static let employeeList = "/api/employee/list/"
    
    class func employeeList(onCompletition : UserListServiceResponse) {
        
        self.makeRequest(employeeList, method: .GET, parameters: nil) { (json : AnyObject?, error : NSError?) -> Void in
            print(json)
            if error != nil {
                onCompletition(nil, error)
            } else {
                guard let jsonUser = json as? Array<NSDictionary> else {
                    return
                }
                onCompletition(User.parseUsers(jsonUser), nil)
            }
        }
        
    }
    
    class func getEmployeeCategoryList(employeePk: UInt, onCompletion: UserCategoriesList) {
        let fullPath = BaseService.subtituteKeyInMethod(Constants.Methods.employeeCategoryList, pathSegment: (key: Constants.PathSegmentKeys.employeeId, value: String(employeePk)))
        BaseService.makeRequest(fullPath, method: .GET, parameters: nil) { (json: AnyObject?, error: NSError?) in
            if error == nil {
                let employeeCategories = Category.parseCategories(json as! [[String: AnyObject]])
                onCompletion(employeeCategories, nil)
            } else {
                onCompletion(nil, error)
            }
        }
    }

}
