//
//  ExpressionEditSegmentSelectCellViewModle.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2018/9/20.
//  Copyright © 2018年 Maple. All rights reserved.
//

import AsyncDisplayKit

class ExpressionEditSegmentSelectCellViewModle: ExpressionEditCellModelProtocol {
    
    let cellNodeClass: (ASCellNode & ExpressionEditCellProtocol).Type = ExpressionEditSegmentSelectCellNode.self
    
    let titleText: String
    let segmentTexts: [String]
    let currentSelected: Int
    
    let valueText: String? = nil
    
    init(titleText: String, segment: [String], defaultIndex: Int = 0) {
        self.titleText = titleText
        self.segmentTexts = segment
        self.currentSelected = defaultIndex
    }
}

