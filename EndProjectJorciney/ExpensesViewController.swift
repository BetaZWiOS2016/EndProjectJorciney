//
//  ExpensesViewController.swift
//  EndProjectJorciney
//
//  Created by user116613 on 3/29/16.
//  Copyright © 2016 user116613. All rights reserved.
//

import UIKit

class ExpensesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //MARK: - Properties declaration
    @IBOutlet weak var tableView: UITableView!
    
    var datasource=[[Expense]]()
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate=self
        self.tableView.dataSource=self
        let nib = UINib(nibName: "TableSectionHeader", bundle: nil)
        tableView.registerNib(nib, forHeaderFooterViewReuseIdentifier: "TableSectionHeader")
        
    setHeaderArray()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - TableView LifeCycle
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.datasource.count
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datasource[section].count;
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell=self.tableView.dequeueReusableCellWithIdentifier("expenseCellIdentifier") as! ExpensesTableViewCell
        let currentSection=self.datasource[indexPath.section]
        
        cell.setUpCell(currentSection[indexPath.row])
        return cell
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // Dequeue with the reuse identifier
        let cell = self.tableView.dequeueReusableHeaderFooterViewWithIdentifier("TableSectionHeader")
        let header = cell as! TableViewHeaderCell
        header.titleLabel.text = getFormatedDate(self.datasource[section].first?.date ?? NSDate())

        return cell
    }
    
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 50
    }
    
    
    
    func setHeaderArray(){
        /*for e in ExpenseTrackerManager.sharedInstance.expenses{
            tempTitles.append(self.singleton.getFormatedDate(e.date))
        }
        if tempTitles.count>0{
            self.headerTitles.append(tempTitles[0])
        }
        for e in self.tempTitles{
            if(isStringAlreadyPresentInArray(e, array: self.headerTitles)==false){
                self.headerTitles.append(e)
            }
        }*/
        
        let orderedExpenses = ExpenseTrackerManager.sharedInstance.expenses.sort({$0.date.compare($1.date) == NSComparisonResult.OrderedAscending })
        
        var currentDate=""
        if let firstElement =  orderedExpenses.first{
            currentDate = getFormatedDate(firstElement.date)
        }
        var currentSection = [Expense]()
      
        for e in orderedExpenses{
            
            let expenseDate=getFormatedDate(e.date)
            
            if expenseDate != currentDate{
                self.datasource.append(currentSection)
                currentDate=expenseDate;
                currentSection = [Expense]()
                
            }
            
            currentSection.append(e)
        }
        self.datasource.append(currentSection)
        print(datasource)
    }
    
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
