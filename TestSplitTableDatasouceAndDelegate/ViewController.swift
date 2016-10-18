//
//  ViewController.swift
//  TestSplitTableDatasouceAndDelegate
//
//  Created by ys on 16/5/25.
//  Copyright © 2016年 jzh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    
    private var tableView: UITableView!
    private lazy var dataArray: NSMutableArray = NSMutableArray()
    private lazy var modelController: ModelController = ModelController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView = UITableView(frame: CGRect(x: 0, y: 64, width: self.view.frame.size.width, height: self.view.frame.size.height), style: UITableViewStyle.Plain)
        self.tableView.backgroundColor = UIColor.redColor()
        self.tableView.delegate = self
        self.tableView.dataSource = modelController
        self.view .addSubview(self.tableView)
        
        
        for i in 0 ..< 10 {
            let string = "第\(i)个"
            self.dataArray.addObject(string)
        }
        self.modelController.dataArray = self.dataArray
        
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let string: String = self.dataArray[indexPath.row] as! String
        print("\(string)")
    }


}

