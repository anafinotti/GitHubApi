//
//  GitHubService.swift
//  ZazCar
//
//  Created by Ana Finotti on 4/3/16.
//  Copyright © 2016 Finotti. All rights reserved.
//

import UIKit
import AFNetworking
import Alamofire
import ObjectMapper

class GitHubService: NSObject {
    
    func getRepositoriesWithLanguage(language: String, page: NSNumber, success: ((itemsArray: NSURLSessionDataTask) -> Void)?, failure: ((NSError?) -> Void)?) {

        var url: String = Utils.getConfigurationValueForKey("serverAddress")
        url = "\(url)/search/repositories"

        let parameters: [String: AnyObject] = ["q": "language:" + language, "sort": "stars", "page": page]

        Alamofire.request(.GET, url, parameters: parameters).responseJSON { response in
            
            let repositorie = Mapper<RepositorieObject>().map(response.result.value)
            
            print(repositorie)
//            if let valueDictionary: [String: AnyObject] = response.result.value as? [String : AnyObject] {
//                print(response.result.value)
//                if let itemsArray: [[String: AnyObject]] = valueDictionary["items"] as? [[String: AnyObject]] {
//                    if let totalRepositoriesCountNumber = valueDictionary["total_count"] as? NSNumber {
//                        if let successBlock = success {
//                            successBlock(itemsArray: itemsArray, totalRepositoriesCount: totalRepositoriesCountNumber.integerValue)
//                        }
//                    }
//                }
//                else if let failureBlock = failure {
//                    failureBlock(nil)
//                }
//            }
//            failure {
//                failureBlock(nil)
//            }
        }
//        let manager = AFHTTPSessionManager(baseURL: NSURL(string: url))
//        manager.requestSerializer = AFJSONRequestSerializer()
//        manager.responseSerializer = AFJSONResponseSerializer()
//        
//        manager.GET(url, parameters: parameters, progress: { (let progress: NSProgress) in
//            ///
//            }, success: { (let urlSessionDataTask: NSURLSessionDataTask, response) in
//                //
//                
//                print(response)
//        }) { (let urlSessionDataTask: NSURLSessionDataTask?, let error: NSError) in
//                ///
//        }
    }


    
    
//        
//        NSURL *URL = [NSURL URLWithString:@"http://example.com/resources/123.json"];
//        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//        [manager GET:URL.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
//        } failure:^(NSURLSessionTask *operation, NSError *error) {
//        NSLog(@"Error: %@", error);
//        }];

}
