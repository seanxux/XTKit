//
//  LeftAlignmentFlowLayout.swift
//  GXM-CRM
//
//  Created by XUXIAOTENG on 05/01/2018.
//  Copyright © 2018 GuoXiaoMei. All rights reserved.
//

import UIKit

class LeftAlignmentFlowLayout: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        
        var leftMargin = sectionInset.left
        var prevMaxY: CGFloat = -1.0
        attributes?.forEach { layoutAttribute in
            guard layoutAttribute.representedElementCategory == .cell else {
                return
            }
            
            if layoutAttribute.frame.origin.y >= prevMaxY {
                leftMargin = sectionInset.left
            }
            
            layoutAttribute.frame.origin.x = leftMargin
            
            leftMargin += layoutAttribute.frame.width + minimumInteritemSpacing
            prevMaxY = layoutAttribute.frame.maxY
        }
        
        return attributes
    }

}
