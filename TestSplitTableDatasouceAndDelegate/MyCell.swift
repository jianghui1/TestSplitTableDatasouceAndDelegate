//
//  MyCell.swift
//  TestSplitTableDatasouceAndDelegate
//
//  Created by ys on 16/5/25.
//  Copyright © 2016年 jzh. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {

    private var label: UILabel!
    private var dataObject: AnyObject?
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        label = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        label.backgroundColor = UIColor.yellowColor()
        self.contentView.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setDataObject(string: String) -> Void {
        dataObject = string
        self.label.text = string
    }
    

}
