//
//  QuizViewController.swift
//  Conscious
//
//  Created by Hanadi AlOthman on 17/01/2019.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var quizProgressView: UIProgressView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    
    // MARK: - Properties
    var food: Food?
    var house: House?
    var travel: Travel?
    var question: Question?
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        updateViews()
    }
    
    // MARK: - Setup
    func updateViews() {
        categoryLabel.text = question?.category.rawValue
        questionLabel.text = question?.text
        
    }
    
    // MARK: - Actions
    @IBAction func skipButtonTapped(_ sender: Any) {
    }
    
    
    @IBAction func nextButtonTapped(_ sender: Any) {
    }
    
    
    @IBAction func previousButtonTapped(_ sender: Any) {
    }
    
}

extension QuizViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return question?.possibleAnswers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "answerCell", for: indexPath) as! QuizTableViewCell
        let answer = question?.possibleAnswers[indexPath.row]
        cell.answer = answer
        return cell
    }
}
