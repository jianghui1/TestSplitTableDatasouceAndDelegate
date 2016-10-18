//
//  ModelController.swift
//  TestSplitTableDatasouceAndDelegate
//
//  Created by ys on 16/5/25.
//  Copyright © 2016年 jzh. All rights reserved.
//

import UIKit

class ModelController: NSObject, UITableViewDataSource {
    
    
    var dataArray: NSMutableArray?
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataArray?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellId = "cellId"
        
        var cell: MyCell! = tableView.dequeueReusableCellWithIdentifier(cellId) as? MyCell
        if cell == nil {
            cell = MyCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellId)
        }
        
        let object = self.dataArray![indexPath.row]
        cell.setDataObject(object as! String)
        
        return cell
    }

}
