//
//  ErrorView.swift
//  BobsBurgersAPIProject
//
//  Created by Oscar Lara on 4/19/22.
//

import SwiftUI

struct ErrorView: View {
    
    @ObservedObject var characterFetcher: CharacterFetcher
    
    var body: some View {
        VStack {
            Text("Error")
                .font(.system(size: 20))
            
            Text(characterFetcher.errorMessage ?? "")
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(characterFetcher: CharacterFetcher())
    }
}
