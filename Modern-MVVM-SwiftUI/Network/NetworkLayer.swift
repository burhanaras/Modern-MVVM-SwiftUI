//
//  NetworkLayer.swift
//  Modern-MVVM-SwiftUI
//
//  Created by Burhan Aras on 20.06.2021.
//

import Foundation
import Combine
import Network

protocol INetworkLayer{
    var audiobooks: AnyPublisher<[Collection], RequestError> { get }
}

class NetworkLayer: INetworkLayer{
    
    private static let baseUrl = "https://github.com/burhanaras/Modern-MVVM-SwiftUI/blob/main/Modern-MVVM-SwiftUI/Files"
    private let decoder = JSONDecoder()
    
    var audiobooks: AnyPublisher<[Collection],RequestError> {
        let url = URL(string: Self.baseUrl)?.appendingPathComponent("/audiobooks.json")
        let publisher: AnyPublisher<[Collection], RequestError> = fetch(url: url)
        return publisher.eraseToAnyPublisher()
    }
    
    private func fetch<NetworkModel: Codable>(url: URL?) -> AnyPublisher<NetworkModel, RequestError>{
        guard let url = url else{
            return Result<NetworkModel, RequestError>
                .Publisher(.failure(.malformedUrl))
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .retry(3)
            .map{$0.data}
            .decode(type: NetworkModel.self, decoder: self.decoder)
            .receive(on: RunLoop.main)
            .mapError{_ in return .networkError}
            .eraseToAnyPublisher()
        
    }
    
}

class DummyNetworkLayer: INetworkLayer{
    var audiobooks: AnyPublisher<[Collection], RequestError> {
        return Result<[Collection], RequestError>
            .Publisher(.success(dummyCollections))
            .eraseToAnyPublisher()
    }
}

class DummyFailingNetworkLayer: INetworkLayer{
    var audiobooks: AnyPublisher<[Collection], RequestError>{
        return Result<[Collection], RequestError>
            .Publisher(.failure(.networkError))
            .eraseToAnyPublisher()
    }
}
