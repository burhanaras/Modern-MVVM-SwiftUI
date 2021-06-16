//
//  ContentView.swift
//  Modern-MVVM-SwiftUI
//
//  Created by Burhan Aras on 15.06.2021.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        _viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView{
            
            switch viewModel.data{
            case let .success(collections):
               AudioBookListView(collections: collections)
            case let .failure(error):
               ErrorView(error: error)
            case .none:
                ProgressView()
            }
        }
        .navigationTitle("Audiobooks")
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        return Group{
            HomeView(viewModel: HomeViewModel(state: .none))
            HomeView(viewModel: HomeViewModel(state: .success(dummyCollections)))
            HomeView(viewModel: HomeViewModel(state: .failure(.networkError)))
        }
    }
}

struct AudioBookListView: View{
    let collections: [Collection]
    var body: some View{
        List{
            ForEach(collections) { collection in
                BookShelfView(collection: collection)
            }
        }
        .navigationTitle("Audiobooks")
    }
}

struct BookShelfView: View {
    @State var collection: Collection
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(collection.title)
                .font(.headline)
                .padding([.leading, .top], 16)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(collection.books){ book in
                        VStack(alignment: .leading) {
                            Image("obama")
                                .resizable()
                                .frame(width: 155, height: 155)
                                .cornerRadius(6)
                            
                            Text(book.title)
                                .padding(.vertical, 8)
                        }
                        .padding(.leading, 16)
                    }
                    .listRowInsets(EdgeInsets())
                }
            }
        }
        .listRowInsets(EdgeInsets())
    }
}
