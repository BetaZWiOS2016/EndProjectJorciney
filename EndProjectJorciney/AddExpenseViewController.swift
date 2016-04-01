//
//  AddExpenseViewController.swift
//  EndProjectJorciney
//
//  Created by user116613 on 3/31/16.
//  Copyright © 2016 user116613. All rights reserved.
//

import UIKit

class AddExpenseViewController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate{
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    let pickerDataSource = ExpenseTrackerManager.sharedInstance.categories
    var category:Category?
    
    @IBOutlet weak var categoryPickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryPickerView.selectRow(4, inComponent: 0, animated: true)
 
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //MARK: - Action Buttons
    @IBAction func saveButton(sender: UIButton) {
        self.datePicker.resignFirstResponder()
        var date=datePicker.date
        
        var tempExpense=Expense(title: self.titleTextField.text! ?? "Ramdon", amount: Double(self.amountTextField.text!) ?? 0, description: self.descriptionTextField.text! ?? "", date: date )
        tempExpense.category=self.category
        
        ExpenseTrackerManager.sharedInstance.createExpense(tempExpense)
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    
    
    //MARK: - PickerView Lifecycle
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerDataSource.count;
    }
    
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        titleTextField.resignFirstResponder()
        descriptionTextField.resignFirstResponder()
        amountTextField.resignFirstResponder()
        return self.pickerDataSource[row].title
    }
    
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        category=pickerDataSource[row]
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
