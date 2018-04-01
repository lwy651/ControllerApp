//
//  ControllerButton.swift
//  ControllerApp
//
//  Created by 651 on 2018/4/1.
//  Copyright © 2018年 651. All rights reserved.
//

import UIKit
class ControllerButton: UIButton {
    var imagebg:UIImageView?
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initUI() {
        //imagebg = UIImageView()
        //self.imageView?.image = UIImage(named: "buttonbg")
        //self.imageView?.frame = CGRect(x: 0, y: 0, width: 100, height: 55)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        //imageView?.image = UIImage(named: "buttonbg")
        //imageView?.frame = CGRect(x: 0, y: 0, width: (imageView?.image?.size.width)!, height: (imageView?.image?.size.height)!)
        
        //titleLabel?.frame.origin.x = self.frame.size.width/2-(titleLabel?.frame.size.width)!/2
        titleLabel?.frame.origin.y = self.frame.size.height/2-(titleLabel?.frame.size.height)!/2
    }
}
