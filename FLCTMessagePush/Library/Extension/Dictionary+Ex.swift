//
//  Dictionary+Ex.swift
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/5/28.
//  Copyright © 2017年 Maple. All rights reserved.
//

import Foundation


extension Dictionary {
    mutating func marge(_ target:Dictionary? ) -> Dictionary {
        if target == nil {
            return self
        } else {
            var combine = target!
            self.forEach { combine.updateValue($1, forKey: $0) }
            return combine
        }
        
    }
}
