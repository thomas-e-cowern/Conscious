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

    // MARK: - IBOutlets
    @IBOutlet weak var progressTableView: UITableView!
    @IBOutlet weak var progressChartView: LineChartView!
    
    // MARK: - Properties
    var weeks: [Int] = []
    var completionPercent: [Double] = []
    
    var results: [SavedData] = []
    
    
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.progressChartView.delegate = self
        results = ActionPlanController.shared.loadFromPersistenceStore(path: "data")
        
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
    
    // MARK: - Setup
    func setUpLineChart() {
        self.progressChartView.noDataText = "Haven't check in yet"
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
        let set1: LineChartDataSet = LineChartDataSet(values: values, label: "Result Number")
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
    
}

// MARK: - ChartViewDelegate
extension FootPrintViewController: ChartViewDelegate {
}
