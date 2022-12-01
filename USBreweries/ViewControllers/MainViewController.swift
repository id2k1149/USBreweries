//
//  ViewController.swift
//  USBreweries
//
//  Created by Max Franz Immelmann on 11/30/22.
//

import UIKit

enum Alert: String {
    case successAlert
    case failedAlert
    
    var title: String {
        switch self {
        case .successAlert:
            return "Success"
        case .failedAlert:
            return "Failed"
        }
    }
    
    var message: String {
        switch self {
        case .successAlert:
            return "You can see the results in the Debug aria"
        case .failedAlert:
            return "You can see error in the Debug aria"
        }
    }
}

class MainViewController: UIViewController {
    
    // MARK: - @IBAction
    @IBAction func fetchButtonTapped() {
        fetchBreweries()
    }
    
    // MARK: - Private Methods
    private func showAlert(alert: Alert) {
        DispatchQueue.main.async {
            let alert = UIAlertController (
                title: alert.title,
                message: alert.message,
                preferredStyle: .alert
            )
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction (okAction)
            self.present (alert, animated: true)
        }
    }
}

// MARK: - extension
extension MainViewController {
    
    private func fetchBreweries() {
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
    

