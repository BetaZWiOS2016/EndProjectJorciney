//
//  Expenses.swift
//  EndProjectJorciney
//
//  Created by user116613 on 3/18/16.
//  Copyright © 2016 user116613. All rights reserved.
//

import Foundation

class Expense: CustomDebugStringConvertible {
    
    var title: String
    var amount: Double
    var description:String
    var category: Category
    var date:NSDate
    var uuid = NSUUID().UUIDString
    
    var debugDescription: String{
        return "\(title)  - \(date)"
    }
    
    init(title:String, amount:Double, description:String, category:Category){
        self.title=title;
        self.amount=amount;
        self.description=description
        self.category=category
        self.date=NSDate()
        self.category.expensesArray.append(self)
        uuid = NSUUID().UUIDString
    }
    init(title:String, amount:Double, description:String, category:Category, date:NSDate){
        self.title=title;
        self.amount=amount;
        self.description=description
        self.category=category
        self.date=date
        self.category.expensesArray.append(self)
        uuid = NSUUID().UUIDString
    }
    init(title:String, amount:Double, description:String, category:Category, date:String){
        self.title=title;
        self.amount=amount;
        self.description=description
        self.category=category
        self.date=getParsedNSDateFromString(date)
        self.category.expensesArray.append(self)
        uuid = NSUUID().UUIDString
    }
    
    
}


