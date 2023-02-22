//
//  BreweryCell.swift
//  USBreweries
//
//  Created by Max Franz Immelmann on 2/22/23.
//

import UIKit

class BreweryCell: UITableViewCell {

    @IBOutlet weak var breweryNameLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var webPageLabel: UILabel!
    
    func configure(with brewery: Brewery) {
        breweryNameLabel.text = brewery.name
        streetLabel.text = brewery.street
        phoneLabel.text = "phone: \(brewery.phone ?? "N/A")"
        webPageLabel.text = "web: \(brewery.website_url ?? "N/A")"
    }
}
