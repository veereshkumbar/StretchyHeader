//
//  CustomFlowLayout.swift
//  StretchyHeader
//
//  Created by Veeresh Kumbar on 12/01/19.
//  Copyright © 2019 Veeresh Kumbar. All rights reserved.
//

import UIKit

class CustomFlowLayout: UICollectionViewFlowLayout {

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        layoutAttributes?.forEach({ (attributes) in
            if attributes.representedElementKind == UICollectionView.elementKindSectionHeader{
                
                guard let collectionView = collectionView else {return}
                
                let contentOffsetY = collectionView.contentOffset.y
                                
                if contentOffsetY>0{
                    return
                }
                
                let width = collectionView.frame.width
                
                let height = attributes.frame.height-contentOffsetY
                
                attributes.frame = CGRect(x: 0, y: contentOffsetY, width: width, height: height)
            }
        })
        
        
        
        return layoutAttributes
        
        
    }
    
    //this will call the above method every time u scroll if u return true
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
}
