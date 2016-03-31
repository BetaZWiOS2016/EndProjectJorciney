//
//  Category.swift
//  EndProjectJorciney
//
//  Created by user116613 on 3/18/16.
//  Copyright © 2016 user116613. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object{
    dynamic var title: String = ""
    dynamic var imageName: String=""
    let expensesArray = List<Expense>()
    dynamic var uuid :String=""
   
    convenience init( title : String ){
        self.init()
        self.title = title;
        self.imageName = ""
        uuid = NSUUID().UUIDString
    }
    
    
    
    convenience init(title:String, imageName:String){
        self.init()
        self.title=title;
        self.imageName=imageName;
        uuid = NSUUID().UUIDString
    }
    
    convenience init(uuid: NSUUID, title:String, imageName:String){
        self.init()
        self.title=title;
        self.imageName=imageName;
        self.uuid = uuid.UUIDString
    }
    
    
    convenience init(title:String, imageName:String, expense: Expense){
        self.init()
        self.title=title;
        self.imageName=imageName;
        self.expensesArray.append(expense)
        uuid = NSUUID().UUIDString
    }
    
    override class func primaryKey() -> String {
        return "uuid"
    }
    
    
}