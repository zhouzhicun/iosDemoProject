//
//  Date+Extensions.swift
//  demoProject
//
//  Created by zzc on 2021/4/25.
//

import Foundation

/**
 日期格式列表：
 
 yyyy-MM
 yyyy-MM-dd
 MM-dd
 MM-dd HH:mm
 MM-dd HH:mm:ss
 HH:mm
 HH:mm:ss
 
 yyyy/MM
 yyyy/MM/dd
 MM/dd
 MM/dd HH:mm
 MM/dd HH:mm:ss
 
 yyyy-MM-dd HH:mm
 yyyy-MM-dd HH:mm:ss
 
 yyyy/MM/dd HH:mm
 yyyy/MM/dd HH:mm:ss
 
 yyyy年MM月
 yyyy年MM月dd日
 yyyy年MM月dd日 HH:mm
 yyyy年MM月dd日 HH:mm:ss
 MM月dd日
 MM月dd日 HH:mm
 MM月dd日 HH:mm:ss
 
 yyyyMMdd
 HHmmss
 yyyyMMddHHmmss
 yyyyMMddHHmmssSSS
 
 yyyy.MM.dd
 MM.dd

 */

extension Date {
    
    static func currentTime(_ format: String) -> String {
        let date = Date()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = format
        let strNowTime = timeFormatter.string(from: date) as String
        return strNowTime
    }
}
