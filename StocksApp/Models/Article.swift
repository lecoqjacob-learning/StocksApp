//
//  Article.swift
//  StocksApp
//
//  Created by Jacob LeCoq on 3/18/21.
//

import Foundation

struct Article: Decodable {
    var title: String
    var publication: String
    var imageURL: String
}

extension Article {
    static var previewArticle = Article(title: "The Bull Market is Charging into 2020",
                                        publication: "The Wallstreet Journal",
                                        imageURL: "https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5f2c667737950e6bf2338de1%2F0x0.jpg")
}
