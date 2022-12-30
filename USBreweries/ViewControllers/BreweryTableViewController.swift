//
//  BreweryTableViewController.swift
//  USBreweries
//
//  Created by Max Franz Immelmann on 12/21/22.
//

import UIKit

class BreweryTableViewController: UITableViewController {
    
    @IBOutlet weak var cityLabel: UINavigationItem!
    
    var breweries: [Brewery]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityLabel.title = "\(breweries.first?.city ?? "???") (\(breweries.first?.state ?? "??")) breweries"
       
        print("$$$$$$$$$")
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
        breweries.forEach { brewery in
            brewery.printAllValues()
            print("________")
        }
        print("$$$$$$$$$")

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
