//
//  Category.swift
//  EndProjectJorciney
//
//  Created by user116613 on 3/18/16.
//  Copyright © 2016 user116613. All rights reserved.
//

import Foundation


class Category {
    var title: String
    var imageName: String
    var expensesArray:[Expense]
    var categories:[Category]
    
    init(title:String, imageName:String){
        self.title=title;
        self.imageName=imageName;
        self.expensesArray=[Expense]()
        self.categories=[Category]()
        self.categories.append(self)
        
    }

    
    
    init(title:String, imageName:String, expense: Expense){
        self.title=title;
        self.imageName=imageName;
        self.expensesArray=[Expense]()
        self.expensesArray.append(expense)
        self.categories=[Category]()
        self.categories.append(self)
    }
}