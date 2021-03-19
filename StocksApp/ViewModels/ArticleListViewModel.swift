//
//  ArticleListViewModel.swift
//  StocksApp
//
//  Created by Jacob LeCoq on 3/18/21.
//

import Foundation
import Combine
import SwiftUI


class ArticleListViewModel: ObservableObject {
    // MARK: - Subscribers

    private var cancellable: AnyCancellable?
    
    // MARK: - Publishers
    
    @Published var articles: [ArticleViewModel] = [ArticleViewModel]()
    @Published var dragOffset: CGSize = CGSize(width: 0, height: 650)
    
    func load() {
        fetchArticles()
    }
    
    private func fetchArticles() {
        cancellable = WebAPI.topNews()
            .print()
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                      self.articles = $0.map(ArticleViewModel.init)
                  })
    }
}

struct ArticleViewModel {
    let article: Article
    
    var title: String {
        return article.title
    }
    
    var publication: String {
        return article.publication.uppercased()
    }
    
    var imageURL: String {
        return article.imageURL
    }
}
