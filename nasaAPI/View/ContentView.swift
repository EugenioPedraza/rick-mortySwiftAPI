//
//  ContentView.swift
//  nasaAPI
//
//  Created by Eugenio Pedraza on 06/03/24.
//

import SwiftUI

struct ContentView: View {
    @State var fotoVM = PhotoViewModel()
    @EnvironmentObject var sharedFavorites: SharedFavoritesViewModel
    
    var body: some View {
        TabView{
            NavigationView {
                List(fotoVM.arrPersonajes) { item in
                    NavigationLink(destination: CharacterCardView(personaje: item)) {
                        NavigationRow(personaje: item)
                            .frame(width: 300, height: 300)
                    }
                }
                .task {
                    do {
                        try await fotoVM.getPersonajesData()
                    } catch {
                        print("Error calling the photos")
                    }
                }
                .navigationTitle("RickyPedia")
            }
            .tabItem{
                Label("Lista", systemImage: "house")
            }
            FavoritesView(favorites: $sharedFavorites.favorites)
                .tabItem {
                    Label("Favoritos", systemImage: "star")
                }
            BuscadorView()
                .tabItem{
                    Label("Busqueda", systemImage: "magnifyingglass")
                }
        }
        
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SharedFavoritesViewModel())
    }
}
