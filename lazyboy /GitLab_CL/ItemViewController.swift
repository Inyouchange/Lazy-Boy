//
//  ItemViewController.swift
//  GitLab_CL
//
//  Created by Betty on 29/08/2018.
//  Copyright © 2018 cs. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {

    @IBAction func dismissNext(segue:UIStoryboardSegue){
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
