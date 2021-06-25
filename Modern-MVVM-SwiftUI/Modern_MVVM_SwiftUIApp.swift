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
            HomeView(viewModel: HomeViewModel(networkLayer: NetworkLayer(), state: .none))
        }
    }
}
