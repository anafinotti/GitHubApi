//
//  RepositorieViewController.swift
//  ZazCar
//
//  Created by Ana Finotti on 4/3/16.
//  Copyright © 2016 Finotti. All rights reserved.
//

import UIKit
import ObjectMapper
import UIScrollView_InfiniteScroll
import KRProgressHUD

class RepositorieViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var repositorie = RepositorieObject()
    var language = String()
    var page: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        language = getLanguage()
        
        setupNavigationBar()
        
        getRepositories()
        
        tableViewConfiguration()
        addInfiniteScrollView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addInfiniteScrollView() {
        tableView.infiniteScrollIndicatorStyle = .White
        
        tableView.addInfiniteScrollWithHandler { (scrollView) -> Void in
            let tableView = scrollView as! UITableView
            
            self.page += 1
            
            self.getRepositories()
            
            tableView.finishInfiniteScroll()
        }
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
    }
    
    func setupNavigationBar () {
        self.title = "Git Hub JavaPop"
        self.navigationController?.navigationBar.barStyle = .Black
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    func getRepositories() {
        let service = GitHubService()
        
        KRProgressHUD.show(message: "Loading...")
        service.getRepositories(language, page: self.page, success: { (repositorieObject) in

            KRProgressHUD.dismiss()
            if(self.repositorie.items == nil) {
                self.repositorie = repositorieObject
            }
            else {
                var items: [Item]
                
                items = repositorieObject.items!
                self.repositorie.items?.appendContentsOf(items)
            }
            
            self.tableView.reloadData()
            
            }) { (error) in
                KRProgressHUD.dismiss()
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
        
        let cell = tableView.dequeueReusableCellWithIdentifier("RepositorieCell", forIndexPath: indexPath) as! RepositorieCell

        cell.cellConfiguration(repositorie.items![indexPath.row])
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("did select row: \(indexPath.row)")
        
        let pullRequestViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PullRequestViewController") as! PullRequestViewController
        
        pullRequestViewController.repositorieItem = self.repositorie.items![indexPath.row]
        
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        self.presentViewController(pullRequestViewController, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 118
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

}

