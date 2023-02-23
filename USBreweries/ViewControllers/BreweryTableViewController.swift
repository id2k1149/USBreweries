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
    
//    var breweries: [Brewery]!
    var city: String!
    private var breweries: [Brewery] = []

    // MARK: - Override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 110
//        updateUI()
       
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
    
    func fetchBreweries() {
        NetworkManager.shared.fetchBreweries(for: city) { [weak self] result in
            switch result {
            case .success(let breweries):
               
                if self?.city != breweries.first?.city {
                    self?.cityErrorAlertControler(with: "Can't find \"\(self?.city ?? "")\" city",
                                                  and: "Please, enter correct city name")
                }
                
                self?.cityLabel.title = "\(breweries.first?.city ?? self?.city ?? "N/A")"
                 
                self?.breweries = breweries
                self?.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func updateUI() {
        let stateCode = getStateCode(for: breweries
            .first?
            .state
            ?? "N/A")

        cityLabel.title = "\(breweries.first?.city ?? "N/A") (\(stateCode))"
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
    
    
    private func getStateCode(for state: String) -> String {
        switch state {
        case "Alabama":
            return "AL"
        case "Alaska":
            return "AK"
        case "Arizona":
            return "AZ"
        case "Arkansas":
            return "AR"
        case "California":
            return "CA"
        case "Colorado":
            return "CO"
        case "Connecticut":
            return "CT"
        case "Delaware":
            return "DE"
        case "District of Columbia":
            return "DC"
        case "Florida":
            return "FL"
        case "Georgia":
            return "GA"
        case "Hawaii":
            return "HI"
        case "Idaho":
            return "ID"
        case "Illinois":
            return "IL"
        case "Indiana":
            return "IN"
        case "Iowa":
            return "IA"
        case "Kansas":
            return "KS"
        case "Kentucky":
            return "KY"
        case "Louisiana":
            return "LA"
        case "Maine":
            return "ME"
        case "Maryland":
            return "MD"
        case "Massachusetts":
            return "MA"
        case "Michigan":
            return "MI"
        case "Minnesota":
            return "MN"
        case "Mississippi":
            return "MS"
        case "Missouri":
            return "MO"
        case "Montana":
            return "MT"
        case "Nebraska":
            return "NE"
        case "Nevada":
            return "NV"
        case "New Hampshire":
            return "NH"
        case "New Jersey":
            return "NJ"
        case "New Mexico":
            return "NM"
        case "New York":
            return "NY"
        case "North Carolina":
            return "NC"
        case "North Dakota":
            return "ND"
        case "Ohio":
            return "OH"
        case "Oklahoma":
            return "OK"
        case "Oregon":
            return "OR"
        case "Pennsylvania":
            return "PA"
        case "Rhode Island":
            return "RI"
        case "South Carolina":
            return "SC"
        case "South Dakota":
            return "SD"
        case "Tennessee":
            return "TN"
        case "Texas":
            return "TX"
        case "Utah":
            return "UT"
        case "Vermont":
            return "VT"
        case "Virginia":
            return "VA"
        case "Washington":
            return "WA"
        case "West Virginia":
            return "WV"
        case "Wisconsin":
            return "WI"
        case "Wyoming":
            return "WY"
        default:
            return "N/A"
        }
    }
}
