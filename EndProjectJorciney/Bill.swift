//
//  Bills.swift
//  EndProjectJorciney
//
//  Created by user116613 on 3/18/16.
//  Copyright © 2016 user116613. All rights reserved.
//

import Foundation
class Bill {
    var title: String
    var amount: Double
    var bills:[Bill]
    
    
    init(title:String, amount:Double){
        self.title=title;
        self.amount=amount;
        self.bills=[Bill]()
        self.bills.append(self)
        Budget.billAmount+=amount
    }
}