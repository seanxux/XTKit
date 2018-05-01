//
//  Extension.swift
//  MTViewer
//
//  Created by XUXIAOTENG on 18/05/2017.
//  Copyright © 2017 Bravesoft. All rights reserved.
//

import UIKit

extension UIButton {
    @IBInspectable var normalLocalizedKey: String? {
        set {
            guard let newValue = newValue else { return }
            setTitle(NSLocalizedString(newValue, comment: ""), for: .normal)
        }
        get { return title(for: .normal) }
    }
}
