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
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .teal, .white]), startPoint: .topLeading, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
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
                            Text("THUR")
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
                            Text("FRI")
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
                            Text("SAT")
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
                        
                    }
                }
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
