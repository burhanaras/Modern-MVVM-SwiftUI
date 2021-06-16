//
//  HomeViewModel.swift
//  Modern-MVVM-SwiftUI
//
//  Created by Burhan Aras on 16.06.2021.
//

import Foundation

class HomeViewModel: ObservableObject{
    @Published var collections: [Collection]
    
    init() {
        self.collections = dummyCollections
    }
}
