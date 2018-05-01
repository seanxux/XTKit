//
//  UIImage+Extension.swift
//  GXM-CRM
//
//  Created by XUXIAOTENG on 06/02/2018.
//  Copyright © 2018 GuoXiaoMei. All rights reserved.
//

import Foundation

extension UIImage {
    
    open func blend(with color: UIColor) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()!
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        // Unflip the image
        context.translateBy(x: 0, y: size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        
        context.setBlendMode(.overlay)
        context.draw(cgImage!, in: rect)
        
        context.setFillColor(color.cgColor)
        context.fill(rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
}
