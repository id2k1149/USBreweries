//
//  NetworkManager.swift
//  USBreweries
//
//  Created by Max Franz Immelmann on 12/19/22.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    private init(){}
    
    func fetchBreweries(forURL url: String,
                        completion: @escaping([Brewery]) -> Void) {
        
        print("url before \(url)")
       
        let urlSplitAndJoin = url.split(separator: " ").joined(separator: "%20")
        guard let urlForData = URL(string: urlSplitAndJoin) else { return }
        print("url after \(urlForData)")
        
        URLSession.shared.dataTask(with: urlForData) { data, _, error in
            print(data ?? "????????????")
            
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            
            
            do {
                let jsonDecoder = JSONDecoder()
                let breweries = try jsonDecoder.decode([Brewery].self, from: data)
                
                breweries.forEach { brewery in
                    print("\(brewery.name ?? "no name") \(brewery.state ?? "no state")")
                }
                
                let breweriesWithAddress = breweries.filter {
                    !($0.street?.contains("N/A") ?? true)
                }
                
//                print(breweriesWithAddress)
                
                DispatchQueue.main.async {
                    completion(breweriesWithAddress)
                }
                
            } catch {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}
