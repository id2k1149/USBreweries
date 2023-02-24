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
        phoneLabel.font = UIFont.boldSystemFont(ofSize: 14)
        phoneLabel.text = "phone: \(brewery.phone ?? "N/A")"
        
        let linkString = "\(brewery.website_url ?? "N/A")"
        let attributedString = NSMutableAttributedString(string: linkString)
        let range = NSRange(location: 0, length: attributedString.length)
        let linkAttributes: [NSAttributedString.Key: Any] = [
            .link: URL(string: linkString) as Any,
            .foregroundColor: UIColor.blue,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        attributedString.addAttributes(linkAttributes, range: range)
        webPageLabel.attributedText = attributedString
        webPageLabel.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(labelTapped(_:)))
        webPageLabel.addGestureRecognizer(tapGesture)
    }
    
    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
        if let attributedText = (sender.view as? UILabel)?.attributedText,
            let url = attributedText.attribute(.link, at: 0, effectiveRange: nil) as? URL {
                UIApplication.shared.open(url)
        }
    }

}
