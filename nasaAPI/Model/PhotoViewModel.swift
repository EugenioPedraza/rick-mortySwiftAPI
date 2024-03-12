//
//  PhotoViewModel.swift
//  nasaAPI
//
//  Created by Eugenio Pedraza on 06/03/24.
//

import Foundation

@Observable
class PhotoViewModel {
    var arrPhotos =  [Photo]()
    
    
    
    // Pasos para ingresar una API
    
    func getPhotosNasa() async throws{
        // 1. Crear un objeto URL
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16") else {
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
        
        let results = try JSONDecoder().decode([Photo].self, from: data)
        print(results)
        // 5. Utilizamos el thread principal para actualizar la variable de Photos.
        
        DispatchQueue.main.async{
            self.arrPhotos = results 
        }
    }
}

