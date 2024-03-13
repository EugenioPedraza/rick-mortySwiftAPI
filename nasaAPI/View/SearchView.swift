//
//  SearchView.swift
//  nasaAPI
//
//  Created by Eugenio Pedraza on 12/03/24.
//

import SwiftUI

struct SearchView: View {
    var personaje: Personaje
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: personaje.image)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } else if phase.error != nil {
                    Text("Error loading image")
                } else {
                    ProgressView()
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            .frame(width: 150, height: 150)
            .scaledToFill()
            .overlay(
                Text(personaje.name)
                    .foregroundColor(.blue)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
            )
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(personaje: Personaje(id: 20, name: "Rick Sanchez Rick Sanchez", status: "Alive", gender: "Male", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", species: "Human"))
    }
}

