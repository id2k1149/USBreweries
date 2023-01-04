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
    
    var breweries: [Brewery]!

    // MARK: - Override functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "breweryID", for: indexPath)

        let brewery = breweries[indexPath.row]

        var content = cell.defaultContentConfiguration()
 
        content.text = brewery.name
        content.secondaryText = "\(brewery.street ?? ""), phone: \(brewery.phone ?? "N/A")"
        
        cell.contentConfiguration = content

        return cell
    }
}

// MARK: - Extensions

extension BreweryTableViewController {
    
    private func updateUI() {
        let stateCode = getStateCode(for: breweries
            .first?
            .state
            ?? "N/A")

        cityLabel.title = "\(breweries.first?.city ?? "N/A") (\(stateCode))"
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
