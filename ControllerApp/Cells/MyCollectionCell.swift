//
//  MyCollectionCell.swift
//  ControllerApp
//
//  Created by 651 on 2018/4/14.
//  Copyright © 2018年 651. All rights reserved.
//

import UIKit
class MyCollectionCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        let txt:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 60 ))
        txt.text = "651"
        txt.textColor = UIColorFromRGB(hex: "#ffffff", alpha: 1.0)
        self.addSubview(txt)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
