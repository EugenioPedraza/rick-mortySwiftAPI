//
//  Photo.swift
//  nasaAPI
//
//  Created by Eugenio Pedraza on 06/03/24.
//

import Foundation

struct Photo: Identifiable, Codable, Hashable {
    var id: Int
    var name: String
    var status: String
    var gender: String
    var image: String
    var species: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case status
        case gender
        case image
        case species
    }
}
