//
//  QuizTableViewCell.swift
//  Conscious
//
//  Created by Hanadi AlOthman on 18/01/2019.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class QuizTableViewCell: UITableViewCell {

    // MARK: - Properties
    @IBOutlet weak var answerLabel: UILabel!
    
    var answer: Answer?{
        didSet{
            updateViwes()
        }
    }
    
    // MARK: - Setup
    func updateViwes() {
        guard let answer = answer else { return }
            //answerLabel.text = answer.rawValue
        }

    // MARK: - Actions
    @IBAction func checkboxButtonTapped(_ sender: Any) {
    }
}
