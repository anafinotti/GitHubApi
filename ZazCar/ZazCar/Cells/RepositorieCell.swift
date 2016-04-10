//
//  RepositorieCell.swift
//  ZazCar
//
//  Created by Ana Finotti on 4/3/16.
//  Copyright © 2016 Finotti. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import UIColor_Hex_Swift

class RepositorieCell: UITableViewCell {

    @IBOutlet var repositorieNameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var forkLabel: UILabel!
    @IBOutlet var starLabel: UILabel!
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
        repositorieNameLabel.adjustsFontSizeToFitWidth = true
        usernameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.adjustsFontSizeToFitWidth = true
        
        repositorieNameLabel.textColor = UIColor(rgba:"#2C67F2")
        usernameLabel.textColor = UIColor(rgba:"#2C67F2")
        forkLabel.textColor = UIColor(rgba: "#E0AA49")
        starLabel.textColor = UIColor(rgba: "#E0AA49")
    }
    
    func cellConfiguration(repositorieItem: Item) {
        repositorieNameLabel.text = repositorieItem.name
        descriptionLabel.text = repositorieItem.description
        forkLabel.text = String(format:"%.0f", repositorieItem.forks!)
        starLabel.text = String(format:"%.0f", repositorieItem.stargazersCount!)
        usernameLabel.text = repositorieItem.owner?.login
        nameLabel.text = repositorieItem.full_name
        
        Alamofire.request(.GET, (repositorieItem.owner?.avatarUrl!)!)
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
