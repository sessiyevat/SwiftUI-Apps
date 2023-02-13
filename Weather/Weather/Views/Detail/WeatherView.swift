//
//  WeatherView.swift
//  Weather
//
//  Created by Tommy on 1/30/23.
//

import SwiftUI

struct WeatherView: View {
    
    @State private var searchText = ""
    
    var searchResults: [Forecast] {
        if searchText.isEmpty {
            return Forecast.cities
        } else {
            return Forecast.cities.filter{ $0.location.contains(searchText)}
        }
    }
    
    var body: some View {
        ZStack{
            Color.background
                .ignoresSafeArea()
            
            //Adding Widgets
            ScrollView (showsIndicators: false){
                VStack(spacing: 20) {
                    ForEach(searchResults) { forecast in
                        WeatherWidget(forecast: forecast)
                    }
                }
            }
            .safeAreaInset(edge: .top) {
                EmptyView()
                    .frame(height: 110)
            }
        }
        .overlay{
            NavigationBar(searchText: $searchText)
        }
        .navigationBarHidden(true)
//        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search for a city")
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WeatherView()
                .preferredColorScheme(.dark)
        }
    }
}
