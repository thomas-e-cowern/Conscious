//
//  ActionDetailViewController.swift
//  Conscious
//
//  Created by Thomas Cowern New on 1/18/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class ActionDetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var addToActionListButton: UIButton!
    @IBOutlet weak var actionTitleLabel: UILabel!
    @IBOutlet weak var actionSummaryLabel: UILabel!
    @IBOutlet weak var actionBenefitsLabel: UILabel!
    @IBOutlet weak var chllengeDetail: UILabel!
    @IBOutlet weak var co2ReductionLabel: UILabel!
    @IBOutlet weak var moneySavedLabel: UILabel!
    @IBOutlet weak var actionImageView: UIImageView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var co2Icon: UIImageView!
    @IBOutlet weak var moneySavedIconImageView: UIImageView!
    @IBOutlet weak var bgView: UIView!
    
    // MARK: - Properties
    var action: ActionPlanDetail?
    var buttonActive: Bool = true
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addToActionListButton.addDropShadow()
        bgView.addDropShadow()
        bgView.layer.masksToBounds = false
        updateViews()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        if let navController = self.navigationController as? TransparentNavigationController {
//            navController.setupViews()
//        }
//    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let navController = self.navigationController as? TransparentNavigationController {
            navController.setupViews()
//            navController.view.tintColor = .purple
//            navController.navigationBar.barStyle = .default
//            navController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.clear]
//            navController.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.clear]
//            navController.navigationBar.tintColor = .red
//            navController.navigationBar.barTintColor = .blue
//            navController.view.backgroundColor = .orange
//            navController.navigationItem.rightBarButtonItem?.tintColor = .white
//            navController.navigationItem.leftBarButtonItem?.tintColor = .white
//
        }
    }
    
    // MARK: - Setup
    func updateViews() {
        guard let action = action else { return }
        let imageTitle = "\(action.action)"
        actionTitleLabel.text = action.action
        actionSummaryLabel.text = action.actionSummry
        chllengeDetail.text = action.challenge
        actionBenefitsLabel.text = action.benefits
        co2ReductionLabel.text = "\(action.carbonReduction ?? 0.0) lbs CO2e Saved"
        moneySavedLabel.text = "$\(action.costSavings ?? 0.0) Saved"
        actionImageView.image = UIImage(named: imageTitle)
        
        if buttonActive == false {
            addToActionListButton.isEnabled = false
            addToActionListButton.setTitle("Added to List", for: .normal)
            addToActionListButton.backgroundColor = #colorLiteral(red: 0.3450980392, green: 0.3215686275, blue: 0.3215686275, alpha: 1)
            addToActionListButton.setTitleColor(.white, for: .normal)
            doneButton.isHidden = false
            
        } else {
            addToActionListButton.isEnabled = true
            addToActionListButton.setTitle("Add to List", for: .normal)
            addToActionListButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            addToActionListButton.setTitleColor(.black, for: .normal)
            doneButton.isHidden = true
        }
        
        if action.icon == "Food" {
            print("Food")
            backgroundView.backgroundColor = #colorLiteral(red: 0.9399999976, green: 0.4199999869, blue: 0.3400000036, alpha: 1)
        } else if self.action?.icon == "house" {
            print("House")
            backgroundView.backgroundColor = #colorLiteral(red: 0.4900000095, green: 0.8299999833, blue: 0.6899999976, alpha: 1)
        } else {
            print("Travel")
            backgroundView.backgroundColor = #colorLiteral(red: 1, green: 0.7599999905, blue: 0.02999999933, alpha: 1)
        }
    }
    
    // MARK: - Actions
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true )
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addToActionListButtonTapped(_ sender: Any) {

            guard let action = action else { return }
            ActionsAlarmController.shared.addAlarm(fireDate: Date(), name: action.action, message: action.actionSummry, enabled: true, frequency: action.frequency, repeats: true)
            action.added = true
            ActionPlanController.shared.userActionList.append(action)
            ActionPlanController.shared.addNewActions(action: action)
            ActionPlanController.shared.reductionInCost += action.costSavings ?? 0.0
            addToActionListButton.setTitle("Added to List", for: .normal)
            addToActionListButton.isEnabled = false
            addToActionListButton.backgroundColor = #colorLiteral(red: 0.3450980392, green: 0.3215686275, blue: 0.3215686275, alpha: 1)
            addToActionListButton.setTitleColor(.white, for: .normal)
        }

}
