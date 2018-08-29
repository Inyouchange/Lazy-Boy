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
    
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var relaxView: UIImageView!
    @IBOutlet weak var halfView: UIImageView!
    
    @IBOutlet weak var wholeView: UIImageView!
    @IBOutlet weak var upLabel: UILabel!
    @IBAction func halrAction(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {
            self.halfView.isHidden = false
            self.halfView.transform = CGAffineTransform(translationX: 0, y: -40);
            self.relaxView.alpha = 0.5
            self.upLabel.isHidden = true
            self.tempLabel.alpha = 0.1
            
        })
    }
    let locationManager = CLLocationManager()
    @IBAction func dismissNext(segue:UIStoryboardSegue){
    }
    @IBAction func webAction(_ sender: Any) {
        
    }
    
    @IBAction func wholeAction(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {
            self.wholeView.isHidden = false
            self.wholeView.transform = CGAffineTransform(translationX: 0, y: -430);
            self.relaxView.alpha = 0.5
            self.tempLabel.alpha = 0.1
            self.upLabel.isHidden = true
            self.halfView.isHidden = true
            
        })
    }
    
    @IBAction func downAction(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {
            self.wholeView.isHidden = false
            self.wholeView.transform = CGAffineTransform(translationX: 0, y: 430);
            self.relaxView.alpha = 1.0
            self.tempLabel.alpha = 1.0
            self.upLabel.isHidden = false
            self.halfView.isHidden = true
            
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accessOpenAPI()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "rectangle")!)
        //TODO:Set up the location manager here.
        locationManager.delegate = self  //宣告自己 (current VC)為 locationManager 的代理
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters //定位所在地的精確程度(一般來說，精準程度越高，定位時間越長，所耗費的電力也因此更多)
        //to ask the user for location
        locationManager.requestWhenInUseAuthorization()  //for not destroying the user's battery
        locationManager.startUpdatingLocation() //this method will start navigating the location. And once this is done, it will send a msg to this ViewController
        self.halfView.isHidden = true
        self.wholeView.isHidden = true
        
        
        
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
    
    
    func accessOpenAPI() {
        let jsonURL = "http://api.openweathermap.org/data/2.5/weather?lat=25&lon=121&appid=e5bd78119aaf61c8c4ca448557afd91b"
        Alamofire.request(jsonURL).responseJSON{ (reponse)in do{
            //print("=====\(reponse.value)")
            let decoder = JSONDecoder()
            let openData = try decoder.decode(WeatherInfo.self, from: reponse.data!)
            DispatchQueue.main.async {
                var transTemp:Int = Int(openData.main.temp - 272.15)
                self.tempLabel.text = ("\(transTemp)°")
                self.tempLabel.textColor = UIColor.orange
           }
            
            
        }
        catch{
            print("\(error)")
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
