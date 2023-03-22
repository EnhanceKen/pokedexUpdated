//
//  NetworkManager.swift
//  Pokedex3.10.23
//
//  Created by Consultant on 3/13/23.
//

import Foundation
import Combine

protocol Networkable{
    func getDataFromURL<T:Decodable>(url:URL, type: T.Type) -> AnyPublisher<T,Error>
}

class NetworkManager: Networkable{
    func getDataFromURL<T>(url: URL, type: T.Type) -> AnyPublisher<T, Error> where T : Decodable {
        return URLSession.shared.dataTaskPublisher(for: url)
            .map{$0.data}
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
