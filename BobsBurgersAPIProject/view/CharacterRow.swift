//
//  CharacterRow.swift
//  BobsBurgersAPIProject
//
//  Created by Oscar Lara on 4/19/22.
//

import SwiftUI

struct CharacterRow: View {
    
    let character: Character
    let imageSize: CGFloat = 100
    
    var body: some View {
        HStack {

                AsyncImage(url: URL(string: character.image)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFill()
                            .frame(width: imageSize, height: imageSize)
                            .cornerRadius(5)
                            .clipped()
                    } else if phase.error != nil {
                        Text(phase.error?.localizedDescription ?? "error")
                            .foregroundColor(Color.pink)
                            .frame(width: imageSize, height: imageSize)
                    } else {
                        ProgressView()
                            .frame(width: imageSize, height: imageSize)
                    }
                }
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(character.name)
                    .font(.headline)
                Text(character.occupation ?? "No current occupation")
            }
        }
    }

struct CharacterRow_Previews: PreviewProvider {
    static var previews: some View {
        CharacterRow(character: Character.example1())
            .previewLayout(.fixed(width: 300, height: 300))
    }
}
