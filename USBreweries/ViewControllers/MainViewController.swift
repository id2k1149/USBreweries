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
    
    // MARK: - override func
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController
        else { return }
        guard let breweryTableVC = navigationVC.topViewController as? BreweryTableViewController
        else { return }
        guard let breweries = sender as? [Brewery] else { return }
        breweryTableVC.breweries = breweries
    }
    
    // MARK: - @IBAction
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        self.citySearchAlertController(withTitle: "Enter US city name",
                                       message: nil,
                                       style: .alert) {[unowned self] city in
            
            let url = "https://api.openbrewerydb.org/breweries?by_city=\(city)"
            networkManagerfetchesBreweries(forURL: url) { [self] breweriesUS in
                
                
                
                breweriesUS.forEach { brewery in
                    print("\(brewery.city ?? "N/A") \(brewery.state ?? "N/A")")
                }
                
                if breweriesUS.first?.city != city {
                    
                }
                
                var states: [String] = []
                breweriesUS.forEach { brewery in

                    if !states.contains(brewery.state ?? "N/A") {
                        states.append(brewery.state ?? "N/A")
                    }
                }
                
                states.forEach { state in
                    print(state)
                }
                
                if states.count > 1 {
                    showAlertController(states: states) {[unowned self] state in
                        guard let city = breweriesUS.first?.city as? String else {return}
                        let url = "https://api.openbrewerydb.org/breweries?by_city=\(city )&by_state=\(state)"
                        networkManagerfetchesBreweries(forURL: url) { [self] breweriesUS in
                            performSegue(withIdentifier: "navigationControllerID", sender: breweriesUS)
                        }
                    }
                }
                
                performSegue(withIdentifier: "navigationControllerID", sender: breweriesUS)
            }
        }
    }
}

// MARK: - extension

extension MainViewController {
    
    private func updateUI() {
        guard let background = UIImage(named: "start-screen-background") else { return }
        startScreenView.backgroundColor = UIColor(patternImage: background)
    }
    
    private func networkManagerfetchesBreweries(forURL url: String,
                                                completion: @escaping([Brewery]) -> Void)  {
        
        NetworkManager.shared.fetchBreweries(forURL: url) { breweriesUS in
            completion(breweriesUS)
        }
    }
}
