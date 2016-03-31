//
//  Expenses.swift
//  EndProjectJorciney
//
//  Created by user116613 on 3/18/16.
//  Copyright © 2016 user116613. All rights reserved.
//

import Foundation
import RealmSwift

class Expense: Object{
    
    dynamic var title: String=""
    dynamic var amount: Double=0
    dynamic var date:NSDate=NSDate()
    dynamic var uuid:String=""
    dynamic var desc:String=""
    var category: Category?{
        return linkingObjects(Category.self, forProperty: "expensesArray").first
    }
    
    convenience init(title:String, amount:Double, description:String, category:Category){
        self.init()
        self.title=title;
        self.amount=amount;
        self.date=NSDate()
        self.uuid = NSUUID().UUIDString
        self.desc=description
        category.expensesArray.append(self)
    }
    convenience init(title:String, amount:Double, description:String){
        self.init()
        self.title=title;
        self.amount=amount;
        self.date=NSDate()
        self.uuid = NSUUID().UUIDString
        self.desc=description
    }
    convenience init(uuid: NSUUID, title:String, amount:Double, description:String){
        self.init()
        self.title=title;
        self.amount=amount;
        self.date=NSDate()
        self.uuid = uuid.UUIDString
        self.desc=description
    }

    convenience init(title:String, amount:Double, description:String, category:Category, date:NSDate){
        self.init()
        self.title=title;
        self.amount=amount;
        self.date=date
        self.uuid = NSUUID().UUIDString
        self.desc=description
        category.expensesArray.append(self)
    }
    convenience init(title:String, amount:Double, description:String, date:NSDate){
        self.init()
        self.title=title;
        self.amount=amount;
        self.date=date
        self.uuid = NSUUID().UUIDString
        self.desc=description
    }
    convenience init(uuid: NSUUID,title:String, amount:Double, description:String, date:NSDate){
        self.init()
        self.title=title;
        self.amount=amount;
        self.date=date
        self.uuid = uuid.UUIDString
        self.desc=description
    }
    override class func primaryKey() -> String {
        return "uuid"
    }
    
}


