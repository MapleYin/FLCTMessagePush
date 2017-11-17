//
//  String+Ex.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2017/9/3.
//  Copyright © 2017年 Maple. All rights reserved.
//

import Foundation


extension String {
    func substring(start:Int,end:Int) -> String? {
        guard start < end, end <= self.lengthOfBytes(using: .utf8)  else {
            return nil
        }
        let startIndex = self.index(self.startIndex, offsetBy: start)
        let endIndex = self.index(self.startIndex, offsetBy: end)
        
        return self.substring(with: Range(uncheckedBounds: (lower:startIndex, upper: endIndex)))
    }
}
