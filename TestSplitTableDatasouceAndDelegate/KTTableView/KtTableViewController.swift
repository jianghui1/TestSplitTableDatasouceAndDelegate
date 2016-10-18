//
//  KtTableViewController.swift
//  TestSplitTableDatasouceAndDelegate
//
//  Created by ys on 16/5/25.
//  Copyright © 2016年 jzh. All rights reserved.
//

import UIKit

@objc protocol KtTableViewControllerDelegate {
    func createDataSource() -> Void
}

class KtTableViewController: UIViewController, KtBaseTableViewDelegate, KtTableViewControllerDelegate {

    
    var tableView: KtBaseTableView?
    var dataSource: KtTableViewDataSource?
    var tableViewStyle: UITableViewStyle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createTableView()
    }
    
    func initWithStyle(style: UITableViewStyle) -> KtTableViewController {
        let tVC: KtTableViewController! = KtTableViewController.init()
        if tVC != nil {
            tVC.createDataSource()
        }
        return tVC
    }
    
    func createDataSource() -> Void {
        print("Cann't use this method")
    }
    
    func createTableView() -> Void {
        if (self.tableView == nil) {
            self.tableView = KtBaseTableView(frame: self.view.bounds, style: self.tableViewStyle!)
            self.tableView?.ktDelegate = self
            self.tableView?.ktDataSource = self.dataSource
            self.view.addSubview(self.tableView!)
        }
    }


}
