//
//  QuizTableViewCell.swift
//  Conscious
//
//  Created by Hanadi AlOthman on 18/01/2019.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

protocol QuizTableViewCellDelegate: class {
    func userDidSelect(answer: Answer)
    func userDidDeselectAnswer()
}

class QuizTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var checkboxButton: UIButton!
    
    // MARK: - Properties
    // Delegate
    weak var delegate: QuizTableViewCellDelegate?
    var answerSelected: Bool = false
    
    var answer: Answer? {
        didSet{
            updateViwes()
        }
    }
    
    // MARK: - Setup
    func updateViwes() {
        if let answer = answer {
            answerLabel.text = answer.rawValue
            switchCheckboxImage(for: answer)
        }
    }
    
    func toggleCell(with answer: Answer) {
        answerSelected.toggle()
        switchCheckboxImage(for: answer)
    }
    
    func switchCheckboxImage(for answer: Answer) {
        answerSelected ?  checkboxButton.setImage(#imageLiteral(resourceName: "selectedAnswer"), for: .normal) : checkboxButton.setImage(#imageLiteral(resourceName: "unSelectedAnswer"), for: .normal)
    }
    
    // MARK: - Actions
    @IBAction func checkboxButtonTapped(_ sender: Any) {
        guard let answer = answer else { return }
        toggleCell(with: answer)
    }
}
