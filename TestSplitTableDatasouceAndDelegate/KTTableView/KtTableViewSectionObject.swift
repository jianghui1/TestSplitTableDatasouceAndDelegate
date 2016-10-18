//
//  KtTableViewSectionObject.swift
//  TestSplitTableDatasouceAndDelegate
//
//  Created by ys on 16/5/25.
//  Copyright © 2016年 jzh. All rights reserved.
//

import UIKit

class KtTableViewSectionObject: NSObject {
    
    var headerTitle: String?
    var footerTitle: String?
    lazy var items: NSMutableArray = NSMutableArray()
    
    
    func initWithItemArray(items: NSMutableArray) -> KtTableViewSectionObject {
        let sl: KtTableViewSectionObject! = KtTableViewSectionObject.init()
        if (sl != nil) {
            sl.items.addObjectsFromArray(items as [AnyObject])
        }
        return sl
    }
    
    override init() {
        super.init()
        
        self.headerTitle = ""
        self.footerTitle = ""
    }

}
