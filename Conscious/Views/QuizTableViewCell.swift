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
    
    // MARK: - Outlets
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var checkboxButton: UIButton!
    
    // DelegatecheckboxButton
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
    
//    func toggleCell(with answer: Answer){
//        if answer.rawValue {
//            checkboxButton.setBackgroundImage(#imageLiteral(resourceName: "selectedAnswer"), for: .normal)
//        } else {
//            checkboxButton.setBackgroundImage(#imageLiteral(resourceName: "unSelectedAnswer"), for: .normal)
//        }
//    }
    
    // MARK: - Actions
    @IBAction func checkboxButtonTapped(_ sender: Any) {
        delegate?.cellButtonTapped(self)
    }
}
