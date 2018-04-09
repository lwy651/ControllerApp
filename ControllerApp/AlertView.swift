//
//  AlertView.swift
//  ControllerApp
//
//  Created by 651 on 2018/3/31.
//  Copyright © 2018年 651. All rights reserved.
//

import UIKit
import SnapKit

protocol AlertDelegate:NSObjectProtocol
{
    func delegateMethod()
}

class AlertView:UIView{
    var lab:UILabel?
    var bgimage:UIImageView?
    var cancelbtn:ControllerButton?
    var submitbtn:ControllerButton?
    var userdata = CoredataController.getInstance()
    
    var nameText:UITextField?
    var passwordText:UITextField?
    
    weak var delegate:AlertDelegate?

    override init(frame: CGRect) {
        let size = UIScreen.main.bounds.size
        super.init(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        print(777777)
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.alpha = 0.6
        blurView.frame = self.frame
        self.addSubview(blurView)
        
        bgimage = UIImageView(frame: CGRect(x: 0, y: 0, width: 491, height: 379))
        bgimage?.image = UIImage(named: "loginbg")
        
        self.addSubview(bgimage!)
        
        //cancelbtn = ControllerButton(frame: CGRect(x: 0, y: 0, width: 102, height: 46))
        //cancelbtn?.backgroundColor = UIColorFromRGB(hex: "#2AA5FF", alpha: 0.4)
        cancelbtn = ControllerButton()
        cancelbtn?.setImage(UIImage(named: "close"), for: UIControlState.normal)
        cancelbtn?.addTarget(self, action: #selector(self.btnClick), for: UIControlEvents.touchUpInside)
        cancelbtn?.adjustsImageWhenHighlighted = false
        self.addSubview(cancelbtn!)
        
        submitbtn = ControllerButton()
        
        self.addSubview(submitbtn!)
        //submitbtn?.backgroundColor = UIColorFromRGB(hex: "#F86639", alpha: 0.4)
        submitbtn?.setTitle("登录", for: UIControlState.normal)
        submitbtn?.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        submitbtn?.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        //submitbtn?.setImage(UIImage(named: "buttonbg"), for: UIControlState.normal)
        submitbtn?.setBackgroundImage(UIImage(named: "buttonbg"), for: UIControlState.normal)
        submitbtn?.setTitleColor(UIColorFromRGB(hex: "#2AA5FF", alpha: 0.8), for: UIControlState.normal)
        submitbtn?.addTarget(self, action: #selector(submitClick), for: UIControlEvents.touchUpInside)
        submitbtn?.adjustsImageWhenHighlighted = false
        
        nameText = UITextField()
        nameText?.textColor = UIColorFromRGB(hex: "#2AA5FF", alpha: 1.0)
        
        passwordText = UITextField()
        passwordText?.textColor = UIColorFromRGB(hex: "#2AA5FF", alpha: 1.0)
        passwordText?.isSecureTextEntry = true
        
        self.bgimage?.addSubview(passwordText!)
        self.bgimage?.addSubview(nameText!)
        self.addSubview(cancelbtn!)
        
        bgimage?.isUserInteractionEnabled = true
        
        self.autoresizingMask = [UIViewAutoresizing.flexibleHeight,UIViewAutoresizing.flexibleWidth]
        self.backgroundColor = UIColorFromRGB(hex: "#000000", alpha: 0)
        
    }
    
    @objc func btnClick() {
        self.removeFromSuperview()
    }
    
    @objc func submitClick() {
        //let settingCon = SettingController()
        //self.presentViewController(settingCon, animated: true, completion: nil)
        //delegate?.delegateMethod()
        print(nameText?.text as! String)
        if (userdata.checkUser(name: (nameText?.text)!, password: (passwordText?.text)!))
        {
            delegate?.delegateMethod()
        }
        else
        {
            print("nonononononono")
        }
        
    }
    
    override func layoutSubviews() {
        bgimage?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(superview!)
            make.centerY.equalTo(superview!).offset(-80)
        })
        
        submitbtn?.snp.makeConstraints({ (make) in
            make.bottomMargin.equalTo(bgimage!.snp.bottom).offset(-50)
            make.centerX.equalToSuperview()
        })
        
        cancelbtn?.snp.makeConstraints({ (make) in
            //make.width.equalTo(#imageLiteral(resourceName: "buttonbg").size.width)
            //make.height.equalTo(#imageLiteral(resourceName: "buttonbg").size.height)
            make.bottomMargin.equalTo(bgimage!.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
        })
        
        nameText?.snp.makeConstraints({ (make) in
            make.width.equalTo(230)
            make.centerX.equalToSuperview().offset(20)
            make.centerY.equalToSuperview().offset(-25)
        })
        passwordText?.snp.makeConstraints({ (make) in
            make.width.equalTo(230)
            make.centerX.equalToSuperview().offset(20)
            make.centerY.equalToSuperview().offset(30)
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
