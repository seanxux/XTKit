//
//  UIView+Extension.swift
//  GXM-CRM
//
//  Created by XUXIAOTENG on 08/03/2017.
//  Copyright © 2017 GuoXiaoMei. All rights reserved.
//

import UIKit

public enum ALEdge: Int {
    /** The left edge of the view. */
    case left
    case right
    case top
    case bottom
}

extension UIView {
    
    public var left: CGFloat {
        return self.frame.origin.x
    }
    
    public var top: CGFloat {
        return self.frame.origin.y
    }
    
    public var right: CGFloat {
        return self.frame.origin.x + self.frame.size.width
    }
    
    public var bottom: CGFloat {
        return self.frame.origin.y + self.frame.size.height
    }
    
    public var width: CGFloat {
        return self.frame.size.width
    }
    
    public var height: CGFloat {
        return self.frame.size.height
    }
    
    @discardableResult
    public func addBorder(edge: ALEdge, width: CGFloat, color: UIColor) -> UIView {
        let lineView = UIView(frame: CGRect.zero)
        lineView.backgroundColor = color
        self.addSubview(lineView)
        lineView.snp.makeConstraints { (make) in
            switch edge {
            case .top:
                make.height.equalTo(width)
                make.left.right.top.equalTo(0)
            case .bottom:
                make.height.equalTo(width)
                make.left.right.bottom.equalTo(0)
            case .left:
                make.width.equalTo(width)
                make.left.top.bottom.equalTo(0)
            case .right:
                make.width.equalTo(width)
                make.right.top.bottom.equalTo(0)
            }
        }
        return lineView
    }
    
    @discardableResult
    public func addBorder(edge: ALEdge, width: CGFloat, padding: CGFloat, color: UIColor) -> UIView {
        let lineView = UIView(frame: CGRect.zero)
        lineView.backgroundColor = color
        self.addSubview(lineView)
        lineView.snp.makeConstraints { (make) in
            switch edge {
            case .top:
                make.height.equalTo(width)
                make.left.equalTo(padding)
                make.right.equalTo(-padding)
                make.top.equalTo(0)
            case .bottom:
                make.height.equalTo(width)
                make.left.equalTo(padding)
                make.right.equalTo(-padding)
                make.bottom.equalTo(0)
            case .left:
                make.width.equalTo(width)
                make.top.equalTo(padding)
                make.bottom.equalTo(-padding)
                make.left.equalTo(0)
            case .right:
                make.width.equalTo(width)
                make.top.equalTo(padding)
                make.bottom.equalTo(-padding)
                make.right.equalTo(0)
            }
        }
        return lineView
    }
    
    public func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
}
