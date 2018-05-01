//
//  VAlignLabel.swift
//  GXM-CRM
//
//  Created by XUXIAOTENG on 28/12/2017.
//  Copyright © 2017 GuoXiaoMei. All rights reserved.
//

import UIKit

enum VAlign {
    case top
    case middle
    case bottom
}

class VAlignLabel: UILabel {

    var valign: VAlign = .top
    
    override func drawText(in rect: CGRect) {
        var actualRect = rect
        let size = self.sizeThatFits(rect.size)
        actualRect.size = size
        
        if valign == .bottom {
            actualRect.origin.y = rect.maxY - size.height
        }
        super.drawText(in: actualRect)
    }

}
