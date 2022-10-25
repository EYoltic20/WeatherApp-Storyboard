//
//  weatherModel.swift
//  WeatherApp_Story
//
//  Created by Emilio Y Martinez on 25/10/22.
//

import Foundation

struct weatherModel{
    let conditionId: Int
    let cityName : String
    let temperature : Double
    let description: String
    
    var temperaturaString:String{
        return String(format: "%.1f",temperature)
    }
    func getCondition(weatherId:Int)->String{
        switch weatherId{
        case 200 ... 232:
            return "cloud.bolt"
        case 300 ... 321:
            return "cloud.drizzle"
        case 500 ... 531:
            return "cloud.rain"
        case 600 ... 622:
            return "cloud.snow"
        case 701 ... 781:
            return "cloud.flog"
        case 800:
            return "sun.max"
        case 801 ... 8004:
            return "cloud.bolt"
        default:
            return "Nan"
        }
    }
}
