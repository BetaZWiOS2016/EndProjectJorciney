//
//  CategoriesCollectionViewCell.swift
//  EndProjectJorciney
//
//  Created by user116613 on 3/29/16.
//  Copyright © 2016 user116613. All rights reserved.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryIcon: UIImageView!
    @IBOutlet weak var categoryIconName: UILabel!
    
    var category: Category?{
        didSet{
            if let category = category{
                self.categoryIconName.text=category.title
                self.categoryIcon.image=UIImage(named:category.imageName)
            }
        }
    }
}