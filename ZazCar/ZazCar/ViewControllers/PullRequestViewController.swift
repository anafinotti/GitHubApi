//
//  PullRequestViewController.swift
//  ZazCar
//
//  Created by Ana Finotti on 4/3/16.
//  Copyright © 2016 Finotti. All rights reserved.
//

import UIKit

class PullRequestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet var tableView: UITableView!
    
    var repositorieItem = Item()
    var page: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        tableViewConfiguration()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableViewConfiguration() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.registerNib(UINib(nibName: "PullRequestCell", bundle: nil), forCellReuseIdentifier: "PullRequestCell")
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        tableView.allowsSelection = true
        tableView.separatorStyle = .None
    }
    
    func setupNavigationBar () {
        self.title = self.repositorieItem.name
        self.navigationController?.navigationBar.barStyle = .Black
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    
    // MARK: - TableView delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: PullRequestCell = (tableView.dequeueReusableCellWithIdentifier("PullRequestCell") as? PullRequestCell)!
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 118
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

}
