//
//  ContentView.swift
//  WeatherAppSwiftUI
//
//  Created by Hollis Kwan on 1/7/23.
//

import SwiftUI

struct WeatherView: View {
    
    @State var degrees = Int()
    @State var searchText = String()
    @State var city = String()
    @StateObject var viewModel = ViewModel(networkManager: NetworkManager.shared)
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [
                .blue,
                .teal,
                .teal,
                .white
            ]),startPoint: .topLeading, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            VStack {
                SearchBar(searchText: $searchText)
                Spacer()
                WeatherData(degrees: $degrees, city: $city)
                Spacer()
            }
        }.onSubmit {
            guard !searchText.isEmpty else { return }
            viewModel.fetchWeather(searchText, completion: {
                self.degrees = viewModel.fetchedTemp()
                self.city = viewModel.fetchedCity()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}

//MARK: - UI Setup
extension WeatherView {
    struct SearchBar: View {
        @Binding var searchText: String
        
        var body: some View {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.black).opacity(0.4)
                TextField("Search location here...", text: $searchText)
                    .foregroundColor(.black)
                Image(systemName: "x.circle")
                    .foregroundColor(searchText.isEmpty ? .white : .gray)
                    .onTapGesture {
                        searchText.removeAll()
                    }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(.white)
            )
            .padding()
        }
    }
    
    struct WeatherData: View {
        @Binding var degrees: Int
        @Binding var city: String
        
        var body: some View {
            Text(city)
                .font(.system(size: 32,weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding()
            VStack(spacing: 50) {
                switch degrees {
                case _ where degrees > 80:
                    WeatherImageAndDegrees(degrees: degrees, imageName: "sun.max.fill")
                case _ where degrees < 80 && degrees > 60:
                    WeatherImageAndDegrees(degrees: degrees, imageName: "cloud.sun.fill")
                case _ where degrees > 0 && degrees < 60:
                    WeatherImageAndDegrees(degrees: degrees, imageName: "wind")
                default:
                    WeatherImageAndDegrees(degrees: degrees, imageName: "snow")
                }
            }
        }
    }
    
    struct WeatherImageAndDegrees: View {
        var degrees: Int
        var imageName: String = "sun.cloud.fill"
        
        var body: some View {
            VStack(spacing: 50) {
                Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                Text("\(degrees)°")
                    .font(.system(size: 70, weight: .medium, design: .default))
                    .foregroundColor(.white)
            }
        }
    }
}
