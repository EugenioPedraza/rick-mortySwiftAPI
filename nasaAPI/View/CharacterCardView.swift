//
//  PhotoRow.swift
//  nasaAPI
//
//  Created by Eugenio Pedraza on 06/03/24.
//

import SwiftUI

struct CharacterCardView: View {
    var personaje: Personaje
    @EnvironmentObject var sharedFavorites: SharedFavoritesViewModel
    @State var isFavorite: Bool = false
    
    var body: some View {
        
        VStack{
            // Esta funcion me permite llamar a una URL NOTA: Debe de URL de tipo OBJETO
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
            .frame(width: 250, height: 250)
            .scaledToFill()
            Text(personaje.name)
                .foregroundColor(.white)
                .font(.system(size:30))
                .fontWeight(.bold)
                .padding()
            VStack{
                HStack{
                    Text("Gender")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Image(systemName: "arrow.right")
                    Text(personaje.gender)
                }
                HStack{
                    Text("Status")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Image(systemName: "arrow.right")
                    Text(personaje.status)
                }
                HStack{
                    Text("Specie")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Image(systemName: "arrow.right")
                    Text(personaje.species)
                }
                HStack{
                    Text("Favorite")
                    Button(action: {
                        self.isFavorite.toggle()
                        if isFavorite {
                            sharedFavorites.favorites.append(personaje)
                        } else {
                            sharedFavorites.favorites.removeAll { $0.id == personaje.id }
                        }
                    }) {
                        Image(systemName: isFavorite ? "star.fill" : "star")
                            .foregroundColor(isFavorite ? .yellow : .gray)
                    }
                }
                .padding()
            } .foregroundColor(.white)
                .font(.system(size: 20))
                .padding(30)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .opacity(0.5)
                        .foregroundColor(.gray)
                )
                .cornerRadius(20)
                .font(.title)
            

            if (personaje.species == "Human"){
                USDZView(modelName: "EARTH.usdz", rotationAngle: 6, busquedaPersonaje: .constant("Rick"))
                    .frame(width: 200, height: 200)
            } else {
                USDZView(modelName: "UFO.usdz", rotationAngle: 6, busquedaPersonaje: .constant("Rick"))
                    .frame(width: 200, height: 200)
                    
            }
        }
        .background(Image("space2"))
            .scaledToFit()
    }
}

struct CharacterCardView_Previews: PreviewProvider {
    static var previews: some View {
        // Provide the sharedFavorites to the environment
        CharacterCardView(personaje: Personaje(id: 1, name: "Rick Sanchez", status: "Alive", gender: "Male", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", species: "Human"))
            .environmentObject(SharedFavoritesViewModel())
    }
}
