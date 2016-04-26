//
//  Star.swift
//  AllStars
//
//  Created by Gianfranco Yosida on 4/26/16.
//  Copyright © 2016 Belatrix. All rights reserved.
//

import Foundation

class Star {
    
    var pk: UInt?
    var date: String?
    var text: String?
    var fromUserPk: UInt?
    var toUserPk: UInt?
    var categoryPk: UInt?
    var subcategoryPk: UInt?
    
}

extension Star {
    
    struct Keys {
        static let pk = "pk"
        static let date = "date"
        static let text = "text"
        static let fromUser = "from_user"
        static let toUser = "to_user"
        static let category = "category"
        static let subcategory = "subcategory"
    }
    
    class func parseStar(json: [String: AnyObject]) -> Star {
        let star = Star()
        star.pk = json[Keys.pk] as? UInt
        star.date = json[Keys.date] as? String
        star.text = json[Keys.text] as? String
        star.fromUserPk = json[Keys.fromUser] as? UInt
        star.toUserPk = json[Keys.toUser] as? UInt
        star.categoryPk = json[Keys.category] as? UInt
        star.subcategoryPk = json[Keys.subcategory] as? UInt
        return star
    }
}
