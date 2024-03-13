//
//  FavoritesView.swift
//  nasaAPI
//
//  Created by Eugenio Pedraza on 12/03/24.
//

import SwiftUI

struct FavoritesView: View {
    @Binding var favorites: [Personaje]
    
    var body: some View {
        
        if !favorites.isEmpty {
            List(favorites){ item in
                Text(item.name)
            }
        } else {
            Text("Begin by marking your favorite characters...")
        }

    }
}

