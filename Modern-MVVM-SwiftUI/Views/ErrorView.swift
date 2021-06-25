//
//  ErrorView.swift
//  Modern-MVVM-SwiftUI
//
//  Created by Burhan Aras on 16.06.2021.
//

import SwiftUI

struct ErrorView: View {
    let error: CommonError
    
    var body: some View {
        VStack{
            switch error{
            case .configurationError:
                Image(systemName: "xmark.octagon")
                    .font(.title)
                    .padding()
                Text("Something went wrong. Please try again later.")
            case .networkError:
                Image(systemName: "wifi.exclamationmark")
                    .font(.title)
                    .padding()
                Text("Couldn't load data. Please check your connection")
            }
        }
        .padding()
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        return Group {
            ErrorView(error: .configurationError)
            ErrorView(error: .networkError)
        }
    }
}
