//
//  NavigationRow.swift
//  nasaAPI
//
//  Created by Eugenio Pedraza on 06/03/24.
//

import SwiftUI

struct NavigationRow: View {
    var personaje: Personaje
    var body: some View {
        ZStack{
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
            .frame(width: 300, height: 300)
            .scaledToFill()
            .overlay(Text(personaje.name)
                .foregroundColor(.blue)
                .fontWeight(.bold)
                .font(.system(size: 40)))
        }
    }
}

#Preview {
    NavigationRow(personaje: Personaje(id: 2, name: "Rick Sanchez", status: "Alive", gender: "Male", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", species: "Human"))
}
