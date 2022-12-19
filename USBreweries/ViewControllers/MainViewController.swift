//
//  ViewController.swift
//  USBreweries
//
//  Created by Max Franz Immelmann on 11/30/22.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var startScreenView: UIView!
    
    // MARK: - override func
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK: - @IBAction
    @IBAction func fetchButtonTapped() {
        fetchBreweries()
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        self.citySearchAlertController(withTitle: "Enter city name",
                                       message: nil,
                                       style: .alert) {[unowned self] city in
//            self.networkWeatherManager.fetchCurrentWeather(forRequestType: .cityName(city: city))
            print(city)
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
