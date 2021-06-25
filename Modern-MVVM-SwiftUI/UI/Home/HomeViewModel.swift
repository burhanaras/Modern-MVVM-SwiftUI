//
//  HomeViewModel.swift
//  Modern-MVVM-SwiftUI
//
//  Created by Burhan Aras on 16.06.2021.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject{
    @Published private(set) var collections: [Collection]
    @Published private(set) var data: Result<[Collection], CommonError>?
    
    private var networkLayer: INetworkLayer?
    private var cancellables: Set<AnyCancellable> = []
    
    init(networkLayer: INetworkLayer, state: Result<[Collection], CommonError>?) {
        self.networkLayer = networkLayer
        self.collections = dummyCollections
        self.data = state
        subscribe()
        
//        // For testing purposes
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
//            self.data = .success(dummyCollections)
//        }
    }
    
    init(networkLayer: NetworkLayer?) {
        self.networkLayer = networkLayer
        self.collections = dummyCollections
        
        subscribe()
    }
    
    private func subscribe(){
        guard let networkLayer = networkLayer else{
            print("NetworkLayer isn't initialized yet.")
            return
        }
        
        networkLayer.audiobooks
            .sink(receiveCompletion: {[weak self] completion in
                switch completion{
                case let .failure(error) where error == .malformedUrl:
                    self?.data = .failure(.configurationError)
                case .finished:
                    break
                default:
                    self?.data = .failure(.networkError)
                }
            }, receiveValue: {[weak self] value in
                self?.data = .success(value)
            })
            .store(in: &cancellables)
    }
}

let collection0 = Collection(id: UUID().uuidString, title: "Test Collection 0", books: [Book(id: UUID().uuidString, Title: "Test Book", Image: "https://m.media-amazon.com/images/I/41bffUhJ4xL._SL500_.jpg"), Book(id: UUID().uuidString, Title: "Test Book 1", Image: "https://m.media-amazon.com/images/I/41bffUhJ4xL._SL500_.jpg"), Book(id: UUID().uuidString, Title: "Test Book 2", Image: "https://m.media-amazon.com/images/I/41bffUhJ4xL._SL500_.jpg")])
let collection1 = Collection(id: UUID().uuidString, title: "Test Collection 1", books: [Book(id: UUID().uuidString, Title: "Test Book 3", Image: "https://m.media-amazon.com/images/I/41bffUhJ4xL._SL500_.jpg"), Book(id: UUID().uuidString, Title: "Test Book 4", Image: "https://m.media-amazon.com/images/I/41bffUhJ4xL._SL500_.jpg"), Book(id: UUID().uuidString, Title: "Test Book 5", Image: "https://m.media-amazon.com/images/I/41bffUhJ4xL._SL500_.jpg")])
let collection2 = Collection(id: UUID().uuidString, title: "Test Collection 2", books: [Book(id: UUID().uuidString, Title: "Test Book 6", Image: "https://m.media-amazon.com/images/I/41bffUhJ4xL._SL500_.jpg"), Book(id: UUID().uuidString, Title: "Test Book 7", Image: "https://m.media-amazon.com/images/I/41bffUhJ4xL._SL500_.jpg"), Book(id: UUID().uuidString, Title: "Test Book 8", Image: "https://m.media-amazon.com/images/I/41bffUhJ4xL._SL500_.jpg")])
let dummyCollections = [collection0, collection1, collection2]
