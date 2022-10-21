//
//  ViewController.swift
//  WeatherApp_Story
//
//  Created by Emilio Y Martinez on 20/10/22.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var locaion: UILabel!
    
    @IBOutlet weak var temperatura: UILabel!
    @IBOutlet weak var clima: UIImageView!
    
    
    @IBOutlet weak var searchfield: UITextField!
    
    var weather=weatherManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchfield.delegate = self
        
    }
    
    @IBAction func textField(_ sender: Any) {
        let estado = terminar_De_Editar()
        print(estado)

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


}

