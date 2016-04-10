//
//  User.swift
//  ZazCar
//
//  Created by Ana Finotti on 4/10/16.
//  Copyright © 2016 Finotti. All rights reserved.
//

import UIKit
import ObjectMapper

public class User: Mappable {
    var id: Int?
    var login: String?
    var avatarUrl: String?
    
    public required init?(_ map: Map) {
        
    }
    
    public init() {
        //
    }
    
    // Mappable
    public func mapping(map: Map) {
        id        <- map["id"]
        login <- map["login"]
        avatarUrl <- map["avatar_url"]
    }
}
