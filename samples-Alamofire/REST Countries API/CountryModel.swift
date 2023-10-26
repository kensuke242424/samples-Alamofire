//
//  CountryModel.swift
//  samples-Alamofire
//
//  Created by Kensuke Nakagawa on 2023/10/25.
//

import Foundation

struct Country: Codable {
    let name: Name
    let capital: [String]?
    let area: Double?
    let currencies: [String: Currency]?
    let population: Int?
    let region: String?
    let flags: Flags
    let timezones: [String]?
    let capitalInfo: CapitalInfo?

    func currenciesName(of country: Country) -> [String] {
        let names = country.currencies?.compactMap { $0.value.name }
        return names ?? [""]

    }
    func currenciesSymbol(of country: Country) -> [String] {
        let symbols = country.currencies?.compactMap { $0.value.symbol }
        return symbols ?? [""]

    }

}

struct Name: Codable {
    let common: String
    let official: String
}

struct Currency: Codable {
    let name: String
    let symbol: String?
}

struct Flags: Codable {
    let png: String
}

struct CapitalInfo: Codable {
    let latlng: [Double]?
}
