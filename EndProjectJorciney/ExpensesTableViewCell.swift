//
//  ExpensesTableViewCell.swift
//  EndProjectJorciney
//
//  Created by user116613 on 3/30/16.
//  Copyright © 2016 user116613. All rights reserved.
//

import UIKit

class ExpensesTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var categoryImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUpCell(expense:Expense){
        self.categoryImageView.image=UIImage(named:expense.category.imageName)
        self.titleLabel.text=expense.title
        //self.dateLabel.text=ExpenseTrackerManager.sharedInstance.getFormatedDate(expense.date)
        self.amountLabel.text=String(format: "%.2f €", expense.amount)
        self.descriptionLabel.text=expense.description

    }

}
