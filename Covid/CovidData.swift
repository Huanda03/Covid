//
//  CovidData.swift
//  Covid
//
//  Created by Mac2 on 20/12/20.
//  Copyright © 2020 Mac2. All rights reserved.
//

import Foundation

struct CovidData: Codable {
    let cases : Int
    let deaths : Int
    let recovered : Int
    let countryInfo : countryInfo
}
struct countryInfo : Codable{
    let flag : String
}
