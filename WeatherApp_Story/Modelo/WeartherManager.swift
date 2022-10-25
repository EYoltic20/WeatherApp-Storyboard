//
//  WeartherManager.swift
//  WeatherApp_Story
//
//  Created by Emilio Y Martinez on 20/10/22.
//

import Foundation
import CoreLocation
//c6f463e7c787ce7b637f157f3d731fca


protocol weatherManagerDelegate{
    func didUpdateWeather(_ weatherManager: weatherManager, weather:weatherModel)
    func didFail(error:Error)
}

struct weatherManager{
//    weather api
    let weatherUrl = "your url"
    
    var delegate: weatherManagerDelegate?
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherUrl)&q=\(cityName)"
        
        performRequest(urlString: urlString)
    }
    func fetchWeather(latitude: CLLocationDegrees,longitud:CLLocationDegrees){
        let urlString = "\(weatherUrl)&lat=\(latitude)&lon=\(longitud)"
        performRequest(urlString: urlString)
    }
    
    func performRequest( urlString:String){
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            
            
            let task = session.dataTask(with:url){(data,response,error) in
                if error != nil {
                    print("sad")
                    return
                }
                if let safeData = data{
                    if let weather = self.parseJSON(weatherdata: safeData){
                        self.delegate?.didUpdateWeather(self,weather: weather)
                    }
//                    MARK: - JSON FORMATTER
//                     MARK: -FORMA INCORRECTA
//                    let dataString = String(data: safeData, encoding: .utf8)
                    
                }
            }
            
//            Cuando se completa la peticcions
            task.resume()
        }
    }
    
    func parseJSON(weatherdata:Data) -> weatherModel?{
        let decoder = JSONDecoder()
        do{
            let respuesta =  try decoder.decode(WeatherData.self, from:weatherdata )
            let id = respuesta.weather[0].id
            let temp = respuesta.main.temp
            let nombre = respuesta.name
            let desc = respuesta.weather[0].description
            let weather = weatherModel(conditionId: id, cityName: nombre, temperature: temp, description: desc)
            return weather
        }catch{
            fatalError("print error \(error)")
            return nil
        }
    }

}
