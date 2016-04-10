//
//  PullRequestViewController.swift
//  ZazCar
//
//  Created by Ana Finotti on 4/3/16.
//  Copyright © 2016 Finotti. All rights reserved.
//

import UIKit
import KRProgressHUD

class PullRequestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet var tableView: UITableView!
    
    var repositorieItem = Item()
    var page: Int = 1
    
    var pullRequest = [PullRequestObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        tableViewConfiguration()
        
        getPullRequests()
        
        addInfiniteScrollView()
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
    
    
    func addInfiniteScrollView() {
        tableView.infiniteScrollIndicatorStyle = .White
        
        tableView.addInfiniteScrollWithHandler { (scrollView) -> Void in
            let tableView = scrollView as! UITableView
            
            self.page += 1
            
            self.getPullRequests()
            
            tableView.finishInfiniteScroll()
        }
    }
    
    func setupNavigationBar () {
        self.title = self.repositorieItem.name
        self.navigationController?.navigationBar.barStyle = .Black
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationItem.leftBarButtonItem = nil
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.Plain, target:nil, action:nil)

       // self.setNeedsStatusBarAppearanceUpdate()
    }
    
    func getPullRequests() {
        let service = GitHubService()
        
        KRProgressHUD.show(message: "Loading...")
        
        
        service.getPullRequests((self.repositorieItem.owner?.login)!, repository: self.repositorieItem.name!, page: self.page, success: { (pullRequestObject) in
            
            KRProgressHUD.dismiss()
            
            if(self.pullRequest.count == 0) {
                self.pullRequest = pullRequestObject
            }
            else {
                self.pullRequest.appendContentsOf(pullRequestObject)
            }
            
            self.tableView.reloadData()
            
            }) { (error) in
                KRProgressHUD.dismiss()
                print(error)
        }
    }
    
    // MARK: - TableView delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if(pullRequest.count > 0) {
            return (pullRequest.count)
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PullRequestCell", forIndexPath: indexPath) as! PullRequestCell
        
        cell.cellConfiguration(pullRequest[indexPath.row])
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let item = self.pullRequest[indexPath.row]
        
        UIApplication.sharedApplication().openURL(NSURL(string: item.htmlUrl!)!)
        
        if let selectedIndexPath = self.tableView?.indexPathForSelectedRow {
            self.tableView?.deselectRowAtIndexPath(selectedIndexPath, animated: true)
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 118
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

}
