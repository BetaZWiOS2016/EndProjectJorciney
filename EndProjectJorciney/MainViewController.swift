//
//  ViewController.swift
//  EndProjectJorciney
//
//  Created by user116613 on 3/18/16.
//  Copyright © 2016 user116613. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var expense:Expense?
    var category:Category?
    var income:Income?
    var singleton=ExpenseTrackerManager.sharedInstance;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Custom methods
    
    
    
    
    // MARK: - Action Buttons
    @IBAction func addExpenseButton(sender: UIButton) {
        category=Category(title: "Car")
        expense=Expense(title:"Qashqai", amount: 51 as Double, description: "Oil change", category:category! )
        if !self.singleton.isCategoryAlreadyPresent(category!){
            self.singleton.categories.append(category!)
        }
        self.singleton.expenses.append(expense!)
        category=Category(title: "Car")
        expense=Expense(title:"Citroen", amount: 90 as Double, description: "Repair", category:category! )
        if !self.singleton.isCategoryAlreadyPresent(category!){
            self.singleton.categories.append(category!)
        }
        self.singleton.expenses.append(expense!)
        category=Category(title: "Movies")
        expense=Expense(title:"Batman", amount: 15 as Double, description: "going to the movies", category:category! )
        if !self.singleton.isCategoryAlreadyPresent(category!){
            self.singleton.categories.append(category!)
        }
        self.singleton.expenses.append(expense!)
        for i in singleton.categories{
        print("Categorie title: \(i.title)")
        }
        for i in singleton.expenses{
            print("Expense title: \(i.title) Amount:\(i.amount)")
        }
        self.singleton.setValues()
        print("Total Amount: \(self.singleton.expensesAmount)")
        
    }
    @IBAction func deleteExpenseButton(sender: UIButton) {
    }
    @IBAction func addCategoryButton(sender: UIButton) {
    }
    @IBAction func deleteCategoryButton(sender: UIButton) {
    }
    @IBAction func addIncomeButton(sender: UIButton) {
    }
}

