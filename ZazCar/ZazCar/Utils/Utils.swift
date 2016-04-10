//
//  Utils.swift
//  ZazCar
//
//  Created by Ana Finotti on 4/3/16.
//  Copyright © 2016 Finotti. All rights reserved.
//

import UIKit

class Utils: NSObject {
    
    class func getConfigurationValueForKey(key: String) -> String {
        let path = NSBundle.mainBundle().pathForResource("Configuration", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        
        let value = (dict?.objectForKey(key))
        
        return value as! String
    }
}
