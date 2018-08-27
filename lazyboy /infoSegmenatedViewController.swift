//
//  infoSegmenatedViewController.swift
//  GitLab_CL
//
//  Created by cs on 2018/8/27.
//  Copyright © 2018年 cs. All rights reserved.
//

import UIKit

class infoSegmenatedViewController: UIViewController {

    @IBOutlet weak var teachteach: UIView!
    @IBOutlet weak var infoinfo: UIView!
    @IBOutlet weak var hothot: UIView!
    @IBAction func infoSegment(_ sender: UISegmentedControl) {
        if(sender.selectedSegmentIndex == 0){
            UIView.animate(withDuration: 0.5, animations: {
                self.hothot.isHidden = false
                self.infoinfo.isHidden = true
                self.teachteach.isHidden = true
            })
        }
        else if(sender.selectedSegmentIndex == 1){
            UIView.animate(withDuration: 0.5, animations: {
                self.hothot.isHidden = true
                self.infoinfo.isHidden = false
                self.teachteach.isHidden = true
            })
        }
        else if(sender.selectedSegmentIndex == 2){
            UIView.animate(withDuration: 0.5, animations: {
                self.hothot.isHidden = true
                self.infoinfo.isHidden = true
                self.teachteach.isHidden = false
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "rectangle")!)

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
