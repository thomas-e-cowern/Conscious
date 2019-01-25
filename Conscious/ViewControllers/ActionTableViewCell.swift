//
//  ActionTableViewCell.swift
//  Conscious
//
//  Created by Thomas Cowern New on 1/23/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

protocol ActionTableViewCellDelegate: class{
    func actionChecked(for cell: ActionTableViewCell)
    func actionUnchecked(for cell: ActionTableViewCell)
    func co2ReductionAdded(for cell: ActionTableViewCell, co2: Double)
    func co2ReductionRemoved(for cell: ActionTableViewCell, co2: Double)
}

class ActionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var actionViewCellButton: UIButton!
    @IBOutlet weak var actionViewCellLabel: UILabel!
    
    var actionTitle: String?
    var co2Amount: Double?
    var actionComplete: Bool? = false
    weak var delegate: ActionTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func checkboxChanged() {
        guard let testTitle = actionViewCellLabel.text, let co2Amount = co2Amount else { return }
        let attributedString = NSMutableAttributedString(string: testTitle)
        if actionComplete == false {
            actionComplete = true
            actionViewCellButton.setTitle("Done", for: .normal)
            delegate?.actionChecked(for: self)
            delegate?.co2ReductionAdded(for: self, co2: co2Amount)
            attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length))
            actionViewCellLabel.attributedText = attributedString
        } else {
            actionComplete = false
            actionViewCellButton.setTitle("Do", for: .normal)
            delegate?.actionUnchecked(for: self)
            delegate?.co2ReductionRemoved(for: self, co2: co2Amount)
            attributedString.removeAttribute(NSAttributedString.Key.strikethroughStyle, range: NSRange(location: 0, length: attributedString.length))
            actionViewCellLabel.attributedText = attributedString
        }
    }
    // change button status
    // change attributedString
    
    @IBAction func actionViewCellButtonChecked(_ sender: Any) {
        checkboxChanged()
    }
    
}


