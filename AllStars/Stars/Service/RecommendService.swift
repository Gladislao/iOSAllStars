//
//  RecommendService.swift
//  AllStars
//
//  Created by Gianfranco Yosida on 4/21/16.
//  Copyright © 2016 Belatrix. All rights reserved.
//

import Foundation

class RecommendService: BaseService {
    
    private static let recomendURL = "/api/star/{from_employee_id}/give/star/to/{to_employee_id}"
    
    class func recommend(fromId: UInt, toId: UInt, onCompletion: ServiceResponse) {
        
    }
    
}
