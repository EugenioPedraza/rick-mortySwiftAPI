//
//  Photo.swift
//  nasaAPI
//
//  Created by Eugenio Pedraza on 06/03/24.
//

import Foundation

class SharedFavoritesViewModel: ObservableObject {
    @Published var favorites: [Personaje] = []
}

struct Resultado_API : Codable {
    var results : [Personaje]
}

struct Personaje: Identifiable, Codable, Hashable {
    var id: Int
    var name: String
    var status: String
    var gender: String
    var image: String
    var species: String
    var favorite: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case status
        case gender
        case image
        case species
    }
}
