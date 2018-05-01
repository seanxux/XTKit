//
//  NSDate+Format.swift
//  KaocoreKeyboard
//
//  Created by xuxiaoteng on 11/10/14.
//  Copyright (c) 2014 seanxu. All rights reserved.
//

import Foundation

extension Date {

    func string(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.string(from: self)
    }

}
