//
//  Expenses.swift
//  EndProjectJorciney
//
//  Created by user116613 on 3/18/16.
//  Copyright © 2016 user116613. All rights reserved.
//

import Foundation

class Expense {
    
    var title: String
    var amount: Double
    var description:String
    var category: Category
    var date:NSDate
    
    
    init(title:String, amount:Double, description:String, category:Category){
        self.title=title;
        self.amount=amount;
        self.description=description
        self.category=category
        self.date=NSDate()
    }
}


