//
//  CitationViewController.swift
//  Conscious
//
//  Created by Hanadi AlOthman on 26/01/2019.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class CitationViewController: UIViewController {

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Setup
    func openUrl(urlStr:String!) {
        if let url = NSURL(string:urlStr) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
    }
    
    // MARK: - Actions
    @IBAction func fruitsAndVeggies(_ sender: Any) {
        openUrl(urlStr: "https://www.fruitsandveggiesmorematters.org/what-fruits-and-vegetables-are-in-season")
    }
    @IBAction func snaped(_ sender: Any) {
        openUrl(urlStr: "https://snaped.fns.usda.gov/seasonal-produce-guide")
    }
    @IBAction func ucanr(_ sender: Any) {
        openUrl(urlStr: "https://ucanr.edu/datastoreFiles/234-2822.pdf")
    }
    @IBAction func dailyInfoGraphic(_ sender: Any) {
        openUrl(urlStr: "https://www.dailyinfographic.com/10-reasons-to-use-a-reusable-water-bottle")
    }
    @IBAction func banTheBottle(_ sender: Any) {
        openUrl(urlStr: "https://www.banthebottle.net/bottled-water-facts/")
    }
    @IBAction func goGreen(_ sender: Any) {
        openUrl(urlStr: "http://www.gogreen.org/blog/the-environmental-benefits-of-buying-locally")
    }
    @IBAction func sciencing(_ sender: Any) {
        openUrl(urlStr: "https://sciencing.com/carbon-footprint-plastic-bottle-12307187.html")
    }
    @IBAction func valuePenguin(_ sender: Any) {
        openUrl(urlStr: "https://www.valuepenguin.com/how-much-we-spend-food")
    }
    @IBAction func ourStreetSmpls(_ sender: Any) {
        openUrl(urlStr: "https://www.ourstreetsmpls.org/does_bike_commuting_affect_your_carbon_footprint_and_how_much")
    }
    @IBAction func powerScoreCard(_ sender: Any) {
        openUrl(urlStr: "http://www.powerscorecard.org/reduce_energy.cfm")
    }
    @IBAction func tc(_ sender: Any) {
        openUrl(urlStr: "https://www-tc.pbs.org/strangedays/pdf/StrangeDaysClimateFriendlyChecklist.pdf")
    }
    @IBAction func researchGate(_ sender: Any) {
        openUrl(urlStr: "https://www.researchgate.net/publication/228194259_Individual_Carbon_Emissions_The_Low-Hanging_Fruit")
    }
    @IBAction func epa(_ sender: Any) {
        openUrl(urlStr: " https://www.epa.gov/")
    }
    @IBAction func carbonIndependent(_ sender: Any) {
        openUrl(urlStr: "https://www.carbonindependent.org/sources_aviation.html")
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
