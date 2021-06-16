//
//  ContentView.swift
//  Modern-MVVM-SwiftUI-AppleWatch Extension
//
//  Created by Burhan Aras on 16.06.2021.
//

import SwiftUI

struct HomeWatchView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        _viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            TabView{
                ForEach(viewModel.collections){ collection in
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
            HomeWatchView(viewModel: HomeViewModel(state: .none))
                .previewDevice("Apple Watch Series 5 - 44mm")
            HomeWatchView(viewModel: HomeViewModel(state: .none))
                .previewDevice("Apple Watch Series 5 - 40mm")
        }
    }
}
