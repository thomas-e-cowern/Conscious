//
//  ActionTableViewCell.swift
//  Conscious
//
//  Created by Thomas Cowern New on 1/23/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class ActionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var actionViewCellButton: UIButton!
    @IBOutlet weak var actionViewCellLabel: UILabel!
    
    var actionTitle: String?
    var actionComplete: Bool? = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func checkboxChanged() {
        if actionComplete == false {
            actionComplete = true
            actionViewCellButton.setTitle("Done", for: .normal)
            print(MyActionsViewController.shared.actionsCompleted)
            MyActionsViewController.shared.actionsCompleted += 1
//            MyActionsViewController.shared.actionsCompleteLabel.text = "\(MyActionsViewController.shared.actionsCompleted)"
        } else {
            actionComplete = false
            actionViewCellButton.setTitle("Do", for: .normal)
            MyActionsViewController.shared.actionsCompleted -= 1
//            MyActionsViewController.shared.actionsCompleteLabel.text = "\(MyActionsViewController.shared.actionsCompleted)"
        }
        print("Actions Completed: \(MyActionsViewController.shared.actionsCompleted)")
    }
    
    @IBAction func actionViewCellButtonChecked(_ sender: Any) {
        checkboxChanged()
    }
    
}


