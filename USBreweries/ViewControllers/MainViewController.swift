//
//  ViewController.swift
//  USBreweries
//
//  Created by Max Franz Immelmann on 11/30/22.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - @IBOutlet
    @IBOutlet weak var startScreenView: UIView!
    
    // MARK: - Override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController
        else { return }
        
        guard let breweryTableVC = navigationVC.topViewController as? BreweryTableViewController
        else { return }

        guard let cityName = sender as? String else { return }
        breweryTableVC.city = cityName
    }
    
    // MARK: - @IBAction
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        citySearchAlertController(withTitle: "Enter US city name",
                                  message: nil,
                                  style: .alert) {[unowned self] city in
            
            performSegue(withIdentifier: "navigationControllerID", sender: city)
            
        }
    }
}

// MARK: - Extensions
extension MainViewController {
    
    private func updateUI() {
        guard let background = UIImage(named: "screen-background") else { return }
        startScreenView.backgroundColor = UIColor(patternImage: background)
    }
    
    private func citySearchAlertController(withTitle title: String?,
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
                completionHandler(cityName)
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(search)
        alertController.addAction(cancel)
        present(alertController, animated: true, completion: nil)
    }
    
}
