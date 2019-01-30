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
    
    @IBOutlet weak var actionTableViewImage: UIImageView!
    @IBOutlet weak var actionViewCellButton: UIButton!
    @IBOutlet weak var actionViewCellLabel: UILabel!
    
    var action: ActionPlanDetail?
    var actionTitle: String?
    var actionComplete: Bool? = false
    var buttonStatus: Bool = false
    weak var delegate: ActionTableViewCellDelegate?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // change button status
    
    func changeButtonImage() {
        print("Change button image")
        if actionComplete == false {
            actionComplete = true
            switch action?.icon {
            case "Food":
                actionTableViewImage.image = UIImage(named: "Foodchecked")
            case "house":
                actionTableViewImage.image = UIImage(named: "Homechecked")
            default:
                actionTableViewImage.image = UIImage(named: "Travelchecked")
            }
        } else {
            actionComplete = false
            switch action?.icon {
            case "Food":
                actionTableViewImage.image = UIImage(named: "FoodUnchecked")
            case "house":
                actionTableViewImage.image = UIImage(named: "HomeUnchecked")
            default:
                actionTableViewImage.image = UIImage(named: "TravelUnchecked")
            }
        }
    }
    
    // change attributedString
    func changeString() {
        print("Change button string")
        guard let action = action else { return }
        let testTitle = action.action
        let attributedString = NSMutableAttributedString(string: testTitle)
        if actionComplete == true {
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
        changeButtonImage()
        changeString()
    }
    
}


