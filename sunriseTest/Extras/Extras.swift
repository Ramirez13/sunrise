//
//  Extras.swift
//  sunriseTest
//
//  Created by Konstantin Chukhas on 12/8/18.
//  Copyright © 2018 Konstantin Chukhas. All rights reserved.
//

import Foundation

let API_URL = "https://weather.cit.api.here.com/weather/1.0/report.json?product=forecast_astronomy&latitude=\(Location.sharedInstance.latitude!)&longitude=\(Location.sharedInstance.longitude!)&oneobservation=true&app_id=DemoAppId01082013GAL&app_code=AJKnXv84fjrb0KIHawS0Tg"

let API_URL_SEARCH = "https://weather.cit.api.here.com/weather/1.0/report.json"

//обработчик

typealias DownloadComplete = () -> ()
