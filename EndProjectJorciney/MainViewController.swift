//
//  ViewController.swift
//  EndProjectJorciney
//
//  Created by user116613 on 3/18/16.
//  Copyright © 2016 user116613. All rights reserved.
//

import UIKit
import ActionButton

class MainViewController: UIViewController {
    var expense:Expense?
    var category:Category?
    var income:Income?
    var singleton=ExpenseTrackerManager.sharedInstance;
    
    var actionButton:ActionButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //MARK: - Floating button
        actionButton = ActionButton(attachedToView: self.view, items: [])
        
        floatingButtonSetup()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - Custom methods
    
    
    
    
    // MARK: - Action Buttons
    func floatingButtonSetup(){
        let categoryButton = ActionButtonItem(title: "Category", image: UIImage(named: "category")!)
        categoryButton.action = { item in print("Category...") }
        
        
        let incomeButton = ActionButtonItem(title: "Income", image: UIImage(named: "income1")!)
        categoryButton.action = { item in print("Category...") }
        
        let expenseButton = ActionButtonItem(title: "Expense", image: UIImage(named: "bill")!)
        expenseButton.action = { item in print("Expense...") }
        
        
        actionButton = ActionButton(attachedToView: self.view, items: [categoryButton, expenseButton, incomeButton])
        actionButton.action = { button in button.toggleMenu() }
        actionButton.setTitle("+", forState: .Normal)
        actionButton.backgroundColor = UIColor(red: 238.0/255.0, green: 130.0/255.0, blue: 34.0/255.0, alpha:1.0)
        
    }
}

