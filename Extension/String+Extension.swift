//
//  NSString+Date.swift
//  KaocoreKeyboard
//
//  Created by xuxiaoteng on 11/10/14.
//  Copyright (c) 2014 seanxu. All rights reserved.
//

import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: self)
    }
    
    func date(format: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.date(from: self)
    }
    
}
