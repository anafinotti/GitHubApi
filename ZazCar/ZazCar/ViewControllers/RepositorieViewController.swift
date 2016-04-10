//
//  RepositorieViewController.swift
//  ZazCar
//
//  Created by Ana Finotti on 4/3/16.
//  Copyright © 2016 Finotti. All rights reserved.
//

import UIKit
import ObjectMapper

class RepositorieViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var repositorie = RepositorieObject()
    var language = String()
    var page: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        language = getLanguage()
        
        getRepositories()
        
        tableViewConfiguration()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func getLanguage() -> String {
        return Utils.getConfigurationValueForKey("language")
    }
    
    func tableViewConfiguration() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.registerNib(UINib(nibName: "RepositorieCell", bundle: nil), forCellReuseIdentifier: "RepositorieCell")

        
        self.view.backgroundColor = UIColor.whiteColor()
        
        tableView.allowsSelection = true
        tableView.separatorStyle = .None
        
       // tableView.selectRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: false, scrollPosition: .Middle)
        
    }
    
    
    func setupViewConfiguration() {
    }
    
    func getRepositories() {
        let service = GitHubService()
        
        service.getRepositories(language, page: self.page, success: { (repositorieObject) in
            
            self.repositorie = repositorieObject
            
            self.tableView.reloadData()
            
            }) { (error) in
                print(error)
        }
    }
    
    
    // MARK: - TableView delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(repositorie.items != nil) {
            return (repositorie.items?.count)!
        }
        return 0
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        var cell: RepositorieCell! = tableView.dequeueReusableCellWithIdentifier("RepositorieCell") as? RepositorieCell
//        
//        if cell == nil {
//            tableView.registerNib(UINib(nibName: "RepositorieCell", bundle: nil), forCellReuseIdentifier: "RepositorieCell")
//            cell = tableView.dequeueReusableCellWithIdentifier("RepositorieCell") as? RepositorieCell
//        }
//        

        let cell = tableView.dequeueReusableCellWithIdentifier("RepositorieCell", forIndexPath: indexPath) as! RepositorieCell

        cell.cellConfiguration(repositorie.items![indexPath.row])
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("did select row: \(indexPath.row)")
//        
//        
//        if (indexPath.row == selectedCell) {
//            return
//        }
//        
//        selectedCell = indexPath.row
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 118
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

}

