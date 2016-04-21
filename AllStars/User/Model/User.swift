//
//  User.swift
//  AllStars
//
//  Created by Rodrigo Gonzalez on 4/11/16.
//  Copyright © 2016 Belatrix. All rights reserved.
//

import UIKit

class User {
    var pk : UInt?
    var username : String?
    var email : String?
    var firstName : String?
    var lastName : String?
    var level : UInt?
    var avatar : String?
    var score : UInt?
    var role : String?
    var skypeId : String?
    var lastMonthScore : String?
    var currentMonthScore : String?
    var categories : Array<AnyObject>?
    var isActive : Bool = true
    var lastLogin : String?
    
    convenience init(pk : UInt?, username : String?, email : String?, firstName : String?, lastName : String?, level : UInt, avatar : String?, score : UInt?, role : String?, skypeId : String?, lastMonthScore : String?, currentMonthScore : String?, categories : Array<AnyObject>?, isActive : Bool, lastLogin : String?) {
        self.init()
        self.pk = pk
        self.username = username
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.level = level
        self.avatar = avatar
        self.score = score
        self.role = role
        self.skypeId = skypeId
        self.lastMonthScore = lastMonthScore
        self.currentMonthScore = currentMonthScore
        self.categories = categories
        self.isActive = isActive
        self.lastLogin = lastLogin
    }
    
    func getFullName() -> String {
        var fullName = ""
        if let firstName = firstName {
            fullName += firstName + " "
        }
        if let lastName = lastName {
            fullName += lastName
        }
        return fullName
    }
}

//MARK: JSON Parsing
extension User {
    struct Keys {
        static let pk           = "pk"
        static let username     = "username"
        static let email        = "email"
        static let firstName    = "first_name"
        static let lastName     = "last_name"
        static let level        = "level"
        static let avatar       = "avatar"
        static let score        = "score"
        static let role = "role"
        static let skypeId = "skype_id"
        static let lastMonthScore = "last_month_score"
        static let currentMonthScore = "current_month_score"
        static let categories = "categories"
        static let isActive = "is_active"
        static let lastLogin = "last_login"
    }
    
    class func parseJSON(json : NSDictionary) -> User {
        let user = User()
        user.pk = json[Keys.pk] as? UInt
        user.username = json[Keys.username] as? String
        user.email = json[Keys.email] as? String
        user.firstName = json[Keys.firstName] as? String
        user.lastName = json[Keys.lastName] as? String
        user.level = json[Keys.level] as? UInt
        user.avatar = json[Keys.avatar] as? String
        user.score = json[Keys.score] as? UInt
        user.role = json[Keys.role] as? String
        user.skypeId = json[Keys.skypeId] as? String
        user.lastMonthScore = json[Keys.lastMonthScore] as? String
        user.currentMonthScore = json[Keys.currentMonthScore] as? String
       
        if let categories = json[Keys.categories] as? Array<AnyObject> {
            //TODO: parse categories
            print(categories)
        }
        if let isActive = json[Keys.isActive] as? String {
                user.isActive = isActive == "true"
        }
        
        user.lastLogin = json[Keys.lastLogin] as? String

        return user
    }
    
    class func parseUsers(json : Array<NSDictionary>) -> Array<User>? {
        var users = Array<User>()
        for userJson in json {
            users.append(User.parseJSON(userJson))
        }
        
        return users
    }
    
}
