//
//  NetworkManager.swift
//  USBreweries
//
//  Created by Max Franz Immelmann on 12/19/22.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init(){}
    
    func fetchBreweries(forCity city: String,
                        completion: @escaping([Brewery]) -> Void) {
        
        guard let url = URL(string: "https://api.openbrewerydb.org/breweries?by_city=\(city)")
        else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let breweries = try jsonDecoder.decode([Brewery].self, from: data)
                
                DispatchQueue.main.async {
                    completion(breweries)
                }
                
            } catch {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}
