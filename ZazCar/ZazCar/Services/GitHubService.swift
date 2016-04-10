//
//  GitHubService.swift
//  ZazCar
//
//  Created by Ana Finotti on 4/3/16.
//  Copyright © 2016 Finotti. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class GitHubService: NSObject {
    
    func getRepositories(language: String, page: NSNumber, success: ((repositorieObject: RepositorieObject) -> Void)?, failure: ((NSError?) -> Void)?) {

        var url: String = Utils.getConfigurationValueForKey("serverAddress")
        url = "\(url)/search/repositories"

        let parameters: [String: AnyObject] = ["q": "language:" + language, "sort": "stars", "page": page]

        Alamofire.request(.GET, url, parameters: parameters).responseJSON { response in
            
            let repositorie = Mapper<RepositorieObject>().map(response.result.value)
            
            success!(repositorieObject: repositorie!)
        }
    }
    
    func getPullRequests(username: String, repository: String, page: NSNumber, success: ((pullRequestObject: Array<PullRequestObject>) -> Void)?, failure: ((NSError?) -> Void)?) {
        
        var url: String = Utils.getConfigurationValueForKey("serverAddress")
        url = "\(url)/repos/\(username)/\(repository)/pulls"
        
        Alamofire.request(.GET, url, parameters: ["page": page]).responseJSON { response in
            print(response.response?.allHeaderFields)
            
            let pullRequest: Array<PullRequestObject> = Mapper<PullRequestObject>().mapArray(response.result.value)!
            
            success!(pullRequestObject: pullRequest)
        }
    }
}
