//
//  FetchData.swift
//  CockTailAPI
//
//  Created by Joyce Wu (student LM) on 12/16/24.
//

import Foundation

struct FetchData {
    
    var response: Response = Response() // Initial empty response
    
    // Function to fetch data from the Cocktail DB API
    mutating func getData() async {
        let URLString = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?g=Cocktail_glass"
        
        guard let url = URL(string: URLString) else { return }
        
        do {
            // Make the network request
            let (data, _) = try await URLSession.shared.data(from: url)
            // Decode the response into the Response struct
            self.response = try JSONDecoder().decode(Response.self, from: data)
            
            // For debugging: Print the raw JSON data
            let dataString = String(data: data, encoding: .utf8)
            print(dataString ?? "No data available")
        } catch {
            // Handle any errors in the network request or decoding
            print("Error fetching or decoding data: \(error)")
        }
    }
}

// Response struct to map the JSON response from the API
struct Response: Codable {
    var drinks: [Drink] = []
}

// Drink struct represents each cocktail in the list
struct Drink: Codable, Identifiable {
    var strDrink: String?
    var strDrinkThumb: URL?
    var idDrink: Int
    
    var id: Int { idDrink } // Make Drink identifiable for ForEach
}


