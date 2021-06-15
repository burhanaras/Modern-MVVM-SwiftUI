//
//  ContentView.swift
//  Modern-MVVM-SwiftUI-AppleWatch Extension
//
//  Created by Burhan Aras on 16.06.2021.
//

import SwiftUI

struct HomeWatchView: View {
    var body: some View {
        Text("Hello, World!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        return Group{
            HomeWatchView()
                .previewDevice("Apple Watch Series 5 - 44mm")
            HomeWatchView()
                .previewDevice("Apple Watch Series 5 - 40mm")
        }
    }
}
