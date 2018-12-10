//
//  ExpressionEditManager.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2018/9/18.
//  Copyright © 2018年 Maple. All rights reserved.
//

import UIKit
import MessageCommon

class ExpressionEditManager {
    
    static let shared = ExpressionEditManager()
    private let filterExpressionMananger = FilterExpressionManager()
    
    let kLastSelectedEditType = "kLastSelectedEditType"
    var editListCachePath: String = {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        return url?.appendingPathComponent("editInfoFile").path ?? ""
    }()
    
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
        
        self.read()
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
    
    func remove(at index: Int) {
        if index >= 0 && index < self.expressionList.count {
            self.expressionList.remove(at: index)
        }
    }
    
    func add(model: ExpressionEditModel) {
        self.expressionList.insert(model, at: 0)
    }
    
    func save() {
        if !NSKeyedArchiver.archiveRootObject(self.expressionList, toFile: self.editListCachePath) {
            print("save error")
        }
        
        self.converEditModel()
    }
    
    func read() {
        if let editList = NSKeyedUnarchiver.unarchiveObject(withFile: self.editListCachePath) as? [ExpressionEditModel] {
            self.expressionList = editList
        }
    }
    
    func converEditModel() {
        filterExpressionMananger.clear()
        self.expressionList.forEach { (model) in
            let checkType: FilterCheckType
            if model.source == .message {
                checkType = .message
            } else {
                checkType = .sender
            }
            let expression = model.expressionString()
            filterExpressionMananger.add(expression: expression,
                                         checkType: checkType,
                                         contain: model.condition == .contain)
        }
        filterExpressionMananger.save()
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
