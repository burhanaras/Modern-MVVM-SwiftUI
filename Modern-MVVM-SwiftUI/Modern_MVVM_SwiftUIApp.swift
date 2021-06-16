//
//  Modern_MVVM_SwiftUIApp.swift
//  Modern-MVVM-SwiftUI
//
//  Created by Burhan Aras on 15.06.2021.
//

import SwiftUI

@main
struct Modern_MVVM_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: HomeViewModel())
        }
    }
}

let collection = Collection(id: UUID().uuidString, title: "Test Collection", books: [Book(id: UUID().uuidString, title: "Test Book", imageUrl: "https://m.media-amazon.com/images/I/41bffUhJ4xL._SL500_.jpg"), Book(id: UUID().uuidString, title: "Test Book", imageUrl: "https://m.media-amazon.com/images/I/41bffUhJ4xL._SL500_.jpg"), Book(id: UUID().uuidString, title: "Test Book", imageUrl: "https://m.media-amazon.com/images/I/41bffUhJ4xL._SL500_.jpg")])
let dummyCollections = [collection, collection, collection, collection, collection, collection]
