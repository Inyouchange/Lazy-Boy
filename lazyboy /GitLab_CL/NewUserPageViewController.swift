//
//  NewUserPageViewController.swift
//  GitLab_CL
//
//  Created by Betty on 28/08/2018.
//  Copyright © 2018 cs. All rights reserved.
//

import UIKit

class NewUserPageViewController: UIPageViewController,UIPageViewControllerDataSource {
    
    var list = [UIViewController]()
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = list.index(of: viewController), index > 0 {
            return list[index - 1]
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = list.index(of: viewController), index < list.count - 1 {
            return list[index + 1]
        }
        
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return list.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = storyboard?.instantiateViewController(withIdentifier: "vc1")
        let vc2 = storyboard?.instantiateViewController(withIdentifier: "vc2")
        let vc3 = storyboard?.instantiateViewController(withIdentifier: "vc3")
        let vc4 = storyboard?.instantiateViewController(withIdentifier: "vc4")
        
        list.append(vc1!)
        list.append(vc2!)
        list.append(vc3!)
        list.append(vc4!)
        
        setViewControllers([list[0]], direction: .forward, animated: true, completion: nil)
        
        dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for v in view.subviews{
            if v is UIScrollView{
                v.frame = view.bounds
                break
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
