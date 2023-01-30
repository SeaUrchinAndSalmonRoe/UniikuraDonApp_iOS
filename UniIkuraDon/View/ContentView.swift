//
//  ContentView.swift
//  UniIkuraDon
//
//  Created by Takeshi Henmi on 2023/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TimeLineView()
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("Home")
                    }
                }
            
            ProfileView()
                .tabItem {
                    VStack {
                        Image(systemName: "person")
                        Text("Profile")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
