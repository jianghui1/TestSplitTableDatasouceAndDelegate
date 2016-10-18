//
//  KtBaseTableViewCell.swift
//  TestSplitTableDatasouceAndDelegate
//
//  Created by ys on 16/5/25.
//  Copyright © 2016年 jzh. All rights reserved.
//

import UIKit

class KtBaseTableViewCell: UITableViewCell {
    
    func setObject(object: KtTableViewBaseItem) -> Void {
        self.imageView?.image = object.itemImage
        self.textLabel?.text = object.itemTitle
        self.detailTextLabel?.text = object.itemSubtitle
        self.accessoryView = UIImageView(image: object.itemAccessoryImage)
    }
    
    
    func tableViewRowHeightForObject(tableView: UITableView, object: KtTableViewBaseItem) -> Float {
        return 44.0
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
