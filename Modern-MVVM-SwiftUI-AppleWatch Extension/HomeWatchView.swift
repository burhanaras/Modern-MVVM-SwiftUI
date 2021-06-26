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
            
            switch viewModel.data{
            case let .success(collections):
                BookListWatchView(collections: collections)
            case let .failure(error):
               ErrorView(error: error)
            case .none:
                VStack {
                    ProgressView().padding(4)
                    Text("Loading")
                }
            }
        }
    }
}

struct BookListWatchView: View{
    let collections: [Collection]
    var body: some View{
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        return Group{
            HomeWatchView(viewModel: HomeViewModel(networkLayer: DummyNetworkLayer()))
                .previewDevice("Apple Watch Series 5 - 44mm")
            HomeWatchView(viewModel: HomeViewModel(networkLayer: DummyNetworkLayer()))
                .previewDevice("Apple Watch Series 5 - 40mm")
            
            HomeWatchView(viewModel: HomeViewModel(networkLayer: DummyFailingNetworkLayer()))
                .previewDevice("Apple Watch Series 5 - 44mm")
            HomeWatchView(viewModel: HomeViewModel(networkLayer: DummyFailingNetworkLayer()))
                .previewDevice("Apple Watch Series 5 - 40mm")
        }
    }
}
