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
    let fileUpdateQueue = OperationQueue()
    
    public private(set) var senderExpressionList: [FilterExpressionModel] = []
    public private(set) var messageExpressionList: [FilterExpressionModel] = []
    
    public override init() {
        super.init()
        
        self.readData()
        NSFileCoordinator.addFilePresenter(self)
    }
    
    func readData() {
        if let url = self.presentedItemURL,
        let list = NSKeyedUnarchiver.unarchiveObject(withFile: url.path) as? [String:[FilterExpressionModel]] {
            self.senderExpressionList = list["user"] ?? []
            self.messageExpressionList = list["content"] ?? []
        }
    }
    
    public func save() {
        if let url = self.fileManager.groupPath(with: self.configFilePath) {
            let list = [
                "user" : self.senderExpressionList,
                "content" : self.messageExpressionList
            ]
            NSKeyedArchiver.archiveRootObject(list, toFile: url.path)
        }
    }
    
    @discardableResult
    public func add(expression: String, checkType: FilterCheckType) -> Bool {
        if let expression = FilterExpressionModel(expression: expression, checkType: checkType) {
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



extension FilterExpressionManager: NSFilePresenter {
    public var presentedItemURL: URL? {
        return self.fileManager.groupPath(with: self.configFilePath)
    }
    
    public var presentedItemOperationQueue: OperationQueue {
        return self.fileUpdateQueue
    }
    
    public func presentedItemDidChange() {
        self.readData()
    }
}
