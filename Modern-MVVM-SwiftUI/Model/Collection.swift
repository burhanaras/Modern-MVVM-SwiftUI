//
//  Collection.swift
//  Modern-MVVM-SwiftUI
//
//  Created by Burhan Aras on 15.06.2021.
//

import Foundation

struct CollectionsResponse: Codable {
    let collections: [Collection]
}

struct Collection: Identifiable, Codable {
    let id: String
    let title: String
    let books: [Book]
}

struct Book: Identifiable, Codable {
    let id: String
    let Title: String
    let Image: String
}
