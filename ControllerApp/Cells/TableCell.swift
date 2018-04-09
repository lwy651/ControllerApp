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
        self.layer.bounds = CGRect(x: 0, y: 0, width: 400, height: 70)
        initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initUI() {
        print(self.frame.size)
        self.backgroundColor = UIColor.clear
        namelabel = UILabel(frame: CGRect(x: 60, y: 0, width: 100, height: 60 ))
        namelabel?.text = "asd"
        namelabel?.textColor = UIColorFromRGB(hex: "#ffffff", alpha: 1.0)
        self.addSubview(namelabel!)
        
        self.selectionStyle = UITableViewCellSelectionStyle.none
        
        setTextShadow(label: namelabel!)
        //self.backgroundColor = UIColorFromRGB(hex: "#413562", alpha: 1.0)
        let startpoint = CGPoint(x: 0, y: 0)
        let endpoint = CGPoint(x: 1, y: 0)
        self.layer.insertSublayer(getGradient(startcolor: "#7193FF", endcolor: "#2AA5FF", frame: self.frame,startpoint: startpoint,endpoint: endpoint,alpha: 1.0), at: 0)
        self.alpha = 0.1
    }
}
