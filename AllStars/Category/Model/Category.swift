//
//  Category.swift
//  AllStars
//
//  Created by Gianfranco Yosida on 4/21/16.
//  Copyright © 2016 Belatrix. All rights reserved.
//

import Foundation

class Category {
    
    var pk: UInt?
    var name: String?
    var subcategories: [Category]?
    var parentCategoryPk: UInt?
    
}
