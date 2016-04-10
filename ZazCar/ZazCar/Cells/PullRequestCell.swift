//
//  PullRequestCell.swift
//  ZazCar
//
//  Created by Ana Finotti on 4/3/16.
//  Copyright © 2016 Finotti. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class PullRequestCell: UITableViewCell {

    @IBOutlet var pullRequestTitleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var usernameImage: UIImageView!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configuration()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configuration() {
        pullRequestTitleLabel.adjustsFontSizeToFitWidth = true
        descriptionLabel.adjustsFontSizeToFitWidth = true
        usernameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.adjustsFontSizeToFitWidth = true
        
        pullRequestTitleLabel.textColor = UIColor(rgba:"#2C67F2")
        usernameLabel.textColor = UIColor(rgba:"#2C67F2")
    }
    
    func cellConfiguration(pullRequestObject: PullRequestObject) {
        pullRequestTitleLabel.text = pullRequestObject.title
        descriptionLabel.text = pullRequestObject.body
        
        usernameLabel.text = pullRequestObject.user?.login
        nameLabel.text = pullRequestObject.user?.login
        
        Alamofire.request(.GET, (pullRequestObject.user?.avatarUrl!)!)
            .responseImage { response in
                debugPrint(response)
                
                let image = response.result.value
                
                if image != nil {
                    self.usernameImage.image = image
                }
                else {
                    self.usernameImage.image = UIImage(named: "user_image")
                }
        }
    }
}
