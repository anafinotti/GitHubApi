//
//  RepositorieObject.swift
//  ZazCar
//
//  Created by Ana Finotti on 4/10/16.
//  Copyright © 2016 Finotti. All rights reserved.
//

import Foundation
import Argo
import Curry
import ObjectMapper

public class RepositorieObject : Mappable {
    
    var total_count: Int?
    var incomplete_results: Bool?
    var items: [Item]?
    
    required public init?(_ map: Map) {
        
    }
    
    // Mappable
    public func mapping(map: Map) {
        total_count        <- map["total_count"]
        incomplete_results <- map["incomplete_results"]
        items              <- map["items"]
    }
}