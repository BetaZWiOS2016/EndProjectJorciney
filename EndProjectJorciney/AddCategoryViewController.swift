//
//  AddCategoryViewController.swift
//  EndProjectJorciney
//
//  Created by user116613 on 3/31/16.
//  Copyright © 2016 user116613. All rights reserved.
//

import UIKit

class AddCategoryViewController: UIViewController {
    
    
    var pickerDataSource = ["car", "car2", "bill", "bills", "clothing", "clothing2", "food2", "income1", "income2", "investment","ios", "investiment2", "living", "living1", "living2", "medical", "money", "personal", "social", "transportation"];
    
    var icon:String = ""
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var iconPickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view
        iconPickerView.selectRow(4, inComponent: 0, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Save Button
    @IBAction func saveButton(sender: UIButton) {
        let title=titleTextField.text
        ExpenseTrackerManager.sharedInstance.createCategory(Category(title: title!, imageName: icon))
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
        
        return pickerDataSource[row]
    }
    
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        icon=pickerDataSource[row]    }
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
