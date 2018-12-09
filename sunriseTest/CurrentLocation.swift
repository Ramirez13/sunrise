//
//  CurrentLocation.swift
//  sunriseTest
//
//  Created by Konstantin Chukhas on 12/9/18.
//  Copyright © 2018 Konstantin Chukhas. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class CurrentLocation {
    
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
    func downloadCurrentWeatherInLocation(completed:@escaping DownloadComplete){
        Alamofire.request(API_URL).responseJSON { (response) in
         let swiftyJSON = try! JSON(data: response.data!)
            let fixtures = swiftyJSON["astronomy"]["astronomy"].arrayValue
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
