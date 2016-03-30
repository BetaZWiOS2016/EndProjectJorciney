//
//  ExpensesPerCategoryTableViewCell.swift
//  EndProjectJorciney
//
//  Created by user116613 on 3/29/16.
//  Copyright © 2016 user116613. All rights reserved.
//

import UIKit

class ExpensesPerCategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setUpCell(expense:Expense){
        self.titleLabel.text=expense.title
        self.dateLabel.text=ExpenseTrackerManager.sharedInstance.getFormatedDate(expense.date)
        self.amountLabel.text=String(format: "%.2f €", expense.amount)
        self.descriptionLabel.text=expense.description
    }
    
}
