//
//  FilterExpressionManager.swift
//  MessageCommon
//
//  Created by Mapleiny on 2018/9/16.
//  Copyright © 2018年 Maple. All rights reserved.
//

import Foundation


public class FilterExpressionManager: NSObject {
    
    let configFilePath = "configFile"
    let fileManager = GroupFileManager()

    let isExtention: Bool
    
    let userDefaults = UserDefaults(suiteName: "group.im.maple.app")
    
    public private(set) var senderExpressionList: [FilterExpressionModel] = []
    public private(set) var messageExpressionList: [FilterExpressionModel] = []
    
    public init(isExtention: Bool = false) {
        self.isExtention = isExtention
        super.init()
        
        self.readData()
    }
    
    func readData() {
        if let data = self.userDefaults?.data(forKey: "rule"),
            let list = NSKeyedUnarchiver.unarchiveObject(with: data) as? [String : [FilterExpressionModel]] {
            self.senderExpressionList = list["user"] ?? []
            self.messageExpressionList = list["content"] ?? []
        }
    }
    
    public func save() {
        let list = [
            "user" : self.senderExpressionList,
            "content" : self.messageExpressionList
        ]
        
        let data = NSKeyedArchiver.archivedData(withRootObject: list)
        
        self.userDefaults?.set(data, forKey: "rule")
    }
    
    @discardableResult
    public func add(expression: String, checkType: FilterCheckType, contain: Bool = true) -> Bool {
        if let expression = FilterExpressionModel(expression: expression,
                                                  checkType: checkType,
                                                  contain: contain) {
            switch checkType {
            case .message:
                self.messageExpressionList.append(expression)
            case .sender:
                self.senderExpressionList.append(expression)
            }
            return true
        } else {
            return false
        }
    }
    
    public func clear() {
        self.senderExpressionList = []
        self.messageExpressionList = []
    }
    
    
    public func needFilter(text: String, checkType: FilterCheckType) -> Bool {
        self.userDefaults?.set(text, forKey: "test")
        if checkType == .message {
            if self.messageExpressionList.first(where: { (expModel) -> Bool in
                return expModel.test(text)
            }) != nil {
                return true
            }
            return false
        } else {
            if self.senderExpressionList.first(where: { (expModel) -> Bool in
                return expModel.test(text)
            }) != nil {
                return true
            }
            return false
        }
    }
}
