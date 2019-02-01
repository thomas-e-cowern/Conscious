//
//  FootPrintViewController.swift
//  Conscious
//
//  Created by Hanadi AlOthman on 25/01/2019.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit
import Charts

class FootPrintViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var progressChartView: LineChartView!
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var co2Label: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    
    // MARK: - Properties
    var weeks: [Int] = []
    var completionPercent: [Double] = []
    var results: [SavedData] = []
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.progressChartView.delegate = self
        results = ActionPlanController.shared.loadFromPersistenceStore(path: "data")
        
        // SavedData
        for i in 0..<results.count {
            completionPercent.append(results[i].overallScore / 12)
        }
        print("‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️\(completionPercent)‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️")
        for i in 0..<results.count {
            weeks.append(i+1)
        }
        setUpLineChart()
        setChartData(weeks: weeks)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        updateViews()
    }
    
    // MARK: - Setup
    func setUpLineChart() {
        self.progressChartView.noDataText = "Haven't take the Quiz yet"
        let lXAxis = ChartLimitLine(limit: 5, label: "Weeks")
        lXAxis.lineWidth = 5
        lXAxis.labelPosition = .rightBottom
        lXAxis.valueFont = .systemFont(ofSize: 10)
        progressChartView.xAxis.drawGridLinesEnabled = false
        progressChartView.xAxis.labelPosition = .bottom
        progressChartView.xAxis.setLabelCount(4, force: false)
        let leftAxis = progressChartView.leftAxis
        leftAxis.removeAllLimitLines()
        leftAxis.axisMaximum = 5000
        leftAxis.axisMinimum = 0
        leftAxis.drawLimitLinesBehindDataEnabled = true
        progressChartView.rightAxis.enabled = false
    }
    
    func setChartData(weeks: [Int]) {
        let values = (0..<weeks.count).map { (i) -> ChartDataEntry in
            let val = completionPercent
            return ChartDataEntry(x: Double(i), y: val[i])
        }
        let set1: LineChartDataSet = LineChartDataSet(values: values, label: "Results")
        set1.axisDependency = .left
        set1.setColor(UIColor.orange, alpha: 0.5)
        set1.setCircleColor(UIColor.orange)
        set1.lineWidth = 2.0
        set1.circleRadius = 6.0
        set1.fillColor = UIColor.orange
        set1.circleHoleColor = UIColor.white
        
        let data = LineChartData(dataSet: set1)
        self.progressChartView.data = data
    }
    
    func updateViews() {
        resultsLabel.text = "\(round(completionPercent.last ?? 0) )"
    }
}

// MARK: - ChartViewDelegate
extension FootPrintViewController: ChartViewDelegate {}
