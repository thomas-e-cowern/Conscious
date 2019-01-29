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
    
    
    var action: String? = ""
    var background: UIImage? = nil
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
