//
//  NetworkManager.swift
//  USBreweries
//
//  Created by Max Franz Immelmann on 12/19/22.
//

import Foundation
import Alamofire

final class NetworkManager {
    static let shared = NetworkManager()
    private init(){}
    
    func fetchBreweries(for city: String,
                        completion: @escaping([Brewery]) -> Void) {
        
        let citySplitAndJoin = city.split(separator: "%20").joined(separator: " ")
        let url = "https://api.openbrewerydb.org/breweries?by_city=\(citySplitAndJoin)"
        
        AF.request(url, method: .get)
            .validate()
            .responseJSON {_ in
                
                /*
                response in
                    switch response.result {
                    case .success(let value):
                        let courses = Brewery.getBreweries(from: value)
                        completion(.success(courses))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                 */
            }
    }
    
    /*
    func fetchBreweries(forURL url: String,
                        completion: @escaping([Brewery]) -> Void) {
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let breweries = try jsonDecoder.decode([Brewery].self, from: data)
                
                let breweriesWithAddress = breweries.filter {
                    !($0.street?.contains("N/A") ?? true)
                }
                
                DispatchQueue.main.async {
                    completion(breweriesWithAddress)
                }
                
            } catch { print(error.localizedDescription) }
            
        }.resume()
    }
     */
}
