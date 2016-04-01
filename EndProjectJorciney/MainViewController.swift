//
//  ViewController.swift
//  EndProjectJorciney
//
//  Created by user116613 on 3/18/16.
//  Copyright © 2016 user116613. All rights reserved.
//

import UIKit
import ActionButton
import Charts


class MainViewController: UIViewController {
    var expense:Expense?
    var category:Category?
    @IBOutlet weak var barChartView: BarChartView!
    var income:Income?
    var singleton=ExpenseTrackerManager.sharedInstance;
    
    var categoryTitles = [String]()
    var expensesAmountPerCategory = [Double]()
    
    var actionButton:ActionButton!
    
    
    
    //MARK: - ViewDidLoad + FloatingButton
    override func viewDidLoad() {
        super.viewDidLoad()
        //Floating button
        actionButton = ActionButton(attachedToView: self.view, items: [])
        floatingButtonSetup()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.loadChartData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - Custom methods
    func loadChartData(){
        categoryTitles.removeAll(keepCapacity: true)
        expensesAmountPerCategory.removeAll(keepCapacity: true)
        //Chart
        let orderedCategoryTitles = ExpenseTrackerManager.sharedInstance.categories

        for c in orderedCategoryTitles{
            categoryTitles.append(c.title)
           
            self.expensesAmountPerCategory.append(c.expensesSum)
            
        }
        
        print(self.categoryTitles)
        print(self.expensesAmountPerCategory)
        setChart(self.categoryTitles, values: self.expensesAmountPerCategory)
    }
    
    func setChart(dataPoints: [String], values:[Double]){
        barChartView.noDataText="Data not available"
        
        var dataEntries:[BarChartDataEntry]=[]
        
        for i in 0..<dataPoints.count{
            let dataEntry=BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet=BarChartDataSet(yVals: dataEntries, label: "Amount per Category")
        let chartData=BarChartData(xVals: dataPoints, dataSet: chartDataSet)
        chartDataSet.colors=ChartColorTemplates.colorful()
        barChartView.data=chartData;
        
        
    }
    
    
    // MARK: - Action Buttons
    func floatingButtonSetup(){
        
        let categoryButton = ActionButtonItem(title: "Category", image: UIImage(named: "category")!)
        categoryButton.action = { item in
            let addCategoryController = self.storyboard?.instantiateViewControllerWithIdentifier("addCategory")
            self.navigationController?.pushViewController(addCategoryController!, animated: true)
            self.actionButton.toggleMenu()
            
        }
        
        
        let incomeButton = ActionButtonItem(title: "Income", image: UIImage(named: "income1")!)
        incomeButton.action = { item in print("Category...") }
        
        let expenseButton = ActionButtonItem(title: "Expense", image: UIImage(named: "bill")!)
        expenseButton.action = { item in
            let addExpenseController = self.storyboard?.instantiateViewControllerWithIdentifier("addExpenseController")
            self.navigationController?.pushViewController(addExpenseController!, animated: true)
            self.actionButton.toggleMenu()
        }
        
        
        actionButton = ActionButton(attachedToView: self.view, items: [categoryButton, expenseButton /*,incomeButton*/])
        actionButton.action = { button in button.toggleMenu() }
        actionButton.setTitle("+", forState: .Normal)
        actionButton.backgroundColor = UIColor(red: 238.0/255.0, green: 130.0/255.0, blue: 34.0/255.0, alpha:1.0)
        
    }
}

