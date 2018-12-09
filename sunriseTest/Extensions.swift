//
//  Extensions.swift
//  sunriseTest
//
//  Created by Konstantin Chukhas on 12/8/18.
//  Copyright © 2018 Konstantin Chukhas. All rights reserved.
//

import Foundation
extension Double{
    func rounded(toPlaces places:Int)-> Double{
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
}

extension Date{
    func dayOfTheWeek()-> String{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from:self)
    }
}
