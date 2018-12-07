//
//  ExpressionEditManager.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2018/9/18.
//  Copyright © 2018年 Maple. All rights reserved.
//

import UIKit

class ExpressionEditManager {
    
    static let shared = ExpressionEditManager()
    
    let kLastSelectedEditType = "kLastSelectedEditType"
    
    private let editTypeList: [ExpressionEditTypeModel]
    
    private var expressionList: [ExpressionEditModel] = []
    
    init() {
        self.editTypeList = []
//        let juniorMode = ExpressionEditTypeModel(name: "初级",
//                                      backgroundColor: UIColor(red:0.677, green:1.000, blue:0.430, alpha:1.000),
//                                            editClass: ExpressionEditJuniorModeNode.self)
//        let middelMode = ExpressionEditTypeModel(name: "中级",
//                                      backgroundColor: UIColor(red:0.478, green:0.857, blue:1.000, alpha:1.000),
//                                                 editClass: ExpressionEditMiddelModeNode.self)
//        let seniorMode = ExpressionEditTypeModel(name: "高级",
//                                      backgroundColor: UIColor(red:0.569, green:0.411, blue:0.998, alpha:1.000),
//                                            editClass: ExpressionEditSeniorModeNode.self)
//        self.editTypeList = [
//            juniorMode,
//            middelMode,
//            seniorMode
//        ]
    }
    
    
    func numberOfExpression() -> Int {
        return self.expressionList.count
    }
    
    func modelAt(index: Int) -> ExpressionEditModel? {
        if index >= 0 && index < self.expressionList.count {
            return self.expressionList[index]
        } else {
            return nil
        }
    }
    
}



extension ExpressionEditManager {
    func numberOfEditType() -> Int {
        return self.editTypeList.count
    }
    
    func editTypeModel(at index: Int) -> ExpressionEditTypeModel? {
        if index >= 0 && index < self.editTypeList.count {
            return self.editTypeList[index]
        } else {
            return nil
        }
    }
    
    func saveEditType(model: ExpressionEditTypeModel) {
        Cache.Archive.saveData(model, forKey: self.kLastSelectedEditType)
    }
    
    func lastEditType() -> ExpressionEditTypeModel? {
        let model: ExpressionEditTypeModel? = Cache.Archive.readData(self.kLastSelectedEditType) ?? nil
        return  model
    }
}
