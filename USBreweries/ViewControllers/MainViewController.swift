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
    
    //    private var breweriesList: [Brewery] = []
    
    
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
        
//        guard let breweries = sender as? [Brewery] else { return }
//        breweryTableVC.breweries = breweries
        
        guard let cityName = sender as? String else { return }
        breweryTableVC.city = cityName
    }
    
    // MARK: - @IBAction
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        self.citySearchAlertController(withTitle: "Enter US city name",
                                       message: nil,
                                       style: .alert) {[unowned self] city in
            
            performSegue(withIdentifier: "navigationControllerID", sender: city)
            
            /*
            let url = "https://api.openbrewerydb.org/breweries?by_city=\(city)"
            networkManagerfetchesBreweries(forURL: url) { [self] breweriesUS in
                
                let citySplitAndJoin = city.split(separator: "%20").joined(separator: " ")
                
                if breweriesUS.first?.city != citySplitAndJoin {
                    cityErrorAlertControler(with: "Can't find \"\(citySplitAndJoin)\" city",
                                            and: "Please, enter correct city name")
                    return
                }
                
                /*
                var states: [String] = []
                
                breweriesUS.forEach { brewery in
                    
                    if !states.contains(brewery.state ?? "N/A") {
                        states.append(brewery.state ?? "N/A")
                    }
                }
                
                if states.count > 1 {
                    selectStateAlertController(states: states,
                                               city: city) {[unowned self] state in
                        
                        guard let city = breweriesUS.first?.city as? String else {return}
                        
                        let stateSplitAndJoin = state.split(separator: " ").joined(separator: "%20")
                        
                        let url = "https://api.openbrewerydb.org/breweries?by_city=\(city)&by_state=\(stateSplitAndJoin)"
                        
                        networkManagerfetchesBreweries(forURL: url) { [self] breweriesUS in
                            performSegue(withIdentifier: "navigationControllerID", sender: breweriesUS)
                        }
                    }
                }
                */
                
                performSegue(withIdentifier: "navigationControllerID", sender: breweriesUS)
            }
            */
        }
    }
}

// MARK: - Extensions

extension MainViewController {
    
    private func updateUI() {
        guard let background = UIImage(named: "screen-background") else { return }
        startScreenView.backgroundColor = UIColor(patternImage: background)
    }
    
    /*
    private func networkManagerfetchesBreweries(forURL url: String,
                                                completion: @escaping([Brewery]) -> Void)  {
        
        NetworkManager.shared.fetchBreweries(forURL: url) { breweriesUS in
            completion(breweriesUS)
        }
    }
     */
    
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
//                let city = cityName.split(separator: " ").joined(separator: "%20")
                completionHandler(cityName)
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(search)
        alertController.addAction(cancel)
        present(alertController, animated: true, completion: nil)
    }
    
    /*
    private func selectStateAlertController(states: [String],
                                            city: String,
                                            completionHandler: @escaping(String) -> Void ) {
        
        let alertController = UIAlertController(title: "A few states have \(city) city",
                                                message: "Please choose one state",
                                                preferredStyle: .alert)
        
        for state in states {
            let action = UIAlertAction(title: state, style: .default, handler: { (action) in
                completionHandler(state)
            })
            alertController.addAction(action)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    */
    
   
}
