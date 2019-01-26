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
    let weeks = ["0", "1", "2", "3", "4"]
    let completionPercent: [Double] = [0.0, 50.0, 80.0, 90.0, 100.0]
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.progressChartView.delegate = self
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
        leftAxis.axisMaximum = 105
        leftAxis.axisMinimum = 0
        leftAxis.drawLimitLinesBehindDataEnabled = true
        progressChartView.rightAxis.enabled = false
    }
    
    
    func setChartData(weeks: [String]) {
        let values = (0..<weeks.count).map { (i) -> ChartDataEntry in
            let val = completionPercent
            return ChartDataEntry(x: Double(i), y: val[i])
        }
        let set1: LineChartDataSet = LineChartDataSet(values: values, label: "TEST")
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
