//
//  ViewController.swift
//  Project5
//
//  Created by iKnet on 16/7/8.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   // @IBOutlet weak var backgroundImageView: UIImageView!
   // @IBOutlet weak var collectionView: UICollectionView!
    var backgroundImageView:UIImageView?
    
    private var interest = Interest.createInterests()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.backgroundImageView = UIImageView(frame:self.view.frame)
        self.backgroundImageView!.image = UIImage.init(contentsOfFile: "hello")
        self.view.addSubview(self.backgroundImageView!)
        
        let blurView = UIBlurEffect(style:.Light)
        let visualView = UIVisualEffectView(effect:blurView)
        visualView.frame = self.view.frame
        self.view.addSubview(visualView)
        
        let collectionView = UICollectionView(frame: CGRectMake(0, 70, self.view.bounds.width, 500), collectionViewLayout:LinLayout())
        collectionView.backgroundColor = UIColor.clearColor()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.pagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.registerClass(InterestCollectionViewCell.self, forCellWithReuseIdentifier: "InterestCell")
        self.view.addSubview(collectionView)
        
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }


}

extension ViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    
    func  numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interest.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("InterestCell", forIndexPath: indexPath) as! InterestCollectionViewCell
        
        cell.interest = self.interest[indexPath.item]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath){
        self.backgroundImageView?.image = self.interest[ indexPath.item].featuredImage
       
    }
}



