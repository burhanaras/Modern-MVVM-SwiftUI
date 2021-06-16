//
//  Modern_MVVM_SwiftUIApp.swift
//  Modern-MVVM-SwiftUI-AppleWatch Extension
//
//  Created by Burhan Aras on 16.06.2021.
//

import SwiftUI

@main
struct Modern_MVVM_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeWatchView(collections: dummyCollections)
            }
        }
    }
}


let collection0 = Collection(id: UUID().uuidString, title: "Test Collection 0", books: [Book(id: UUID().uuidString, title: "Test Book", imageUrl: "https://m.media-amazon.com/images/I/41bffUhJ4xL._SL500_.jpg"), Book(id: UUID().uuidString, title: "Test Book 1", imageUrl: "https://m.media-amazon.com/images/I/41bffUhJ4xL._SL500_.jpg"), Book(id: UUID().uuidString, title: "Test Book 2", imageUrl: "https://m.media-amazon.com/images/I/41bffUhJ4xL._SL500_.jpg")])
let collection1 = Collection(id: UUID().uuidString, title: "Test Collection 1", books: [Book(id: UUID().uuidString, title: "Test Book 3", imageUrl: "https://m.media-amazon.com/images/I/41bffUhJ4xL._SL500_.jpg"), Book(id: UUID().uuidString, title: "Test Book 4", imageUrl: "https://m.media-amazon.com/images/I/41bffUhJ4xL._SL500_.jpg"), Book(id: UUID().uuidString, title: "Test Book 5", imageUrl: "https://m.media-amazon.com/images/I/41bffUhJ4xL._SL500_.jpg")])
let collection2 = Collection(id: UUID().uuidString, title: "Test Collection 2", books: [Book(id: UUID().uuidString, title: "Test Book 6", imageUrl: "https://m.media-amazon.com/images/I/41bffUhJ4xL._SL500_.jpg"), Book(id: UUID().uuidString, title: "Test Book 7", imageUrl: "https://m.media-amazon.com/images/I/41bffUhJ4xL._SL500_.jpg"), Book(id: UUID().uuidString, title: "Test Book 8", imageUrl: "https://m.media-amazon.com/images/I/41bffUhJ4xL._SL500_.jpg")])
let dummyCollections = [collection0, collection1, collection2]
