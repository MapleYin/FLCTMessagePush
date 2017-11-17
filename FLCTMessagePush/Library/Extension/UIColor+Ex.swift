//
//  UIColor+Ex.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2017/9/3.
//  Copyright © 2017年 Maple. All rights reserved.
//

import UIKit

extension UIColor {
    public convenience init(hexString:String) {
        let range = hexString.range(of: "^[0-9a-fA-F]{6}", options: .regularExpression)
        if range == nil {
            self.init()
            return
        }
        
        var red:UInt32 = 0
        var green:UInt32 = 0
        var blue:UInt32 = 0

        
        Scanner(string: hexString.substring(start: 0, end: 2)!).scanHexInt32(&red)
        Scanner(string: hexString.substring(start: 2, end: 4)!).scanHexInt32(&green)
        Scanner(string: hexString.substring(start: 4, end: 6)!).scanHexInt32(&blue)
        
        
        self.init(red: CGFloat(Float(red)/255.0), green: CGFloat(Float(green)/255.0), blue: CGFloat(Float(blue)/255.0), alpha: 1)
    }
    
}
