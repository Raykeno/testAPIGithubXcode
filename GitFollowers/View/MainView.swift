//
//  ContentView.swift
//  GitFollowers
//
//  Created by hajdu otto on 12/01/2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            SearchView()
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            FavoritesView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Favorites")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
