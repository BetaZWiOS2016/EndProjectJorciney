//
//  CategoriesViewController.swift
//  EndProjectJorciney
//
//  Created by user116613 on 3/29/16.
//  Copyright © 2016 user116613. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //MARK: - Property declaration
    var singleton=ExpenseTrackerManager.sharedInstance;
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate=self
        self.collectionView.dataSource=self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //MARK: - CollectionView LifeCycle
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;    }
    
    /*func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    
    }*/
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        let cell=collectionView.dequeueReusableCellWithReuseIdentifier("categoryIdentifier", forIndexPath: indexPath) as! CategoriesCollectionViewCell
        let category=self.singleton.categories[indexPath.row]
        self.singleton.currentCategory=indexPath.row
        cell.category=category
        return cell;
    }
    
    
    //remove the padding of the cells
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.singleton.categories.count;
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    
    //set the screensize
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width = self.collectionView.bounds.width / 3
        return CGSize(width: width, height: width)
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
