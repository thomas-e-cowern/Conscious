//
//  QuizTableViewCell.swift
//  Conscious
//
//  Created by Hanadi AlOthman on 18/01/2019.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

protocol QuizTableViewCellDelegate: class {
    func cellButtonTapped(_ cell: QuizTableViewCell)
}

class QuizTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    @IBOutlet weak var answerLabel: UILabel!
    
    // Delegate
    weak var delegate: QuizTableViewCellDelegate?
    
    var answer: Answer? {
        didSet{
            updateViwes()
        }
    }
    
    // MARK: - Setup
    func updateViwes() {
        if let answer = answer {
           answerLabel.text = answer.rawValue
        }
    }
    
    // MARK: - Actions
    @IBAction func checkboxButtonTapped(_ sender: Any) {
        delegate?.cellButtonTapped(self)
    }
}
