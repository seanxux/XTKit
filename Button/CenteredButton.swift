//
//  CenteredButton.swift
//  GXM-CRM
//
//  Created by XUXIAOTENG on 15/12/2017.
//  Copyright © 2017 GuoXiaoMei. All rights reserved.
//

import UIKit

class CenteredButton: UIButton {
    
    let space: CGFloat = 2.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        centerTitleLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        centerTitleLabel()
    }
    
    private func centerTitleLabel() {
        titleLabel?.textAlignment = .center
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        
        if let image = imageView?.image {
            var labelHeight: CGFloat = 0.0
            
            if let size = titleLabel?.sizeThatFits(CGSize(width: self.contentRect(forBounds: self.bounds).width,
                                                          height: CGFloat.greatestFiniteMagnitude)) {
                labelHeight = size.height
            }
            
            return CGSize(width: size.width, height: image.size.height + labelHeight + space)
        }
        
        return size
    }

    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        let titleRect = super.titleRect(forContentRect: contentRect)
        let imageRect = super.imageRect(forContentRect: contentRect)
        let titleY = (contentRect.height - imageRect.height - titleRect.height + space) / 2.0 + imageRect.height
        return CGRect(x: 0, y: titleY, width: contentRect.width, height: titleRect.height)
    }
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        let titleRect = self.titleRect(forContentRect: contentRect)
        let imageRect = super.imageRect(forContentRect: contentRect)
        return CGRect(x: contentRect.width / 2.0 - imageRect.width / 2.0,
                      y: (contentRect.height - titleRect.height - space) / 2.0 - imageRect.height / 2.0,
                      width: imageRect.width,
                      height: imageRect.height)
    }

}
