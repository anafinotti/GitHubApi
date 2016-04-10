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
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func tableViewConfiguration() {
        tableView.dataSource = self
        tableView.delegate = self
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "PullRequestCell")
        
        tableView.allowsSelection = false
        tableView.separatorStyle = .None
        
         tableView.selectRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: false, scrollPosition: .Middle)
        
    }
    
    
    func setupViewConfiguration() {
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
        print("did select row: \(indexPath.row)")
        
        // let selectedCell:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        //selectedCell.contentView.backgroundColor = UIColor(rgba: Utils.init().selectedMenuColor)
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
