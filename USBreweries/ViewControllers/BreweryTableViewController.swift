//
//  BreweryTableViewController.swift
//  USBreweries
//
//  Created by Max Franz Immelmann on 12/21/22.
//

import UIKit

final class BreweryTableViewController: UITableViewController {
    
    // MARK: - @IBOutlet
    @IBOutlet weak var cityLabel: UINavigationItem!
    
    var city: String!
    private var breweries: [Brewery] = []

    // MARK: - Override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 110
        fetchBreweries()
    }

    // MARK: - @IBAction
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        breweries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "breweryCell",
                                                       for: indexPath) as? BreweryCell
        else { return UITableViewCell() }
        
        let brewery = breweries[indexPath.row]
        cell.configure(with: brewery)
        return cell
    }
}

// MARK: - Extensions
extension BreweryTableViewController {
    
    private func fetchBreweries() {
        NetworkManager.shared.fetchBreweries(for: city) { [self] result in
            
            switch result {
            case .success(let breweries):
               
                if city != breweries.first?.city {
                    cityErrorAlertControler(with: "Can't find \"\(city ?? "")\" city",
                                                  and: "Please, enter correct city name")
                }
                
                var states: [String] = []
                
                breweries.forEach { brewery in
                    
                    if !states.contains(brewery.state ?? "N/A") {
                        states.append(brewery.state ?? "N/A")
                    }
                }
                
                if states.count > 1 {
                    cityLabel.title = "\(city ?? "") (??)"
                    
                    self.selectStateAlertController(states: states,
                                                    city: self.city ?? "N/A") { [self] state in
                        
                        self.breweries = breweries.filter { $0.state == state }
                        let stateCode = getStateCode(for: self.breweries
                            .first?
                            .state
                            ?? "??")
                        cityLabel.title = "\(self.breweries.first?.city ?? "") (\(stateCode))"
                        self.tableView.reloadData()
                    }
                } else {
                    let stateCode = getStateCode(for: breweries
                        .first?
                        .state
                        ?? "??")

                    cityLabel.title = "\(breweries.first?.city ?? city ?? "Can't find your city") (\(stateCode))"
                
                    self.breweries = breweries
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func cityErrorAlertControler(with title: String, and message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK",
                                     style: .default)
        { [self] _ in
            dismiss(animated: false)
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    
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
    
    
    
    private func getStateCode(for state: String) -> String {
        switch state.lowercased() {
        case "alabama":
            return "AL"
        case "alaska":
            return "AK"
        case "arizona":
            return "AZ"
        case "arkansas":
            return "AR"
        case "california":
            return "CA"
        case "colorado":
            return "CO"
        case "connecticut":
            return "CT"
        case "delaware":
            return "DE"
        case "district of columbia":
            return "DC"
        case "florida":
            return "FL"
        case "georgia":
            return "GA"
        case "hawaii":
            return "HI"
        case "idaho":
            return "ID"
        case "illinois":
            return "IL"
        case "indiana":
            return "IN"
        case "iowa":
            return "IA"
        case "kansas":
            return "KS"
        case "kentucky":
            return "KY"
        case "Louisiana":
            return "LA"
        case "maine":
            return "ME"
        case "maryland":
            return "MD"
        case "massachusetts":
            return "MA"
        case "michigan":
            return "MI"
        case "minnesota":
            return "MN"
        case "mississippi":
            return "MS"
        case "missouri":
            return "MO"
        case "montana":
            return "MT"
        case "nebraska":
            return "NE"
        case "nevada":
            return "NV"
        case "new hampshire":
            return "NH"
        case "new jersey":
            return "NJ"
        case "new mexico":
            return "NM"
        case "new york":
            return "NY"
        case "north carolina":
            return "NC"
        case "north dakota":
            return "ND"
        case "ohio":
            return "OH"
        case "oklahoma":
            return "OK"
        case "oregon":
            return "OR"
        case "pennsylvania":
            return "PA"
        case "rhode island":
            return "RI"
        case "south carolina":
            return "SC"
        case "south dakota":
            return "SD"
        case "tennessee":
            return "TN"
        case "texas":
            return "TX"
        case "utah":
            return "UT"
        case "vermont":
            return "VT"
        case "virginia":
            return "VA"
        case "washington":
            return "WA"
        case "west virginia":
            return "WV"
        case "wisconsin":
            return "WI"
        case "wyoming":
            return "WY"
        default:
            return "??"
        }
    }
}
