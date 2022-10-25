//
//  ViewController.swift
//  WeatherApp_Story
//
//  Created by Emilio Y Martinez on 20/10/22.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,UITextFieldDelegate,weatherManagerDelegate {

    @IBOutlet weak var locaion: UILabel!
    
    @IBOutlet weak var temperatura: UILabel!
    @IBOutlet weak var clima: UIImageView!
    
    
    @IBOutlet weak var searchfield: UITextField!
    let locationManager =  CLLocationManager()
    
    @IBOutlet weak var descrip: UILabel!
    var weather=weatherManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        weather.delegate = self
        searchfield.delegate = self
        
    }
    
    @IBAction func textField(_ sender: Any) {
        weather.fetchWeather(cityName: searchfield.text!)

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        terminar_De_Editar()
    }
    
    func terminar_De_Editar() -> Bool{
        if(searchfield.text != ""){
            searchfield.endEditing(true)
            searchfield.text = ""
            if let city = searchfield.text{
                weather.fetchWeather(cityName: city)
            }
            return true
        }
        return false
    }
    func didUpdateWeather(_ weatherManager: weatherManager, weather:weatherModel){
        DispatchQueue.main.async{
            self.temperatura.text = weather.temperaturaString
            self.clima.image = UIImage(systemName: weather.getCondition(weatherId: weather.conditionId))
            self.locaion.text = weather.cityName
            self.descrip.text = weather.description
        }
        
        
    }
    func didFail(error: Error) {
        print(error)
    }
}


extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            let lat = location.coordinate.latitude
            let long = location.coordinate.longitude
            weather.fetchWeather(latitude: lat, longitud: long)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
