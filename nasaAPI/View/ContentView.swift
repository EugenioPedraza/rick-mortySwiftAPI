//
//  ContentView.swift
//  nasaAPI
//
//  Created by Eugenio Pedraza on 06/03/24.
//

import SwiftUI

struct ContentView: View {
    @State var fotoVM = PhotoViewModel()
    var body: some View {
            NavigationView {
                List(fotoVM.arrPhotos) { item in
                    NavigationLink(destination: PhotoRow(photo: item)) {
                        NavigationRow(photo: item)
                            .frame(width: 300, height: 300)
                    }
                }
                .task {
                    do {
                        try await fotoVM.getPhotosNasa()
                    } catch {
                        print("Error calling the photos")
                    }
                }
                .navigationTitle("RickyPedia")
            }
    }
}


#Preview {
    ContentView()
}
