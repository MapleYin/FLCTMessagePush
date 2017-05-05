//
//  SettingViewModel.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2017/4/2.
//  Copyright © 2017年 Maple. All rights reserved.
//

import Foundation


class SettingModel:CellModelProtocol{
    var cellClassName = NSStringFromClass(SettingViewCell.self)
    
    let title:String;
    
    init(_ title:String) {
        self.title = title
    }
    
    func onSelected() {
    }
}
