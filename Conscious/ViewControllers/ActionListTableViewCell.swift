//
//  ActionListTableViewCell.swift
//  Conscious
//
//  Created by Thomas Cowern New on 1/28/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class ActionListTableViewCell: UITableViewCell {

    @IBOutlet weak var listCellImage: UIImageView!
    @IBOutlet weak var listCellLabel: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.addDropShadow()
    }
    var action: String? = ""
    var background: UIImage? = nil
}
