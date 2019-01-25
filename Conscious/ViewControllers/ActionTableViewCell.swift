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
}

class ActionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var actionViewCellButton: UIButton!
    @IBOutlet weak var actionViewCellLabel: UILabel!
    
    var actionTitle: String?
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
        changeButtonImage()
        changeString()
    }
    // change button status
    
    func changeButtonImage() {
        if actionComplete == true {
            actionViewCellButton.setTitle("Done", for: .normal)
        } else {
            actionViewCellButton.setTitle("Do", for: .normal)
        }
    }
    
    // change attributedString
    func changeString() {
        guard let testTitle = actionViewCellLabel.text else { return }
        let attributedString = NSMutableAttributedString(string: testTitle)
        if actionComplete == false {
            delegate?.actionChecked(for: self)
            attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length))
            actionViewCellLabel.attributedText = attributedString
        } else {
            delegate?.actionUnchecked(for: self)
            attributedString.removeAttribute(NSAttributedString.Key.strikethroughStyle, range: NSRange(location: 0, length: attributedString.length))
            actionViewCellLabel.attributedText = attributedString
        }
    }
    
    
    @IBAction func actionViewCellButtonChecked(_ sender: Any) {
        checkboxChanged()
    }
    
}


