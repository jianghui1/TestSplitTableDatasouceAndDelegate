//
//  KtBaseTableView.swift
//  TestSplitTableDatasouceAndDelegate
//
//  Created by ys on 16/5/25.
//  Copyright © 2016年 jzh. All rights reserved.
//

import UIKit

@objc protocol KtBaseTableViewDelegate: UITableViewDelegate {
    /**
     * 选择一个cell的回调，并返回被选择cell的数据结构和indexPath
     */
    optional func didSelectObject(object: AnyObject, indexPath: NSIndexPath) -> Void
    
    optional func headerViewForSectionObject(sectionObject: KtTableViewSectionObject, section: NSInteger) -> UIView
}

class KtBaseTableView: UITableView, UITableViewDelegate {

    var ktDataSource: KtTableViewDataSource?
    var ktDelegate: KtBaseTableViewDelegate?
    
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
        self.autoresizingMask = UIViewAutoresizing.FlexibleHeight.union(UIViewAutoresizing.FlexibleWidth)
        self.separatorColor = UIColor.clearColor()
        self.showsVerticalScrollIndicator = true
        self.showsHorizontalScrollIndicator = false
        self.sectionHeaderHeight = 0
        self.sectionFooterHeight = 0
        self.delegate = self
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let dataSourcee: KtTableViewDataSource = tableView.dataSource as! KtTableViewDataSource
        
        let object: KtTableViewBaseItem = dataSourcee.tableViewObjectForRowAtIndexPath(tableView, indexPath: indexPath)
        let cls: AnyClass = dataSourcee.tableViewCellClassForObject(tableView, object: object)
        if object.cellHeight == -1 {
            //            object.cellHeight = cls.tableviewro
        }
        return object.cellHeight
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if ((self.ktDelegate?.respondsToSelector(#selector(KtBaseTableViewDelegate.didSelectObject(_:indexPath:)))) != nil) {
            let dataSource: KtTableViewDataSource = tableView.dataSource as! KtTableViewDataSource
            let object: AnyObject = dataSource.tableViewObjectForRowAtIndexPath(tableView, indexPath: indexPath)
            self.ktDelegate?.didSelectObject!(object, indexPath: indexPath)
            tableView .deselectRowAtIndexPath(indexPath, animated: true)
        } else if ((self.ktDelegate?.respondsToSelector(#selector(KtBaseTableViewDelegate.didSelectObject(_:indexPath:)))) != nil) {
            self.ktDelegate?.tableView!(tableView, didSelectRowAtIndexPath: indexPath)
        }
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if ((self.ktDelegate?.respondsToSelector(#selector(KtBaseTableViewDelegate.headerViewForSectionObject(_:section:)))) != nil) {
            let dataSource: KtTableViewDataSource = tableView.dataSource as! KtTableViewDataSource
            let sectionObject = dataSource.sections![section]
            return self.ktDelegate?.headerViewForSectionObject!(sectionObject as! KtTableViewSectionObject, section: section)
        } else if ((self.ktDelegate?.respondsToSelector(#selector(KtBaseTableViewDelegate.headerViewForSectionObject(_:section:)))) != nil) {
            return self.ktDelegate?.tableView!(tableView, viewForHeaderInSection: section)
        }
        return nil
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if ((self.ktDelegate?.respondsToSelector(#selector(KtBaseTableViewDelegate.tableView(_:willDisplayCell:forRowAtIndexPath:)))) != nil) {
            self.ktDelegate?.tableView!(tableView, willSelectRowAtIndexPath: indexPath)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
