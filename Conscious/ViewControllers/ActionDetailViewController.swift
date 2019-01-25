//
//  ActionDetailViewController.swift
//  Conscious
//
//  Created by Thomas Cowern New on 1/18/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class ActionDetailViewController: UIViewController {

    // MARK: - Properties
    var action: ActionPlanDetail?
    
    // MARK: - Outlets
    @IBOutlet weak var addToActionListButton: UIButton!
    @IBOutlet weak var actionTitleLabel: UILabel!
    @IBOutlet weak var actionSummaryLabel: UILabel!
    @IBOutlet weak var actionBenefitsLabel: UILabel!
    @IBOutlet weak var co2ReductionLabel: UILabel!
    @IBOutlet weak var moneySavedLabel: UILabel!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        actionTitleLabel.text = action?.action
        actionSummaryLabel.text = action?.actionSummry
        actionBenefitsLabel.text = action?.benefits
        co2ReductionLabel.text = "\(action?.carbonReduction ?? 0.0) lbs CO2e Saved"
        moneySavedLabel.text = "$\(action?.costSavings ?? 0.0) Saved"
    }
 
    // MARK: - Actions")
    @IBAction func addToActionListButtonTapped(_ sender: Any) {
        guard let action = action else { return }
        addToActionListButton.setTitle("Added to Action List", for: .normal)
        ActionsAlarmController.shared.addAlarm(fireDate: Date(), name: action.action, message: action.actionSummry, enabled: true, frequency: action.frequency, repeats: true)
        ActionPlanController.shared.userActionList.append(action)
         //ActionPlanController.shared.reductionInCo2 += action.carbonReduction ?? 0.0
        ActionPlanController.shared.reductionInCost += action.costSavings ?? 0.0
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
        
    }
}
