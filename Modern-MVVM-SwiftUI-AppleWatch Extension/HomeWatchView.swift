//
//  ContentView.swift
//  Modern-MVVM-SwiftUI-AppleWatch Extension
//
//  Created by Burhan Aras on 16.06.2021.
//

import SwiftUI

struct HomeWatchView: View {
    @State var collections: [Collection]
    
    var body: some View {
        NavigationView {
            TabView{
                ForEach(collections){ collection in
                    ForEach(collection.books){ book in
                        VStack(spacing: 4){
                            Image("obama")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(6)
                        }
                    }
                    .navigationTitle(collection.title)
                }
            }
            .tabViewStyle(PageTabViewStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        return Group{
            HomeWatchView(collections: dummyCollections)
                .previewDevice("Apple Watch Series 5 - 44mm")
            HomeWatchView(collections: dummyCollections)
                .previewDevice("Apple Watch Series 5 - 40mm")
        }
    }
}
