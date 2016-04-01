//
//  ExpensesPerCategoryViewController.swift
//  EndProjectJorciney
//
//  Created by user116613 on 3/29/16.
//  Copyright © 2016 user116613. All rights reserved.
//

import UIKit

class ExpensesPerCategoryViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    
    //MARK: - Property declaration
    var singleton=ExpenseTrackerManager.sharedInstance;
    var category:Category?

    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate=self
        self.tableView.dataSource=self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 
        return self.category?.expensesArray.count ?? 0
        //return 10;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell=self.tableView.dequeueReusableCellWithIdentifier("cellExpensePerCategoryIdentifier", forIndexPath: indexPath) as! ExpensesPerCategoryTableViewCell
        cell.setUpCell(self.category!.expensesArray[indexPath.row])
        return cell;
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
