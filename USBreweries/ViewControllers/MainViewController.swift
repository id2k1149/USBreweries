//
//  ViewController.swift
//  USBreweries
//
//  Created by Max Franz Immelmann on 11/30/22.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - @IBAction
    @IBAction func fetchButtonTapped() {
        fetchBreweries()
    }
    
    // MARK: - Private Methods
    private func successAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Success",
                message: "You can see the results in your Console",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
    private func failedAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Failed",
                message: "You can see error in your Console",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }


}

// MARK: - extension
extension MainViewController {
    
    private func fetchBreweries() {
        guard let url = URL(string: "https://api.openbrewerydb.org/breweries?by_state=maine&by_city=portland") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let breweries = try jsonDecoder.decode([Brewery].self, from: data)

                breweries.forEach { brewery in
                    guard let id = brewery.id else { return }
                    print("id: \(id)")
                    guard let name = brewery.name else { return }
                    print("name: \(name)")
                    guard let brewery_type = brewery.brewery_type else { return }
                    print("brewery_type: \(brewery_type)")
                    guard let street = brewery.street else { return }
                    print("street: \(street)")
                    guard let city = brewery.city else { return }
                    print("city: \(city)")
                    guard let state = brewery.state else { return }
                    print("state: \(state)")
                    guard let postal_code = brewery.postal_code else { return }
                    print("postal_code: \(postal_code)")
                    guard let country = brewery.country else { return }
                    print("country: \(country)")
                    guard let longitude = brewery.longitude else { return }
                    print("longitude: \(longitude)")
                    guard let latitude = brewery.latitude else { return }
                    print("latitude: \(latitude)")
                    guard let phone = brewery.phone else { return }
                    print("phone: \(phone)")
                    guard let website_url = brewery.website_url else { return }
                    print("website_url: \(website_url)")
                    guard let updated_at = brewery.updated_at else { return }
                    print("updated_at: \(updated_at)")
                    guard let created_at = brewery.created_at else { return }
                    print("created_at: \(created_at)")
                    
                    print("***********")
                }
                self.successAlert()
            } catch {
                print(error.localizedDescription)
                self.failedAlert()
            }
            
        }.resume()
        
    }
}
    

