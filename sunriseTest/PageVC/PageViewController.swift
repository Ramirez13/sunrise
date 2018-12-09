//
//  WheatherPageViewController.swift
//  whetherApp
//
//  Created by Konstantin Chukhas on 11/28/18.
//  Copyright © 2018 Konstantin Chukhas. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController,UIPageViewControllerDelegate,UIPageViewControllerDataSource {
    
    lazy var VCArray: [UIViewController] = {
     
        return [self.VCInstance(name: "FirstVC"),
                self.VCInstance(name: "SecondVC")
         ]
    }()
    
    private func VCInstance(name:String) -> UIViewController{
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:name)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.dataSource = self
        self.delegate = self
        if let  firstVC = VCArray.first{
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for view in self.view.subviews{
            if view is UIScrollView{
                view.frame = UIScreen.main.bounds
            }else if view is UIPageControl{
                view.backgroundColor  = UIColor.clear
            }
        }
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = VCArray.index(of:viewController) else {
            return nil
        }
        let previosIndex = viewControllerIndex - 1
        guard previosIndex >= 0 else {
            return VCArray.last
        }
        guard VCArray.count > previosIndex else{
            return nil
        }
        return VCArray[previosIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = VCArray.index(of:viewController) else {
            return nil
        }
        let nextIndex = viewControllerIndex  + 1
        guard nextIndex < VCArray.count else {
            return VCArray.first
        }
        guard VCArray.count > nextIndex else{
            return nil
        }
        return VCArray[nextIndex]
    }
     func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return VCArray.count
    }
    
   public  func presentationIndex(for pageViewController: UIPageViewController) -> Int {
    guard let firstViewController = viewControllers?.first,
          let firstViewControllerIndex = VCArray.index(of:firstViewController) else{
        return 0
    }
    return firstViewControllerIndex
    }
    
}
