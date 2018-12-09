//
//  ViewController.swift
//  sunriseTest
//
//  Created by Konstantin Chukhas on 12/8/18.
//  Copyright © 2018 Konstantin Chukhas. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import CoreLocation

class ViewController: UIViewController,UISearchBarDelegate {
    
    //MARK:Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var sunrise: UILabel!
    @IBOutlet weak var sunset: UILabel!
    //MARK:Variables
    var currentSearch:CurrentSearch = CurrentSearch()
    var text:String!
    //MARK:Constants
     let locationManager  = CLLocationManager()
    //MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        callDelegates()
         locationManager.requestWhenInUseAuthorization()
    }
    func callDelegates(){
        searchBar.delegate = self
    }
    private func updateUI(){
        city.text = currentSearch.cityName
        sunrise.text = "Sunrise: \(currentSearch.sunrise)"
        sunset.text = "Sunset: \(currentSearch.sunset)"
    }
    
    //MARK: SEARCH BAR
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != ""
        {
            text = searchText
         }
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        UserDefaults.standard.set(text, forKey: "text")
        currentSearch.downloadCurrentWeather {
            self.updateUI()
        }
       self.searchBar.endEditing(true)
    }
}

