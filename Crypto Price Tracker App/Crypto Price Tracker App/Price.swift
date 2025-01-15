//
//  Price.swift
//  Crypto Price Tracker App
//
//  Created by Vaishnavi Wahgule on 15/01/25.
//

import Foundation

struct Price: Codable {
    let rates: Currency
}

struct Currency: Codable {
    let btc: Rate
    let eth: Rate
    let usd: Rate
    let aud: Rate
}

struct Rate: Codable {
    let name, unit: String
    let value: Double
    let type: String
}
