//
//  PhotoViewModel.swift
//  nasaAPI
//
//  Created by Eugenio Pedraza on 06/03/24.
//

import Foundation

@Observable
class PhotoViewModel {
    var arrPersonajes =  [Personaje]()
    
    // Pasos para ingresar una API
    
    func getPersonajesData() async throws{
        // 1. Crear un objeto URL
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            print("Invalid URL")
            return
        }
        
        // 2. Preparar el Request a la pagina http con el URL
        
        
        let urlRequest = URLRequest(url: url)
        
        // 3. Realizar la llamada con URLSession
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            print("Error")
            return
        }
        
        // 4. Decodificar la informavcion de formato JSON
        
        let results = try JSONDecoder().decode(Resultado_API.self, from: data)
        print(results)
        // 5. Utilizamos el thread principal para actualizar la variable de Photos.
        
        DispatchQueue.main.async{
            self.arrPersonajes = results.results
        }
    }
}

