//
//  OnboardingPageViewController.swift
//  Conscious
//
//  Created by Thomas Cowern New on 1/17/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class OnboardingPageViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // setting self as data source
        dataSource = self
        // loading up the first of the onboarding view controllers
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
    }
    // Setting up the view controllers for onboarding
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [onboardingViewController(name: "onboardOne"),
                onboardingViewController(name: "onboardTwo"),
                onboardingViewController(name: "onboardThree")]
    }()
    // Setting up the view controller funtion
    private func onboardingViewController(name: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(name)ViewController")
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.description == "toQuiz" {
            let destinationVC = segue.destination as UIViewController
        
        }
    }
 

}

extension OnboardingPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex =  orderedViewControllers.index(of:viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of:viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    

    
    
}
