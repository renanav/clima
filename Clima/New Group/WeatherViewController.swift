//
//  WeatherViewController.swift
//  Clima
//
//  Created by Renan Avrahami on 10/8/17.
//  Copyright © 2017 Renan Avrahami. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

class WeatherViewController: UIViewController, CLLocationManagerDelegate {
    
    //Constants
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "9a465d48de3155130bf2f05c5ea4fa55"
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up location manager
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters //keeping a hundred meters accuracy will lower battery usage without affecting the performance of the app
        // promprt for a permission from the user to use the GPS when the app is in use
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
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
    
    //MARK: - Networking
    /***************************************************************/
    
    func getWeatherData (url: String, parameters: [String : String]) {
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON {
            response in
            if response.result.isSuccess {
                print("Received weather data")
            } else {
                print("Error \(response.result.error)")
                self.cityLabel.text = "Connection issues"
            }
        }
    }
    
    
    
    
    
    
    
    //MARK: - JSON Parsing
    /***************************************************************/
    
    
    
    
    
    
    
    //MARK: - UI Updates
    /***************************************************************/
    
    
    
    
    
    
    
    
    //MARK: - Location Manager Delegate Methods
    /***************************************************************/
    
    // Once the location is accurate enough, the view controller will receive the coordinates
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation() //stop updating the location once a valid result is obtained (saves battery)
            
            print("longitude = \(location.coordinate.longitude), latitude = \(location.coordinate.latitude)")
            
            let latitude = String(location.coordinate.latitude)
            let longitude = String(location.coordinate.longitude)
            let params: [String : String] = ["lat" : latitude, "lon" : longitude, "appid" : APP_ID]
            
            // http request
            getWeatherData(url: WEATHER_URL, parameters: params)
        }
    }
    
    // This method will trigger if there's an error in the location retreival
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        cityLabel.text = "Location Unavailable"
    }
    
    
    
    
    
    
    
    
    
    
    //MARK: - Change City Delegate methods
    /***************************************************************/
    
    
}

