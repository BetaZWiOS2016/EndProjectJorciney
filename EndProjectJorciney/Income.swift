//
//  Income.swift
//  EndProjectJorciney
//
//  Created by user116613 on 3/18/16.
//  Copyright © 2016 user116613. All rights reserved.
//

import Foundation
import RealmSwift

class Income:Object {
    dynamic var title: String=""
    dynamic var amount: Double=0
    dynamic var uuid :String=""
    
    
    convenience init(title:String, amount:Double){
        self.init()
        self.title=title;
        self.amount=amount;
        uuid = NSUUID().UUIDString
    }
    override class func primaryKey() -> String {
        return "uuid"
    }
}
