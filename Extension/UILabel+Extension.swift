//
//  UILabel+Extension.swift
//  MTViewer
//
//  Created by soy on 2017/5/16.
//  Copyright © 2017年 Bravesoft. All rights reserved.
//

import UIKit
extension UILabel {
    @IBInspectable var localizedKey: String? {
        set {
            guard let newValue = newValue else { return }
            text = NSLocalizedString(newValue, comment: "")
        }
        get { return text }
    }
}
