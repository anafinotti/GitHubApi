//
//  PullRequestObject.swift
//  ZazCar
//
//  Created by Ana Finotti on 4/10/16.
//  Copyright © 2016 Finotti. All rights reserved.
//

import UIKit
import ObjectMapper

public class PullRequestObject: Mappable {
    
    var id: Int?
    var title: String?
    var body: String?
    var user: User?
    
    
    public required init?(_ map: Map) {
        
    }
    
    public init() {
        //
    }
    
    // Mappable
    public func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        body <- map["body"]
        user <- map["user"]
    }
}
