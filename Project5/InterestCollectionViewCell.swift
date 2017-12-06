//
//  InterestCollectionViewCell.swift
//  Project5
//
//  Created by iKnet on 16/7/8.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
    
//    @IBOutlet weak var featuredImageView: UIImageView!
//    @IBOutlet weak var intertstTitleLab: UILabel!
    
    let featuredImageView = UIImageView(frame:CGRectMake(40, 30, UIScreen.mainScreen().bounds.size.width - 80, 440))
    let intertstTitleLab = UILabel(frame:CGRectMake(0, 400, UIScreen.mainScreen().bounds.size.width - 80, 30))
    
    
    var interest: Interest! {
        didSet{
            updateUI()
        }
    }
    
    private func updateUI() {
        self.intertstTitleLab.text = interest.title
        self.featuredImageView.image = interest.featuredImage
        
        self.addSubview(featuredImageView)
        self.featuredImageView.addSubview(intertstTitleLab)

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.featuredImageView.layer.cornerRadius = 5.0
        self.featuredImageView.clipsToBounds = true
        
        self.intertstTitleLab.alpha = 0.9
        self.intertstTitleLab.backgroundColor = UIColor.lightGrayColor()
    }
}
