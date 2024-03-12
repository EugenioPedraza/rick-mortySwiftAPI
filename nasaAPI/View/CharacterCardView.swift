//
//  PhotoRow.swift
//  nasaAPI
//
//  Created by Eugenio Pedraza on 06/03/24.
//

import SwiftUI

struct PhotoRow: View {
    var photo: Photo
    var body: some View {
        
        VStack{
            // Esta funcion me permite llamar a una URL NOTA: Debe de URL de tipo OBJETO
            AsyncImage(url: URL(string: photo.image))
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .shadow(radius: 20)
                .padding()
            Text(photo.name)
                .foregroundColor(.white)
                .font(.system(size:30))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Spacer()
            VStack{
                HStack{
                    Text("Gender:")
                    Text(photo.gender)
                }
                HStack{
                    Text("Status:")
                    Text(photo.status)
                }
                HStack{
                    Text("Specie:")
                    Text(photo.species)
                }
                
                if (photo.species == "Human"){
                    USDZView(modelName: "EARTH.usdz", rotationAngle: 6)
                        .frame(width: 200, height: 200)
                } else {
                    USDZView(modelName: "UFO.usdz", rotationAngle: 6)
                        .frame(width: 200, height: 200)
                }
            } .foregroundColor(.white)
                .font(.system(size: 20))
                .clipShape(Rectangle())
        }.background(Image("space2"))
            .scaledToFit()
    }
}

#Preview {
    PhotoRow(photo: Photo(id: 1, name: "Rick Sanchez", status: "Alive", gender: "Male", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", species: "Human"))
}
