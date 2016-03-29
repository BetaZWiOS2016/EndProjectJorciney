//
//  ExpenseDelegator.swift
//  EndProjectJorciney
//
//  Created by user116613 on 3/20/16.
//  Copyright © 2016 user116613. All rights reserved.
//

import Foundation

class ExpenseTrackerManager {
    
    //MARK: - Instatntiate the Singleton
    static let sharedInstance = ExpenseTrackerManager()
    
    
    //MARK: - Properties setup
    var expensesAmount=0 as Double
    var incomeAmount=0 as Double
    var billAmount=0 as Double
    
    var categories: [Category]
    var expenses: [Expense]
    var incomeArray: [Income]
    
    var currentCategory=0 as Int
    
    
    
    
    //MARK: - Init/Constructors
    init(){
        self.categories = [Category]()
        self.expenses = [Expense]()
        self.incomeArray = [Income]()
        self.setValues();
        self.setDefaultCategories()
    }
    
    
    
    //MARK: - Functions: Getters
    func getBalance()->Double{
        
        return self.incomeAmount-(self.expensesAmount+self.billAmount)
    }
    
    
    //MARK: - Functions: Setters
    func setValues(){
        self.expensesAmount=0 as Double
        self.incomeAmount=0 as Double
        self.billAmount=0 as Double
        
        if !expenses.isEmpty{
            for e in expenses{
                expensesAmount+=e.amount
            }
        }
        if !incomeArray.isEmpty{
            for i in incomeArray{
                incomeAmount+=i.amount
            }
        }
    }
    
    
    func setDefaultCategories(){
        let food = Category(title: "Food", imageName: "food")
        let car = Category(title: "Car", imageName: "car.jpg")
        let entertainment = Category(title: "Entertainment", imageName: "entertainment")
        let clothing = Category(title: "Clothing", imageName: "clothing1")
        let living = Category(title: "Living", imageName: "living1")
        let transportation = Category(title: "Transportation", imageName: "transportation")
        let social = Category(title: "Social", imageName: "social")
        let investments = Category(title: "Investment", imageName: "investment2")
        let education = Category(title: "Education", imageName: "education")
        let medical = Category(title: "Medical", imageName: "medical")
        let bills = Category(title: "Bills", imageName: "bills")
        let others = Category(title: "Others", imageName: "others")
        
        self.categories.append(food)
        self.categories.append(car)
        self.categories.append(entertainment)
        self.categories.append(clothing)
        self.categories.append(living)
        self.categories.append(transportation)
        self.categories.append(social)
        self.categories.append(investments)
        self.categories.append(education)
        self.categories.append(medical)
        self.categories.append(bills)
        self.categories.append(others)
        
    }
    
    
    func isCategoryAlreadyPresent(c : Category)->Bool{
        let found = categories.contains({ (cat) -> Bool in
            c.title == cat.title
        })
        return found;
        
    }
    
    
    
    
}