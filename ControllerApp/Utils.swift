//
//  Utils.swift
//  ControllerApp
//
//  Created by 651 on 2018/3/28.
//  Copyright © 2018年 651. All rights reserved.
//

import UIKit

//色值转化
func UIColorFromRGB (hex:String,alpha:CGFloat) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
    if (cString.hasPrefix("#")) {
        cString = (cString as NSString).substring(from: 1)
    }
    let rString = (cString as NSString).substring(to: 2)
    let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
    let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
    var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
    Scanner(string: rString).scanHexInt32(&r)
    Scanner(string: gString).scanHexInt32(&g)
    Scanner(string: bString).scanHexInt32(&b)
    return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
}

//渐变
func getGradient(startcolor:String,endcolor:String,frame:CGRect,startpoint:CGPoint,endpoint:CGPoint,alpha:CGFloat)->CAGradientLayer {
    let topColor = UIColorFromRGB(hex: startcolor, alpha: alpha)
    let buttomColor = UIColorFromRGB(hex: endcolor, alpha: alpha)
    let gradientColors = [topColor.cgColor, buttomColor.cgColor]
    
    //定义每种颜色所在的位置
    let gradientLocations:[NSNumber] = [0.0, 1.0]
    
    //创建CAGradientLayer对象并设置参数
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = gradientColors
    gradientLayer.locations = gradientLocations
    gradientLayer.startPoint = startpoint
    gradientLayer.endPoint = endpoint
    
    
    //设置其CAGradientLayer对象的frame，并插入view的layer
    
    gradientLayer.frame = frame
    return gradientLayer
}

//设置文字阴影
func setTextShadow(label:UILabel) {
    label.layer.shadowOpacity = 0.4;
    label.layer.shadowOffset = CGSize(width: 0, height: 0)
    label.layer.shadowRadius = 6;
    label.layer.shadowColor = UIColor.white.cgColor
}
