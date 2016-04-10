//
//  Owner.swift
//  ZazCar
//
//  Created by Ana Finotti on 4/10/16.
//  Copyright © 2016 Finotti. All rights reserved.
//

import UIKit
import ObjectMapper

class Owner: Mappable {
    
    var id: Int?
    var ownerIdentifier: Double?
    var organizationsUrl: String?
    var receivedEventsUrl: String?
    var followingUrl: String?
    var login: String?
    var subscriptionsUrl: String?
    var avatarUrl: String?
    var url: String?
    var type: String?
    var reposUrl: String?
    var htmlUrl: String?
    var eventsUrl: String?
    var siteAdmin: Bool?
    var starredUrl: String?
    var gistsUrl: String?
    var gravatarId: String?
    var followersUrl: String?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        id        <- map["id"]
        login      <- map["login"]
        avatarUrl        <- map["avatar_url"]
        gravatarId      <- map["gravatar_id"]
        htmlUrl        <- map["html_url"]
        followersUrl <- map["followers_url"]
        followingUrl        <- map["following_url"]
        gistsUrl      <- map["gists_url"]
        starredUrl        <- map["starred_url"]
        subscriptionsUrl      <- map["subscriptions_url"]
        organizationsUrl        <- map["organizations_url"]
        reposUrl      <- map["repos_url"]
        eventsUrl      <- map["events_url"]
        receivedEventsUrl        <- map["received_events_url"]
        type      <- map["type"]
        siteAdmin <- map["site_admin"]
    }
}
