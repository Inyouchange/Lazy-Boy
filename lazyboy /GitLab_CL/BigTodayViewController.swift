//
//  BigTodayViewController.swift
//  GitLab_CL
//
//  Created by Betty on 27/08/2018.
//  Copyright © 2018 cs. All rights reserved.
//

import UIKit

class BigTodayViewController: UIViewController {

    var fullSize :CGSize!
    var myUIView :UIView!
    var anotherUIView :UIView!
    
    
    @IBAction func singleTap(_ sender: UITapGestureRecognizer) {
        print("單指連點兩下時觸發")
        // 取得每指的位置
        //self.findFingersPositon(recognizer)
    }
    
    
    /*func findFingersPositon(recognizer:UITapGestureRecognizer) {
        // 取得每指的位置
        let number = recognizer.numberOfTouches()
        for i in 0..<number {
            let point = recognizer.locationOfTouch(
                i, inView: recognizer.view)
            print(
                "第 \(i + 1) 指的位置：\(NSStringFromCGPoint(point))")
        }
    }*/
    override func viewDidLoad() {
        super.viewDidLoad()
        // 單指輕點
        //let singleFinger = UITapGestureRecognizer(target: self, action: #selector(ViewController.singleTap(_:)))
        
        // 點幾下才觸發 設置 2 時 則是要點兩下才會觸發 依此類推
        //singleFinger.numberOfTapsRequired = 2
        
        // 幾根指頭觸發
        //singleFinger.numberOfTouchesRequired = 1
        
        // 雙指輕點沒有觸發時 才會檢測此手勢 以免手勢被蓋過
        //singleFinger.requireGestureRecognizerToFail(doubleFingers)
        
        // 為視圖加入監聽手勢
        //self.view.addGestureRecognizer(singleFinger)
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
