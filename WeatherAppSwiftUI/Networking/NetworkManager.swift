//
//  NetworkManager.swift
//  WeatherAppSwiftUI
//
//  Created by Hollis Kwan on 1/22/23.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    var baseUrl: String = "https://api.openweathermap.org/data/2.5/weather"
    let appId = "781423a2e6c52d4168d13c0af84a22d4"
    
    func fetchWeather(with city: String, completion: @escaping (WeatherAPI) -> Void) {
        
        guard let baseUrl = URL(string: baseUrl) else { return }
        
        let params: [String: String] = [
            "appid": appId,
            "units": "imperial",
            "q": city
        ]
        
        var urlComponents = URLComponents(url: baseUrl, resolvingAgainstBaseURL: true)
        let queryItems = params.map { URLQueryItem(name: $0.key, value: $0.value) }
        urlComponents?.queryItems = queryItems
        guard let weatherUrl = urlComponents?.url else { return }
        
        URLSession.shared.dataTask(with: weatherUrl) { data, _, error in
            if let error = error {
                print(error)
                return
            }
            
            if let data = data {
                guard let jsonData = try? JSONDecoder().decode(WeatherAPI.self, from: data) else { return }
                print(jsonData)
                completion(jsonData)
                
            }
        }.resume()
    }
}
