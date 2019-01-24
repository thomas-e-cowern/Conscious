//
//  QuizTableViewCell.swift
//  Conscious
//
//  Created by Hanadi AlOthman on 18/01/2019.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class QuizTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var checkBoxImage: UIImageView!
    
    // MARK: - Properties
    // Delegate
    var answerSelected: Bool = false {
        didSet{
            switchCheckboxImage()
        }
    }
    
    var answer: Answer? {
        didSet{
            updateViwes()
        }
    }
    
    // MARK: - Setup
    func updateViwes() {
        if let answer = answer {
            answerLabel.text = answer.rawValue
            switchCheckboxImage()
        }
    }
    
    func switchCheckboxImage() {
        checkBoxImage.image = answerSelected ? #imageLiteral(resourceName: "selectedAnswer") : #imageLiteral(resourceName: "unSelectedAnswer")
    }
}
