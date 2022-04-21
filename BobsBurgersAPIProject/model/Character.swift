//
//  Character.swift
//  BobsBurgersAPIProject
//
//  Created by Oscar Lara on 4/19/22.
//

import Foundation

struct Character: Codable, CustomStringConvertible, Identifiable {
    let id: Int
    let name: String
    let image: String
    let gender: String?
    let hairColor: String?
    let occupation: String?
    let firstEpisode: String?
    
    var description: String {
        return "Character \(name) is a \(gender) with the occupation of \(occupation)"
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case image
        case gender
        case hairColor
        case occupation
        case firstEpisode
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        image = try values.decode(String.self, forKey: .image)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        hairColor = try values.decodeIfPresent(String.self, forKey: .hairColor)
        occupation = try values.decodeIfPresent(String.self, forKey: .occupation)
        firstEpisode = try values.decodeIfPresent(String.self, forKey: .firstEpisode)
    }
    
    init(name: String, id: Int, image: String, gender: String, hairColor: String, occupation: String, firstEpisode: String) {
        self.name = name
        self.id = id
        self.image = image
        self.gender = gender
        self.hairColor = hairColor
        self.occupation = occupation
        self.firstEpisode = firstEpisode
    }
    
    static func example1() -> Character {
        return Character(name: "Bob",
                         id: 1,
                         image: "https://bobsburgers-api.herokuapp.com/images/characters/3.jpg",
                         gender: "Male",
                         hairColor: "Black",
                         occupation: "Chef",
                         firstEpisode: "Pilot")
    }
    static func example2() -> Character {
        return Character(name: "Linda",
                         id: 2,
                         image: "https://bobsburgers-api.herokuapp.com/characters/3",
                         gender: "Female",
                         hairColor: "Black",
                         occupation: "Chef",
                         firstEpisode: "Pilot")
    }
}


