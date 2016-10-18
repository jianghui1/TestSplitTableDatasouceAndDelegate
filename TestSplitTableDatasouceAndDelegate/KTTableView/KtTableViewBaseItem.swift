//
//  KtTableViewBaseItem.swift
//  TestSplitTableDatasouceAndDelegate
//
//  Created by ys on 16/5/25.
//  Copyright © 2016年 jzh. All rights reserved.
//

import UIKit

class KtTableViewBaseItem: NSObject {
    
    var cellHeight: CGFloat = 0
    var itemIdentifier: String?
    var itemImage: UIImage?
    var itemTitle: String?
    var itemSubtitle: String?
    var itemAccessoryImage: UIImage?
    
    func initWithImage(image image: UIImage, title: String, subTitle: String, accessoryImage: UIImage) -> KtTableViewBaseItem {
        let item: KtTableViewBaseItem? = KtTableViewBaseItem.init()
        if (item != nil) {
            cellHeight = -1
            itemImage = image
            itemTitle = title
            itemSubtitle = subTitle
            itemAccessoryImage = accessoryImage
        }
        return item!
    }

}
