//
//  ExpenseDelegator.swift
//  EndProjectJorciney
//
//  Created by user116613 on 3/20/16.
//  Copyright © 2016 user116613. All rights reserved.
//

import Foundation
import RealmSwift

class ExpenseTrackerManager {
    
    //MARK: - Instatntiate the Singleton
    static let sharedInstance = ExpenseTrackerManager()
    
    let realm = try! Realm()
    
    
    
    
    //MARK: - Properties setup
    dynamic var expensesAmount=0 as Double
    dynamic var incomeAmount=0 as Double
    dynamic var billAmount=0 as Double
    dynamic var currentCategory=0 as Int
    let dateFormatter = NSDateFormatter()
    
    var categories: [Category]{
        return realm.objects(Category).arrayValue
    }
    
    var incomeArray: [Income]{
        return realm.objects(Income).arrayValue
    }
    var expenses: [Expense]{
        return realm.objects(Expense).arrayValue
    }
    
    
    
    
    
    
    
    
    //MARK: - Init/Constructors
    init(){
        //self.categories = [Category]()
        //self.expenses = [Expense]()
        //incomeArray = [Income]()
        setValues();
        setDefaultCategories()
        
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
        
        if !self.expenses.isEmpty{
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
        let food = Category(uuid:NSUUID(UUIDString: "12435CCB-4EA8-468C-B4EC-35FE45580B5C")!,title: "Food", imageName: "food")
        let car = Category(uuid:NSUUID(UUIDString: "6EF27029-9E9C-4FC0-A2E7-0187E1D56A3E")!,title: "Car", imageName: "car.jpg")
        let entertainment = Category(uuid:NSUUID(UUIDString: "27BB1797-8053-4B2E-A68E-620042ABE8BD")!,title: "Entertainment", imageName: "entertainment")
        let clothing = Category(uuid:NSUUID(UUIDString: "09818997-C50E-4E49-B667-C8990F0C80E7")!,title: "Clothing", imageName: "clothing1")
        let living = Category(uuid:NSUUID(UUIDString: "C85A718F-45BB-4F88-BCB5-6171E7D18937")!,title: "Living", imageName: "living1")
        let transportation = Category(uuid:NSUUID(UUIDString: "5E726347-9483-4809-87FC-E1095F114542")!,title: "Transportation", imageName: "transportation")
        let social = Category(uuid:NSUUID(UUIDString: "E9B18A54-2FFD-44C2-96FB-0624E0C4E80E")!,title: "Social", imageName: "social")
        let investments = Category(uuid:NSUUID(UUIDString: "CD234BF5-99FA-4110-8A53-DCDC948BCFD5")!,title: "Investment", imageName: "investment")
        let education = Category(uuid:NSUUID(UUIDString: "99C0DD44-D5CE-470E-A2ED-044C93EB79CE")!,title: "Education", imageName: "education")
        let medical = Category(uuid:NSUUID(UUIDString: "7C38413F-606E-4363-B57F-D3A8AF058C84")!,title: "Medical", imageName: "medical")
        let bills = Category(uuid:NSUUID(UUIDString: "478A64EA-2418-412C-BDEC-AF14BAEEE7F9")!,title: "Bills", imageName: "bills")
        let others = Category(uuid:NSUUID(UUIDString: "99C0DD44-D5CE-470E-A2ED-044C93EB79CE")!,title: "Others", imageName: "others")
        
        
        let expense1=Expense(uuid:NSUUID(UUIDString: "7C321563-3106-4807-AF94-ABE1CAAFC271")!,title: "Fuel", amount: 21, description: "Tak was empty, added gas", date: getParsedNSDateFromString("20-01-2016"))
        let expense2=Expense(uuid:NSUUID(UUIDString: "8F54C517-B4B2-4CA1-A120-D4766927A300")!,title: "Garage", amount: 950, description: "Side door repair")
        let expense3 = Expense(uuid:NSUUID(UUIDString: "77C87074-4B3E-493F-9017-F26D8AA4F43D")!,title: "LPG check", amount: 190, description: "LPG computer needed to be checked")
        let expense4 = Expense(uuid:NSUUID(UUIDString: "93CC0148-45CB-491E-9D4A-1C4A317AAB2B")!,title: "Furniture", amount: 210, description: "Bought table", date:getParsedNSDateFromString("17-02-2016"))
        
        let expense5 = Expense(uuid:NSUUID(UUIDString: "52CDD5DF-FFF5-42BB-99E0-A9F4958B6B0F")!,title: "Movies", amount: 15.50, description: "Went to the movies", date: getParsedNSDateFromString("20-01-2016"))
        
        let expense6=Expense(uuid:NSUUID(UUIDString: "D1180E05-3C9A-4858-A646-DD60C7F714BB")!,title: "Hair cut", amount: 15, description: "Hair cut", date: getParsedNSDateFromString("20-01-2016"))
        
        
        
        
        expense1.category=car
        expense2.category=car
        expense3.category=car
        expense4.category=living
        expense5.category=entertainment
        expense6.category=others
     
        
        
        
        try! realm.write {
            realm.create(Category.self, value: food, update: true)
            realm.create(Category.self, value: car, update: true)
            realm.create(Category.self, value: entertainment, update: true)
            realm.create(Category.self, value: clothing, update: true)
            realm.create(Category.self, value: living, update: true)
            realm.create(Category.self, value: transportation, update: true)
            realm.create(Category.self, value: social, update: true)
            realm.create(Category.self, value: investments, update: true)
            realm.create(Category.self, value: education, update: true)
            realm.create(Category.self, value: medical, update: true)
            realm.create(Category.self, value: bills, update: true)
            realm.create(Category.self, value: others, update: true)
            
            realm.create(Expense.self, value: expense1, update: true)
        }
        
    }
    
    func createCategory(cat: Category){
        try! realm.write {
            realm.create(Category.self, value: cat, update: true)
        }
    }
    func createExpense(exp: Expense){
        try! realm.write {
            realm.create(Expense.self, value: exp, update: true)
        }
    }
    
    
    func isCategoryAlreadyPresent(c : Category)->Bool{
        let found = categories.contains({ (cat) -> Bool in
            c.title == cat.title
        })
        return found;
    }
   
    
    
}
extension Results {
    
    var arrayValue:  [Results.Generator.Element] {
        var array = [T]()
        for item in self { array.append(item as Results.Generator.Element) }
        
        return array
    }
}