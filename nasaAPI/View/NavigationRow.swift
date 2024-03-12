//
//  NavigationRow.swift
//  nasaAPI
//
//  Created by Eugenio Pedraza on 06/03/24.
//

import SwiftUI

struct NavigationRow: View {
    var photo: Photo
    
    var body: some View {
        ZStack{
            AsyncImage(url: URL(string: photo.image))
                .clipShape(Circle())
                .frame(width: 100)
                .scaledToFit()
            Text(photo.name)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.system(size: 40))
        }
    }
}

#Preview {
    NavigationRow(photo: Photo(id: 2, name: "Rick Sanchez", status: "Alive", gender: "Male", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", species: "Human"))
}
