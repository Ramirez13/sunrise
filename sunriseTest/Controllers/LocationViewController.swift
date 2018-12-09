//
//  LocationViewController.swift
//  sunriseTest
//
//  Created by Konstantin Chukhas on 12/9/18.
//  Copyright © 2018 Konstantin Chukhas. All rights reserved.
//

import UIKit
import CoreLocation
class LocationViewController: UIViewController,CLLocationManagerDelegate {
    //MARK:Outlets
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var sunrise: UILabel!
    @IBOutlet weak var sunset: UILabel!
    //MARK:Constants
    let locationManager  = CLLocationManager()
    
    //MARK:Variables
    var currentLocation:CLLocation!
    var currentLocationDownload:CurrentLocation = CurrentLocation()
   
    //MARK:viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
       locationAuthCheck()
    }
    private func updateUI(){
        city.text = currentLocationDownload.cityName
        sunrise.text = "Sunrise: \(currentLocationDownload.sunrise)"
        sunset.text = "Sunset: \(currentLocationDownload.sunset)"
    }
    //MARK: locationManager
    func locationAuthCheck() {
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
     }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            Location.sharedInstance.latitude = location.coordinate.latitude
            Location.sharedInstance.longitude = location.coordinate.longitude
            currentLocationDownload.downloadCurrentWeatherInLocation {
                self.updateUI()
            }
        }
    }
    

}
