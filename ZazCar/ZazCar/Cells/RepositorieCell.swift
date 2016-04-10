//
//  RepositorieCell.swift
//  ZazCar
//
//  Created by Ana Finotti on 4/3/16.
//  Copyright © 2016 Finotti. All rights reserved.
//

import UIKit

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
        
        cellConfiguration()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func cellConfiguration() {
        
    }
    
    func setupRepositorieCell() {
        
    }
    
}
