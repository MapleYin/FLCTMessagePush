//
//  Cache.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2017/4/1.
//  Copyright © 2017年 Maple. All rights reserved.
//

import Foundation


enum Cache{
    case UserDefault
    case File
    case Archive
    
    @discardableResult
    func saveData(_ data:Any? ,forKey key:String) -> Bool {
        switch self {
        case .UserDefault:
            return saveDataToUserDefault(data,forKey: key)
        case .File:
            return saveDataToFile(data, forKey: key)
        case .Archive:
            return archiveDataToFile(data, forKey:key)
        }
    }
    
    func readData<T>(_ key:String) -> T? {
        switch self {
        case .UserDefault:
            return readDataFromUserDefault(forKey: key)
        case .File:
            return readDateFromFile(forKey: key)
        case .Archive:
            return unarchiveDateFromFile(forKey: key)
        }
    }
}

// MARK: - Data Format

extension Cache{
    fileprivate func isPropertyList(_ data:Any) -> Bool {
        return PropertyListSerialization.propertyList(data, isValidFor: .xml)
    }
    fileprivate func canArchive(_ data:Any) -> Bool {
        return data is NSObject && data is NSCoding
    }
    fileprivate func dataFormat(_ data:Any) -> Data?{
        return try? PropertyListSerialization.data(fromPropertyList: data, format: .xml, options: 0);
    }
}



// MARK: - UserDefault

extension Cache{
    fileprivate func saveDataToUserDefault(_ data:Any?, forKey key:String) -> Bool {
        if data != nil{
            UserDefaults.standard.set(data, forKey: key)
            return true
        }else{
            return false
        }
    }
    fileprivate func readDataFromUserDefault<T>(forKey key:String) -> T? {
        let obj = UserDefaults.standard.value(forKey: key)
        if obj is T{
            return (obj as! T)
        }else{
            return nil
        }
    }
}

// MARK: - File

extension Cache{
    fileprivate func saveDataToFile(_ data:Any?, forKey key:String) -> Bool {
        if (data != nil),let formatData = dataFormat(data!){
            do {
                try formatData.write(to: URL(fileURLWithPath: ""))
                return true
            } catch let error as NSError {
                print(error.domain)
                return false
            }
        }
        return false
    }
    
    fileprivate func readDateFromFile<T>(forKey key:String) -> T?{
        if let data = try? Data.init(contentsOf: URL(fileURLWithPath: "")){
            if let dataFormat = try? PropertyListSerialization.propertyList(from: data,format: nil){
                return dataFormat as? T
            }
        }
        
        return nil
    }
}


// MARK: - Archive

extension Cache{
    fileprivate func archiveDataToFile(_ data:Any?, forKey key:String) -> Bool{
        if (data != nil),canArchive(data!){
            if let path = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first {
                let finalPath = path.appending("/multi.\(key)")
                return NSKeyedArchiver.archiveRootObject(data!, toFile: finalPath)
            } else {
                return false
            }
        }
        return false
    }
    fileprivate func unarchiveDateFromFile<T>(forKey key:String) -> T?{
        if let path = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first {
            let finalPath = path.appending("/multi.\(key)")
            return NSKeyedUnarchiver.unarchiveObject(withFile: finalPath) as? T
        } else {
            return nil
        }
    }
}
