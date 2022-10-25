//
//  WeatherData.swift
//  WeatherApp_Story
//
//  Created by Emilio Y Martinez on 24/10/22.
//

import Foundation
//Decode itself from an external representation
struct WeatherData: Codable{
    let name: String
    let main: Main
    let weather: [Weather]
}
struct Main : Codable{
    let temp: Double
}
struct Weather:Codable{
    let id :Int
    let description:String
}
