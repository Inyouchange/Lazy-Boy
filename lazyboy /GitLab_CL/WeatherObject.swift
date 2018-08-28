//
//  WeatherObject.swift
//  GitLab_CL
//
//  Created by Betty on 28/08/2018.
//  Copyright © 2018 cs. All rights reserved.
//

import Foundation

struct WeatherInfo : Codable{
    var coord:Coordinate
    var weather:[WeatherDesc]
    var base:String
    var main:Temperature
    var visibility:Int
    var wind:Windwind
    var clouds:Cloudsclouds
    var dt:Double
    var sys:System
    var id:Double
    var name:String
    var cod:Int
}

struct Coordinate : Codable {
    var lon:Double
    var lat:Double
}

struct WeatherDesc : Codable{
    var id:Int
    var main:String
    var description:String
    var icon:String
}
struct Temperature:Codable{
    var temp:Double
    var pressure:Double
    var humidity:Int
    var temp_min:Double
    var temp_max:Double
    
}

struct Windwind:Codable{
    var speed:Double
    var deg:Int
}

struct Cloudsclouds:Codable{
    var all:Int
}

struct System:Codable{
    var type:Int
    var id:Int
    var message:Double
    var country:String
    var sunrise:Double
    var sunset:Double
}
