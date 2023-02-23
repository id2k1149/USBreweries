//
//  Brewery.swift
//  USBreweries
//
//  Created by Max Franz Immelmann on 11/30/22.
//

struct Brewery: Decodable {
    let name: String?
    let street: String?
    let city: String?
    let state: String?
    let postal_code: String?
    let phone: String?
    let website_url: String?
    
    init(breweryData: [String: Any]) {
        name = breweryData["name"] as? String
        street = breweryData["street"] as? String
        city = breweryData["city"] as? String
        state = breweryData["state"] as? String
        postal_code = breweryData["postal_code"] as? String
        phone = breweryData["phone"] as? String
        website_url = breweryData["website_url"] as? String
    }
    
    static func getBreweries(from value: Any) -> [Brewery] {
        guard let breweriesData = value as? [[String: Any]] else {return []}
        /*
        var breweries: [Brewery] = []
        for eachBrevery in breweriesData {
            let brewery = Brewery(breweryData: eachBrevery)
            breweries.append(brewery)
        }
        return breweries
        */
        return breweriesData.compactMap { Brewery(breweryData: $0)}
    }
}
