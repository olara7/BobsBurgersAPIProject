//
//  CharacterListView.swift
//  BobsBurgersAPIProject
//
//  Created by Oscar Lara on 4/19/22.
//

import SwiftUI

struct CharacterListView: View {
    let characters: [Character]
    
    @State private var searchText: String = ""
    
    var filteredCharacters: [Character] {
        if searchText.count == 0 {
            return characters
        } else {
            return characters.filter { $0.name.contains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredCharacters) { character in
                    NavigationLink {
                        CharacterDetailView(character: character)
                    } label: {
                        CharacterRow(character: character)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Bob's Burgers")
            .searchable(text: $searchText)
        }
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView(characters: CharacterFetcher.successState().characters)
    }
}
