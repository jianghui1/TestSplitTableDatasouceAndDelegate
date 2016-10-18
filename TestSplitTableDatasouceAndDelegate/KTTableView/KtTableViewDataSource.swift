//
//  KtTableViewDataSource.swift
//  TestSplitTableDatasouceAndDelegate
//
//  Created by ys on 16/5/25.
//  Copyright © 2016年 jzh. All rights reserved.
//

import UIKit

@objc protocol KtTableViewDataSourceDelegate {
    
    optional func tableViewObjectForRowAtIndexPath(tableView: UITableView, indexPath: NSIndexPath) -> KtTableViewBaseItem
    optional func tableViewCellClassForObject(tableView: UITableView, object: KtTableViewBaseItem) -> AnyClass
}

class KtTableViewDataSource: NSObject, UITableViewDataSource, KtTableViewDataSourceDelegate {
    
    var sections: NSMutableArray? // 二位数组，每个元素都是一个sectionObject
    
    // KtTableViewDataSourceDelegate
    func tableViewObjectForRowAtIndexPath(tableView: UITableView, indexPath: NSIndexPath) -> KtTableViewBaseItem {
        if self.sections?.count > indexPath.section {
            let sectionObject: KtTableViewSectionObject = self.sections![indexPath.section] as! KtTableViewSectionObject
            if sectionObject.items.count > indexPath.row {
                return sectionObject.items[indexPath.row] as! KtTableViewBaseItem
            }
        }
        return KtTableViewBaseItem()
    }
    func tableViewCellClassForObject(tableView: UITableView, object: KtTableViewBaseItem) -> AnyClass {
        // 这个方法子类会有机会重写，默认是KtBaseTableViewCell
        return KtBaseTableViewCell.self
    }
    
    
    // UITableViewDelegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.sections?.count > section {
            let sectionObject: KtTableViewSectionObject = self.sections![section] as! KtTableViewSectionObject
            return sectionObject.items.count
        }
        return 0
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let object: KtTableViewBaseItem = self.tableViewObjectForRowAtIndexPath(tableView, indexPath: indexPath)
        let cellClass = self.tableViewCellClassForObject(tableView, object: object)
        let className: NSString = NSString(UTF8String: class_getName(cellClass))!
        
        var cell: KtBaseTableViewCell! = tableView.dequeueReusableCellWithIdentifier(className as String) as! KtBaseTableViewCell
        if (cell == nil) {
//            cell = cellClass(style: UITableViewCellStyle.Default, reuseIdentifier: className)
        }
        cell.setObject(object)
        
        
        return UITableViewCell()
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return (self.sections != nil) ? (self.sections?.count)! : 0
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if self.sections?.count > section {
            let sectionObject: KtTableViewSectionObject = self.sections![section] as! KtTableViewSectionObject
            return sectionObject.headerTitle
        }
        return nil
    }
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if self.sections?.count > section {
            let sectionObject: KtTableViewSectionObject! = self.sections![section] as! KtTableViewSectionObject
            if sectionObject != nil && sectionObject.footerTitle != nil {
                return sectionObject.footerTitle
            }
        }
        return nil
    }

}
