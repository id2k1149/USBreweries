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
        streetLabel.text = "\(brewery.street ?? "N/A"), \(brewery.postal_code ?? "")"
        webPageLabel.textColor = UIColor.blue
        webPageLabel.text = "\(brewery.website_url ?? "N/A")"
        phoneLabel.textColor = UIColor.orange
        phoneLabel.font = UIFont.boldSystemFont(ofSize: 14)
        phoneLabel.text = "phone: \(brewery.phone ?? "N/A")"
    }
}
