//
//  PerfilView.swift
//  nasaAPI
//
//  Created by Eugenio Pedraza on 08/03/24.
//

import SwiftUI


struct BuscadorView: View {
    @State private var busquedaPersonaje: String = ""
    @State private var viewModel = PhotoViewModel()
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)

    var body: some View {
        VStack {
            TextField("Buscar Personaje...", text: $busquedaPersonaje)
                .frame(width: 300)
                .padding()

            ScrollView {
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(viewModel.arrPersonajes.filter {
                        busquedaPersonaje.isEmpty || $0.name.localizedCaseInsensitiveContains(busquedaPersonaje)
                    }) { item in
                        SearchView(personaje: item)
                    }
                }
            }
        }
        .onAppear {
            Task {
                do {
                    try await viewModel.getPersonajesData()
                } catch {
                    print("Error fetching data")
                }
            }
        }
    }
}
