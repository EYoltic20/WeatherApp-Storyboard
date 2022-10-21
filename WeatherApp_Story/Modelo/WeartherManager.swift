//
//  WeartherManager.swift
//  WeatherApp_Story
//
//  Created by Emilio Y Martinez on 20/10/22.
//

import Foundation
//c6f463e7c787ce7b637f157f3d731fca
struct weatherManager{
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?&appid=c6f463e7c787ce7b637f157f3d731fca&units=metric"
    func fetchWeather(cityName: String){
        let urlString = "\(weatherUrl)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    func performRequest(urlString:String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            
            
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            task.resume()
            
            
        }
    }
    func handle(data: Data? , response: URLResponse? , error:Error?){
        if error != nil {
            print(error!)
            return
        }
        if let safeData = data{
            let dataString = String(data: safeData, encoding: .utf8)
            
        }
    }
}
