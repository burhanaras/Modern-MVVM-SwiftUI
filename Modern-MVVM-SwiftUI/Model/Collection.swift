//
//  Collection.swift
//  Modern-MVVM-SwiftUI
//
//  Created by Burhan Aras on 15.06.2021.
//

import Foundation

struct Collection: Identifiable{
    let id: String
    let title: String
    let books: [Book]
}

struct Book: Identifiable{
    let id: String
    let title: String
    let imageUrl: String
}
