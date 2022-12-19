//
//  MainViewController+fetchBreweries.swift
//  USBreweries
//
//  Created by Max Franz Immelmann on 12/19/22.
//

import UIKit

extension MainViewController {
    
    func fetchBreweries() {
        guard let url = URL(string: "https://api.openbrewerydb.org/breweries?by_state=maine&by_city=portland")
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
                self.showAlert(alert: Alert.successAlert)
            } catch {
                print(error.localizedDescription)
                self.showAlert(alert: Alert.failedAlert)
            }
            
        }.resume()
    }
}
