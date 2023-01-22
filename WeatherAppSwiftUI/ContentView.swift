//
//  ContentView.swift
//  WeatherAppSwiftUI
//
//  Created by Hollis Kwan on 1/7/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var degrees = 76
    @State var day = "MON"
    @State var searchText = String()
    
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
                SearchBarView(searchText: $searchText)
                Spacer()
                WeatherDataView(degrees: $degrees, day: $searchText)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SearchBarView: View {
    
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

struct WeatherDataView: View {
    
    @Binding var degrees: Int
    @Binding var day: String
    
    var body: some View {
        Text("Cupertino, CA")
            .font(.system(size: 32,weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
        VStack(spacing: 50) {
            if degrees < 80 {
                Image(systemName: "cloud.sun.fill")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                Text("\(degrees)°")
                    .font(.system(size: 70, weight: .medium, design: .default))
                    .foregroundColor(.white)
            } else {
                Image(systemName: "sun.max.fill")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                
                Text("\(degrees)°")
                    .font(.system(size: 70, weight: .medium, design: .default))
                    .foregroundColor(.white)
            }
            HStack {
                VStack {
                    Text("TUE")
                        .font(.system(size: 16, weight: .medium, design: .default))
                        .foregroundColor(.white)
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    Text("\(degrees)°")
                        .font(.system(size: 28, weight: .medium, design: .default))
                        .foregroundColor(.white)
                }
                VStack {
                    Text("WED")
                        .font(.system(size: 16, weight: .medium, design: .default))
                        .foregroundColor(.white)
                    Image(systemName: "cloud.drizzle.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 40)
                    Text("\(degrees)°")
                        .font(.system(size: 28, weight: .medium, design: .default))
                        .foregroundColor(.white)
                }
                VStack {
                    Text("THUR")
                        .font(.system(size: 16, weight: .medium, design: .default))
                        .foregroundColor(.white)
                    Image(systemName: "cloud.fog.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    Text("\(degrees)°")
                        .font(.system(size: 28, weight: .medium, design: .default))
                        .foregroundColor(.white)
                }
                VStack {
                    Text("FRI")
                        .font(.system(size: 16, weight: .medium, design: .default))
                        .foregroundColor(.white)
                    Image(systemName: "cloud.bolt.rain.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    Text("\(degrees)°")
                        .font(.system(size: 28, weight: .medium, design: .default))
                        .foregroundColor(.white)
                }
                VStack {
                    Text("SAT")
                        .font(.system(size: 16, weight: .medium, design: .default))
                        .foregroundColor(.white)
                    Image(systemName: "cloud.sun.rain.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    Text("\(degrees)°")
                        .font(.system(size: 28, weight: .medium, design: .default))
                        .foregroundColor(.white)
                }
                
            }
        }
    }
}
