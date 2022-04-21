//
//  CharacterFetcher.swift
//  BobsBurgersAPIProject
//
//  Created by Oscar Lara on 4/19/22.
//

import Foundation

class CharacterFetcher: ObservableObject {
    
    @Published var characters = [Character]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    init() {
        fetchAllCharacters()
    }
    
    func fetchAllCharacters() {
        isLoading = true
        errorMessage = nil
        
        let service = APIService()
        let url = URL(string: "https://bobsburgers-api.herokuapp.com/characters/")
        service.fetchCharacters(url: url) { [unowned self] result in
            
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    print(error)
                case .success(let characters):
                    print("success with \(characters.count)")
                    self.characters = characters
                }
            }
        
        }
        
    }
    
    //MARK: preview helpers

    static func errorState() -> CharacterFetcher {
        let fetcher = CharacterFetcher()
        fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }

    static func successState() -> CharacterFetcher {
        let fetcher = CharacterFetcher()
        //fetcher.characters = [Character.example1(), Character.example2()]
        
        return fetcher
    }
}
