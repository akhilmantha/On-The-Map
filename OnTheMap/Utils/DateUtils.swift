//
//  DateUtils.swift
//  OnTheMap
//
//  Created by akhil mantha on 29/04/18.
//  Copyright © 2018 akhil mantha. All rights reserved.
//

import Foundation

extension DateFormatter{
    
    struct DateFormatterConstants{
        
        static let DateFormatString = "yyyy-mm-dd'T'HH:mm:ss.SZ"
        
    }
    
    func dateFromApiString(_ dateString : String) -> Date? {
        self.dateFormat = DateFormatterConstants.DateFormatString
        self.timeZone = TimeZone(abbreviation: "UTC")
        self.locale = Locale(identifier: "en_US_POSIX")
        return self.date(from: dateString)
    }
}
