//
//  NetworkManager.swift
//  USBreweries
//
//  Created by Max Franz Immelmann on 12/19/22.
//

import Foundation

struct NetworkManager {
    func fetchBreweries(forCity city: String) {
        
        guard let url = URL(string: "https://api.openbrewerydb.org/breweries?by_city=\(city)")
        else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let breweries = try jsonDecoder.decode([Brewery].self, from: data)
                breweries.forEach { brewery in
                    brewery.printAllValues()
                    print("***********")
                }
//                showAlert(alert: MainViewController.Alert.successAlert)
                
            } catch {
                print(error.localizedDescription)
//                MainViewController.showAlert(alert: MainViewController.Alert.failedAlert)
            }
            
        }.resume()
        
    }
}
