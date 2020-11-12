//
//  CollectionViewFlowLayout.swift
//  week3_assignment
//
//  Created by 선민승 on 2020/11/09.
//

import UIKit

class CollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
            return true
        }


        override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
            
            let layoutAttributes = super.layoutAttributesForElements(in: rect)
            
            guard let offset = collectionView?.contentOffset, let stLayoutAttributes = layoutAttributes else {
                return layoutAttributes
            }
            if offset.y < 0 {

                for attributes in stLayoutAttributes {

                    if let elmKind = attributes.representedElementKind, elmKind == UICollectionView.elementKindSectionHeader {

                        let diffValue = abs(offset.y)
                        var frame = attributes.frame
                        frame.size.height = max(0, 420.0 + diffValue)
                        frame.origin.y = frame.minY - diffValue
                        attributes.frame = frame
                    }
                }
            }
            return layoutAttributes
        }
}
