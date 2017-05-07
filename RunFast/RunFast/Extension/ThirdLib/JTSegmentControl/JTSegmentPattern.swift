//
//  JTSegmentPattern.swift
//  JTSegementControlDemo
//
//  Created by xia on 16/11/12.
//  Copyright © 2016年 JT. All rights reserved.
//

import UIKit

struct JTSegmentPattern {
    
    static let itemTextColor = color(red: 62, green: 62, blue: 62, alpha: 1.0)
    static let itemSelectedTextColor = color(red: 35, green: 214, blue: 163, alpha: 1.0)
    
    static let itemBackgroundColor = color(red: 255.0, green: 255.0, blue: 255.0, alpha: 1.0)
    static let itemSelectedBackgroundColor = color(red: 255.0, green: 255.0, blue: 255.0, alpha: 1.0)
    
    static let itemBorder : CGFloat = 20.0
    //MARK - Text font
    static let textFont = UIFont.systemFont(ofSize: 14.0)
    static let selectedTextFont = UIFont.systemFont(ofSize: 14.0)
    
    //MARK - slider
    static let sliderColor = color(red: 35, green: 214, blue: 163, alpha: 1.0)
    static let sliderHeight : CGFloat = 2.0
    
    //MARK - bridge
    static let bridgeColor = color(red: 35, green: 214, blue: 163, alpha: 1.0)
    static let bridgeWidth : CGFloat = 7.0
    
    //MARK - inline func
    @inline(__always) static func color(red:Float, green:Float, blue:Float, alpha:Float) -> UIColor {
        return UIColor(colorLiteralRed: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
}
