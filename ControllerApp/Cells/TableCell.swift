//
//  TableCell.swift
//  ControllerApp
//
//  Created by 651 on 2018/3/28.
//  Copyright © 2018年 651. All rights reserved.
//

import UIKit
class TableCell: UITableViewCell {
    var namelabel:UILabel?
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initUI() {
        self.backgroundColor = UIColor.clear
        namelabel = UILabel(frame: CGRect(x: 60, y: 0, width: 100, height: 60 ))
        namelabel?.text = "asd"
        namelabel?.textColor = UIColorFromRGB(hex: "#ffffff", alpha: 1.0)
        self.addSubview(namelabel!)
        
        self.selectionStyle = UITableViewCellSelectionStyle.none
        
        setTextShadow(label: namelabel!)
    }
}
