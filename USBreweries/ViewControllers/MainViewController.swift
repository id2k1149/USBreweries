//
//  ViewController.swift
//  USBreweries
//
//  Created by Max Franz Immelmann on 11/30/22.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - @IBOutlet
    @IBOutlet weak var startScreenView: UIView!
    
    let networkManager = NetworkManager()
    
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
            networkManager.fetchBreweries(forCity: city)
        }
    }
}

// MARK: - extension
extension MainViewController {
    private func updateUI() {
        guard let background = UIImage(named: "start-screen-background") else { return }
        startScreenView.backgroundColor = UIColor(patternImage: background)
    }
}
