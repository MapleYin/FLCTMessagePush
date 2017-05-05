//
//  CellModelProtocol.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2017/4/2.
//  Copyright © 2017年 Maple. All rights reserved.
//

import UIKit

protocol CellModelProtocol {
    var cellClassName:String{get}
    func onSelected()
}
