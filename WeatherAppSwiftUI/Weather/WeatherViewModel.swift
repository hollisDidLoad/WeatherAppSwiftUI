//
//  WeatherViewModel.swift
//  WeatherAppSwiftUI
//
//  Created by Hollis Kwan on 1/22/23.
//

import Foundation

extension WeatherView {
    class ViewModel: ObservableObject {
        let networkManager: NetworkManager
        var weatherModel: WeatherAPI?
        
        init(networkManager: NetworkManager) {
            self.networkManager = networkManager
        }
        
        func fetchWeather(_ city: String, completion: @escaping () -> Void) {
            networkManager.fetchWeather(with: city, completion: { [weak self] weatherModel in
                self?.weatherModel = weatherModel
                
                DispatchQueue.main.async {
                    completion()
                }
            })
        }
        
        func fetchedTemp() -> Int {
            return Int(Double(weatherModel?.main.temp ?? 0))
        }
        
        func fetchedCity() -> String {
            return "\(weatherModel?.name ?? ""), \(weatherModel?.sys.country ?? "")"
        }
    }
}
