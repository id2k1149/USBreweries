//
//  MainViewController+alertController.swift
//  USBreweries
//
//  Created by Max Franz Immelmann on 12/19/22.
//

import UIKit

extension MainViewController {
    
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
                          "Boston",
                          "Dallas",
                          "Atlanta"]
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
