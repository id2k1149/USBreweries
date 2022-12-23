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
            networkManagerfetchesBreweries(forCity: city) { [self] breweriesUS in
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
    
    private func networkManagerfetchesBreweries(forCity city: String,
                                                completion: @escaping([Brewery]) -> Void)  {
        
        NetworkManager.shared.fetchBreweries(forCity: city) { breweriesUS in
            completion(breweriesUS)
        }
    }
}
