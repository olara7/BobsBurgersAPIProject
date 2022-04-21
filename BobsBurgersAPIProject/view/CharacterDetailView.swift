//
//  CharacterDetailView.swift
//  BobsBurgersAPIProject
//
//  Created by Oscar Lara on 4/19/22.
//

import SwiftUI

struct CharacterDetailView: View {
    let character: Character
    let imageSize: CGFloat = 300
    let roundedRect = CGSize(width: 20, height: 20)
    
    var body: some View {
        ScrollView {
            VStack {
                Text(character.name)
                    .font(.headline)
                AsyncImage(url: URL(string: character.image)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFit()
                            .frame(height: imageSize)
                            .cornerRadius(5)
                            .clipped()
                    } else {
                      ProgressView()
                            .frame(width: imageSize, height: imageSize)
                    }
                }
                
                Section(header: Text("Character Info")) {
                    HStack {
                        Text("Gender")
                        Spacer()
                        Text(character.gender ?? "No current gender")
                    }
                    .padding()
                    HStack {
                        Text("Hair Color")
                        Spacer()
                        Text(character.hairColor ?? "No current hair color")
                    }
                    .padding()
                    HStack {
                        Text("Occupation")
                        Spacer()
                        Text(character.occupation ?? "No current occupation")
                    }
                    .padding()
                    HStack {
                        Text("First Episode")
                        Spacer()
                        Text(character.firstEpisode ?? "No current first episode")
                    }
                    .padding()
                }
                
                /*
                VStack(alignment: .leading, spacing: 5) {
                    if character.gender == "Male" {
                        Text(character.gender!)
                            .padding()
                            .background(Color.blue)
                            .clipShape(Capsule())
                    } else {
                        Text(character.gender!)
                            .padding()
                            .background(Color.pink)
                            .clipShape(Capsule())
                    }
                    Text(character.hairColor ?? "No current hair color")
                    Text(character.occupation ?? "No current Occupation")
                    Text(character.firstEpisode ?? "No current first episode")
                }
                Spacer()
                 */
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(character: Character.example1())
    }
}
