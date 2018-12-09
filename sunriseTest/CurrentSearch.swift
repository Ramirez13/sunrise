//
//  CurrentSearch.swift
//  sunriseTest
//
//  Created by Konstantin Chukhas on 12/8/18.
//  Copyright © 2018 Konstantin Chukhas. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class CurrentSearch {
    
    private var _cityName:String!
    private var _sunset:String!
    private var  _sunrise:String!
   
    var cityName:String{
        if _cityName == nil{
            _cityName = ""
        }
        return _cityName
    }
    var sunset:String{
        if _sunset == nil{
            _sunset = ""
        }
        return _sunset
    }
    var sunrise:String{
        if _sunrise == nil{
            _sunrise = ""
        }
        return _sunrise
    }
    
    
    //Загрузка данных
    func downloadCurrentWeather(completed:@escaping DownloadComplete){
        let url = URL(string: API_URL_SEARCH)!
        let APIKey = "DemoAppId01082013GAL"
        let APCode = "AJKnXv84fjrb0KIHawS0Tg"
        let params: Parameters = [
            "product":"forecast_astronomy",
            "name":UserDefaults.standard.object(forKey: "text") as! String,
            "app_id":APIKey,
            "app_code":APCode
        ]
        Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.default).responseJSON { (response) in
            let result = response.result
            let json = JSON(result.value!)
                let fixtures = json["astronomy"]["astronomy"].arrayValue
                for element in fixtures {
                    let city = element["city"].string
                    let sunrise = element["sunrise"].string
                    let sunset = element["sunset"].string
                    self._cityName = city
                    self._sunrise = sunrise
                    self._sunset = sunset
             
            completed()
        }
    }
}
}
