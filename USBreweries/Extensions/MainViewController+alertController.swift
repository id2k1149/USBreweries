//
//  MainViewController+alertController.swift
//  USBreweries
//
//  Created by Max Franz Immelmann on 12/19/22.
//

import UIKit

extension MainViewController {
    
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
    
    func showAlert(alert: Alert) {
        DispatchQueue.main.async {
            
            let alertController = UIAlertController (
                title: alert.title,
                message: alert.message,
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            alertController.addAction (okAction)
            self.present (alertController, animated: true)
        }
    }
    
    func citySearchAlertController(withTitle title: String?,
                                      message: String?,
                                      style: UIAlertController.Style,
                                      completionHandler: @escaping(String) -> Void) {
        
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: style
        )
        
        alertController.addTextField { textField in
            let cities = ["San Francisco",
                          "Los Angeles",
                          "New York",
                          "Portland",
                          "Boston"]
            textField.placeholder = cities.randomElement()
        }
        
        let search = UIAlertAction(title: "Search", style: .default) { action in
            let textField = alertController.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
                let city = cityName.split(separator: " ").joined(separator: "%20")
                completionHandler(city)
                
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(search)
        alertController.addAction(cancel)
        present(alertController, animated: true, completion: nil)
    }
    
}

