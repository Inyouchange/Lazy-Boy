//
//  BigTodayViewController.swift
//  GitLab_CL
//
//  Created by Betty on 27/08/2018.
//  Copyright © 2018 cs. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation



class BigTodayViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var relaxView: UIImageView!
    @IBOutlet weak var halfView: UIImageView!
    var myUIView :UIView!
    var fullSize = UIScreen.main.bounds.size
   /* @IBAction func halrAction(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {
            self.halfView.isHidden = false
            self.relaxView.alpha = 0.5
            
        })
    }*/
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "rectangle")!)
        //TODO:Set up the location manager here.
        locationManager.delegate = self  //宣告自己 (current VC)為 locationManager 的代理
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters //定位所在地的精確程度(一般來說，精準程度越高，定位時間越長，所耗費的電力也因此更多)
        //to ask the user for location
        locationManager.requestWhenInUseAuthorization()  //for not destroying the user's battery
        locationManager.startUpdatingLocation() //this method will start navigating the location. And once this is done, it will send a msg to this ViewController
        //self.halfView.isHidden = true
        
        // 一個可供移動的 UIView
        myUIView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        myUIView.backgroundColor = UIColor(patternImage: UIImage(named: "1535425437800")!)
        self.view.addSubview(myUIView)
        
        // 向上滑動
        let swipeUp = UISwipeGestureRecognizer(target:self, action:#selector(BigTodayViewController.swipe(_:)))
        swipeUp.direction = .up
        
        // 幾根指頭觸發 預設為 1
        swipeUp.numberOfTouchesRequired = 1
        
        // 為視圖加入監聽手勢
        self.view.addGestureRecognizer(swipeUp)
        
    }
    @objc func swipe(_ recognizer:UISwipeGestureRecognizer) {
        let point = myUIView.center
        
        if recognizer.direction == .up {
            print("Go Up")
            if point.y >= 150 {
                myUIView.center = CGPoint(x: myUIView.center.x, y: myUIView.center.y - 100)
            } else {
                myUIView.center = CGPoint(x: myUIView.center.x, y: 50)
            }
        } else if recognizer.direction == .left {
            print("Go Left")
            if point.x >= 150 {
                myUIView.center = CGPoint(x: myUIView.center.x - 100, y: myUIView.center.y)
            } else {
                myUIView.center = CGPoint(x: 50, y: myUIView.center.y)
            }
        } else if recognizer.direction == .down {
            print("Go Down")
            if point.y <= fullSize.height - 150 {
                myUIView.center = CGPoint(x: myUIView.center.x, y: myUIView.center.y + 100)
            } else {
                myUIView.center = CGPoint(x: myUIView.center.x, y: fullSize.height - 50)
            }
        } else if recognizer.direction == .right {
            print("Go Right")
            if point.x <= fullSize.width - 150 {
                myUIView.center = CGPoint(x: myUIView.center.x + 100, y: myUIView.center.y)
            } else {
                myUIView.center = CGPoint(x: fullSize.width - 50, y: myUIView.center.y)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //由於我們的 "startUpdatingLocation()" 會回傳一個陣列的 CLLocation ，而最後回傳的會是最接近於我們當前位置的 CLLocation 。 因此我們要娶的就是這個 CLLocation
        let location = locations[locations.count - 1]  //the method "startUpdatingLocation()" is gonna grab a set of locations that are getting more & more accurate. So we'd want the last location in this array
        //簡單檢查一下取得的值
        if location.horizontalAccuracy > 0 {  //this line will check if the location is available
            // 由於定位功能十分耗電，我們既然已經取得了位置，就該速速把它關掉
            locationManager.stopUpdatingLocation()
            print("latitude: \(location.coordinate.latitude), longtitude: \(location.coordinate.longitude)")
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
