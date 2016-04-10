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
    override func viewDidLoad() {
        super.viewDidLoad()
        getRepositories()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableViewConfiguration() {
        tableView.dataSource = self
        tableView.delegate = self
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "RepositorieCell")
        
        tableView.allowsSelection = true
        tableView.separatorStyle = .None
        
        tableView.selectRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: false, scrollPosition: .Middle)
        
    }
    
    
    func setupViewConfiguration() {
    }
    
    func getRepositories() {
        let service = GitHubService()
        
        service.getRepositoriesWithLanguage("Java", page: 1, success: { (itemsArray) in
            //
            print(itemsArray)
            }) { (error) in
                print("erro")
        }
        
//        service.getRepositoriesWithLanguage("Java", page: 1, success: { (itemsArray, totalRepositoriesCount) in
//            let repositorie = Mapper<RepositorieObject>().map(JSONString)
//            }) { (error) in
//                //
//        }
    }
    
    
    // MARK: - TableView delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: RepositorieCell = (tableView.dequeueReusableCellWithIdentifier("RepositorieCell") as? RepositorieCell)!
        
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
        return 45
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

}

