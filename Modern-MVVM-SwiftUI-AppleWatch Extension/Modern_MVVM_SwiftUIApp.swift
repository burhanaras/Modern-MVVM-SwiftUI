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
                HomeWatchView(viewModel: HomeViewModel())
            }
        }
    }
}

