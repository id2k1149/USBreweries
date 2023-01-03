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

    // MARK: - override func
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print("$$$$$$$$$")
        
//        breweries.forEach { brewery in
//            brewery.printAllValues()
//            print("________")
//        }
//
//
//        print(breweries.first?.state ?? "N/A")
        
        let stateCode = getStateCode(for: breweries
            .first?
            .state
            ?? "N/A")
//        print(usaState)
        
        

        
        
        
        
        
        cityLabel.title = "\(breweries.first?.city ?? "???") (\(stateCode))"
       
        
//
//        breweries.forEach { brewery in
//            print(type(of: brewery.street))
//            print(brewery.street?.contains("N/A") ?? true)
//            print(brewery.street ?? "???????")
//        }
//
//        let breweriesFilter = breweries.filter {
//            !($0.street?.contains("N/A") ?? true)
//            }
        
//        print("$$$$$$$$$")

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        breweries.filter {$0.street != N/A}.count
        breweries.count
//        breweries.filter {
//            !($0.street?.contains("N/A") ?? true)
//        }.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "breweryID", for: indexPath)

        // Configure the cell...
        let brewery = breweries[indexPath.row]
//        let brewery = breweries.filter {
//            !($0.street?.contains("N/A") ?? true)
//        }[indexPath.row]
        
//        cell.configure(brewery: brewery)
        var content = cell.defaultContentConfiguration()
        
        content.text = brewery.name
        content.secondaryText = brewery.street
        
        
//        content.image = UIImage(named: track.title)
//        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        
        cell.contentConfiguration = content

        return cell
    }
}

/*
enum USAState: String, CaseIterable {
    case alabama = "AL"
    case alaska = "AK"
    case arizona = "AZ"
    case arkansas = "AR"
    case california = "CA"
    case colorado = "CO"
    case connecticut = "CT"
    case delaware = "DE"
    case districtOfColumbia = "DC"
    case florida = "FL"
    case georgia = "GA"
    case hawaii = "HI"
    case idaho = "ID"
    case illinois = "IL"
    case indiana = "IN"
    case iowa = "IA"
    case kansas = "KS"
    case kentucky = "KY"
    case louisiana = "LA"
    case maine = "ME"
    case maryland = "MD"
    case massachusetts = "MA"
    case michigan = "MI"
    case minnesota = "MN"
    case mississippi = "MS"
    case missouri = "MO"
    case montana = "MT"
    case nebraska = "NE"
    case nevada = "NV"
    case newHampshire = "NH"
    case newJersey = "NJ"
    case newMexico = "NM"
    case newYork = "NY"
    case northCarolina = "NC"
    case northDakota = "ND"
    case ohio = "OH"
    case oklahoma = "OK"
    case oregon = "OR"
    case pennsylvania = "PA"
    case rhodeIsland = "RI"
    case southCarolina = "SC"
    case southDakota = "SD"
    case tennessee = "TN"
    case texas = "TX"
    case utah = "UT"
    case vermont = "VT"
    case virginia = "VA"
    case washington =  "WA"
    case westVirginia = "WV"
    case wisconsin = "WI"
    case wyoming = "WY"
}
 */


func getStateCode(for state: String) -> String {
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
    case "nevada":
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
