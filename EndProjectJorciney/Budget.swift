//
//  Budget.swift
//  EndProjectJorciney
//
//  Created by user116613 on 3/18/16.
//  Copyright © 2016 user116613. All rights reserved.
//

import Foundation

class Budget {
    //var income:Income
    //var bill:Bill
    //var expense:Expense
     static var expensesAmount=0 as Double
     static  var incomeAmount=0 as Double
     static var billAmount=0 as Double
    

    func getCurrentSaldo()->Double{
        return Budget.incomeAmount-(Budget.expensesAmount+Budget.billAmount)
    }
    
    
    
}