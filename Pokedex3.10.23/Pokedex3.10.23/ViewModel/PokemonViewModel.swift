//
//  PokemonViewModel.swift
//  Pokedex3.10.23
//
//  Created by Consultant on 3/13/23.
//

import Foundation
import Combine


class PokemonViewModel: ObservableObject{
    
    
    @Published var listPokemon: [Pokemon] = []
    @Published var searchText: String = ""
    
    var networkManager: Networkable
    private var cancelable = Set<AnyCancellable>()
    
    init(networkManager:NetworkManager){
        self.networkManager = networkManager
    }
    
    func getListPokemon(urlString:String){
        guard let url = URL(string: urlString) else {
            print("URL error")
            return
            
        }
        self.networkManager.getDataFromURL(url: url, type: Datum.self)
            .sink { completion in
                switch completion{
                case .finished:
                    print("Task is done")
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { datum in
                print(datum)
                DispatchQueue.main.async {
                    self.listPokemon = datum.data
                }
            }.store(in: &cancelable)
//        $searchText
//            .combineLatest(networkManager.$listPokemon)
        
        
    }
    
    
    
}
