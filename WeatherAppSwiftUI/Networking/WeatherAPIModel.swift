//
//  WeatherModel.swift
//  WeatherAppSwiftUI
//
//  Created by Hollis Kwan on 1/22/23.
//

import Foundation

struct WeatherAPI: Codable {
    let weather: [WeatherElement]
    let main: Main
    let sys: Sys
    let name: String
}

struct Main: Codable {
    let temp: Double
}

struct Sys: Codable {
    let country: String
}

struct WeatherElement: Codable {
    let description: String
}
