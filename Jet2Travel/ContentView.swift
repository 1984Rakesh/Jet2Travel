//
//  ContentView.swift
//  Jet2Travel
//
//  Created by Rakesh Patole on 08/07/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Articles()
                .tabItem {
                    Image(systemName: "doc.richtext")
                    Text("Articles")
                }
            NavigationView {
                Users()
            }
            .tabItem {
                Image(systemName: "person.3")
                Text("Users")                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
