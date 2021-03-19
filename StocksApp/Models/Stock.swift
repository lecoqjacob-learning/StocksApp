//
//  Stock.swift
//  StocksApp
//
//  Created by Jacob LeCoq on 3/17/21.
//

import Foundation

struct Stock: Decodable {
    var symbol: String
    var description: String
    var price: Double
    var change: String
}
