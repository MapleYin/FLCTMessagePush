//
//  Date+Ex.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2017/3/30.
//  Copyright © 2017年 Maple. All rights reserved.
//

import Foundation

extension Date{
    
    private var componentsSet:Set<Calendar.Component>{
        get{
            return [.year,.month,.day,.hour,.minute,.second];
        }
    }
    
    private func isEqualToDateIgnoringTime(_ date:Date) -> Bool{
        let currentComponents = Calendar.current.dateComponents(componentsSet, from: self)
        let compareComponents = Calendar.current.dateComponents(componentsSet, from: date)
        return currentComponents.year == compareComponents.year &&
            currentComponents.month == compareComponents.month &&
            currentComponents.day == compareComponents.day
    }
    
    func isToday() -> Bool {
        return isEqualToDateIgnoringTime(Date())
    }
    
    func isThisYear() -> Bool {
        let currentComponents = Calendar.current.dateComponents(componentsSet, from: self)
        let compareComponents = Calendar.current.dateComponents(componentsSet, from: Date())
        return currentComponents.year == compareComponents.year;
    }
    
    func smartFormat() -> String {
        let offset = Date().timeIntervalSince(self)
        let format = DateFormatter()
        
        var timeString:String = "";
        
        if offset < 60 {
            timeString = String(offset)+"秒钟前"
        } else if offset < 3600 {
            timeString = String(lround(offset/60))+"分钟前"
        } else if offset < 86400 {
            format.dateFormat = "HH:mm"
            timeString = format.string(from: self)
            if !isToday() {
                format.dateFormat = "MM/dd HH:mm"
                timeString = format.string(from: self)
            }
        } else {
            format.dateFormat = "MM/dd HH:mm"
            timeString = format.string(from: self)
            if !isThisYear() {
                format.dateFormat = "yyyy/MM/dd"
                timeString = format.string(from: self)
            }
        }
        
        return timeString;
    }
}
