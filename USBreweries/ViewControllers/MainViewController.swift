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
                    brewery.printAllValues()
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
    

