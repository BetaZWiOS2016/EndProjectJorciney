//
//  Income.swift
//  EndProjectJorciney
//
//  Created by user116613 on 3/18/16.
//  Copyright © 2016 user116613. All rights reserved.
//

import Foundation
class Income {
    var title: String
    var amount: Double
     var incomeArray:[Income]
    
    
    init(title:String, amount:Double){
        self.title=title;
        self.amount=amount;
        self.incomeArray=[Income]()
        self.incomeArray.append(self)
        Budget.incomeAmount+=amount
    }
}
