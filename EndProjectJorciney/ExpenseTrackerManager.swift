//
//  ExpenseDelegator.swift
//  EndProjectJorciney
//
//  Created by user116613 on 3/20/16.
//  Copyright © 2016 user116613. All rights reserved.
//

import Foundation
import Firebase

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
    let dateFormatter = NSDateFormatter()
    //var ref = Firebase(url: "https://trackexpenseios.firebaseio.com/")
    //var expensesDictionary:NSDictionary<Int, Expense>
    
    
    
    
    //MARK: - Init/Constructors
    init(){
        self.categories = [Category]()
        self.expenses = [Expense]()
        self.incomeArray = [Income]()
        //self.expensesDictionary=NSDictionary<Int, Expense>()
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
        let investments = Category(title: "Investment", imageName: "investment")
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

        self.expenses.append(Expense(title: "Fuel", amount: 21, description: "Tak was empty, added gas", category: car, date: "20-01-2016"))
        self.expenses.append(Expense(title: "Garage", amount: 950, description: "Side door repair", category: car))
        self.expenses.append(Expense(title: "LPG check", amount: 190, description: "LPG computer needed to be checked", category: car))
        self.expenses.append(Expense(title: "Furniture", amount: 210, description: "Bought table", category: living, date: "17-02-2016"))
        self.expenses.append(Expense(title: "Movies", amount: 15.50, description: "Went to the movies", category: entertainment, date: "20-01-2016"))
        
        self.expenses.append(Expense(title: "Hair cut", amount: 15, description: "Hair cut", category: others, date: "20-01-2016"))
        //self.addToDb()
        
    }
    
    
    func isCategoryAlreadyPresent(c : Category)->Bool{
        let found = categories.contains({ (cat) -> Bool in
            c.title == cat.title
        })
        return found;
    }
   
    func getFormatedDate(date: NSDate)->String{
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.dateFormat="dd/MM/yyyy"
        return dateFormatter.stringFromDate(date)
    }
    
    func getParsedNSDateFromString(dateStr:String) -> NSDate {
        var dateFmt = NSDateFormatter()
        dateFmt.timeZone = NSTimeZone.defaultTimeZone()
        dateFmt.dateFormat = "dd/MM/yyyy"
        return dateFmt.dateFromString(dateStr)!
    }
    /*
    func addToDb(){
        for var i = 0; i < self.expenses.count; i++ {
            self.expensesDictionary[i]=self.expenses[i]
        }

        
    
    var usersRef = ref.childByAppendingPath("users")

    usersRef.setValue(expenses as NSArray)
    }*/
    
}