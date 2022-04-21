//
//  ContentView.swift
//  BobsBurgersAPIProject
//
//  Created by Oscar Lara on 4/19/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var characterFetcher = CharacterFetcher()
    var body: some View {
        if characterFetcher.isLoading {
            LoadingView()
        } else if characterFetcher.errorMessage != nil {
            ErrorView(characterFetcher: characterFetcher)
        } else {
            CharacterListView(characters: characterFetcher.characters)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
