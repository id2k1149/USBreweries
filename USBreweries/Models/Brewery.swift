//
//  Brewery.swift
//  USBreweries
//
//  Created by Max Franz Immelmann on 11/30/22.
//

struct Brewery: Decodable {
    let id: String?
    let name: String?
    let brewery_type: String?
    let street: String?
    let city: String?
    let state: String?
    let postal_code: String?
    let country: String?
    let longitude: String?
    let latitude: String?
    let phone: String?
    let website_url: String?
    let updated_at: String?
    let created_at: String?
    
    /*
    func printAllValues() {
        print("id: \(self.id ?? "N/A")")
        print("name: \(self.name ?? "N/A")")
        print("brewery_type: \(self.brewery_type ?? "N/A")")
        print("street: \(self.street ?? "N/A")")
        print("city: \(self.city ?? "N/A")")
        print("state: \(self.state ?? "N/A")")
        print("postal_code: \(self.postal_code ?? "N/A")")
        print("country: \(self.country ?? "N/A")")
        print("longitude: \(self.longitude ?? "N/A")")
        print("latitude: \(self.latitude ?? "N/A" )")
        print("phone: \(self.phone ?? "N/A")")
        print("website_url: \(self.website_url ?? "N/A")")
        print("updated_at: \(self.updated_at ?? "N/A")")
        print("created_at: \(self.created_at ?? "N/A")")
    }
     */
}
