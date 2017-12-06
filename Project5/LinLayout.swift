//
//  LinLayout.swift
//  Project5
//
//  Created by iKnet on 16/7/8.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class LinLayout: UICollectionViewFlowLayout {

    var itemW: CGFloat = UIScreen.mainScreen().bounds.size.width
    var itemH: CGFloat = 500
    
    override init() {
        super.init()
        
        self.itemSize = CGSizeMake(itemW, itemH)
        self.scrollDirection = .Horizontal
        self.minimumLineSpacing = 0
    }
    
    override func prepareLayout(){
        //设置边距(让第一张图片与最后一张图片出现在最中央)ps:这里可以进行优化
        let inset = (self.collectionView?.bounds.width ?? 0)  * 0.5 - self.itemSize.width * 0.5
        self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        //取出rect范围内所有的UICollectionViewLayoutAttributes，然而
        //我们并不关心这个范围内所有的cell的布局，我们做动画是做给人看的，
        //所以我们只需要取出屏幕上可见的那些cell的rect即可
        let array = super.layoutAttributesForElementsInRect(rect)
        
        //可见矩阵
        let visiableRect = CGRectMake(self.collectionView!.contentOffset.x, self.collectionView!.contentOffset.y, self.collectionView!.frame.width, self.collectionView!.frame.height)
        
        //接下来的计算是为了动画效果
        let maxCenterMargin = self.collectionView!.bounds.width * 0.5 + itemW * 0.5;
        //获得collectionVIew中央的X值(即显示在屏幕中央的X)
        let centerX = self.collectionView!.contentOffset.x + self.collectionView!.frame.size.width * 0.5;
        for attributes in array! {
            //如果不在屏幕上，直接跳过
            if !CGRectIntersectsRect(visiableRect, attributes.frame) {continue}
            let scale = 1 + (0.15 - abs(centerX - attributes.center.x) / maxCenterMargin)
            attributes.transform = CGAffineTransformMakeScale(0.9*scale, 0.9*scale)
        }
        
        return array
    }
    
}
