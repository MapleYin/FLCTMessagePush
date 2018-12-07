//
//  GroupFileManager.swift
//  MessageCommon
//
//  Created by Mapleiny on 2018/9/16.
//  Copyright © 2018年 Maple. All rights reserved.
//

import Foundation

public class GroupFileManager {
    
    let groupPath: URL?
    
    public init() {
        self.groupPath = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.im.maple.app")
    }
    
    public func groupPath(with filePath: String) -> URL? {
        return self.groupPath?.appendingPathComponent(filePath)
    }
}
