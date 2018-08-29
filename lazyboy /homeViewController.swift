//
//  homeViewController.swift
//  GitLab_CL
//
//  Created by cs on 2018/8/29.
//  Copyright © 2018年 cs. All rights reserved.
//

import UIKit

class homeViewController: UIViewController {
    @IBAction func mypage(_ sender: UIPageControl) {
        if sender.currentPage == 0 {    // 判斷使用者選到哪個Page
            firstimage.image = UIImage(named: "banner3") //顯示對應的Image
        }else if sender.currentPage == 1 {
            firstimage.image = UIImage(named: "首頁banner_工作區域 1")
        }else {
            firstimage.image = UIImage(named: "穿搭教學丹寧_工作區域 1")
        }
    }
    
    @IBOutlet weak var firstimage: UIImageView!
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
