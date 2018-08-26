//
//  TodayViewController.swift
//  GitLab_CL
//
//  Created by Betty on 26/08/2018.
//  Copyright © 2018 cs. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController {

    @IBOutlet weak var situationView: UIView!
    @IBOutlet weak var todayView: UIView!
    @IBOutlet weak var itemView: UIView!
    
    
    @IBAction func show(_ sender: UISegmentedControl) {
        if(sender.selectedSegmentIndex == 0){
            UIView.animate(withDuration: 0.5, animations: {
                self.situationView.isHidden = false
                self.todayView.isHidden = true
                self.itemView.isHidden = true
                })
        }
        else if(sender.selectedSegmentIndex == 1){
            UIView.animate(withDuration: 0.5, animations: {
                self.situationView.isHidden = true
                self.todayView.isHidden = false
                self.itemView.isHidden = true
            })
        }
        else if(sender.selectedSegmentIndex == 2){
            UIView.animate(withDuration: 0.5, animations: {
                self.situationView.isHidden = true
                self.todayView.isHidden = true
                self.itemView.isHidden = false
            })
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
