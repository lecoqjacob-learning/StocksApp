//
//  StockListViewModel.swift
//  StocksApp
//
//  Created by Jacob LeCoq on 3/17/21.
//

import Combine
import Foundation

class StockListViewModel: ObservableObject {
    // MARK: - Subscribers

    private var cancellable: AnyCancellable?

    // MARK: - Publishers

    @Published var searchTerm: String = ""
    @Published var stocks = [StockViewModel]()

    func load() {
        fetchStocks()
    }

    private func fetchStocks() {
        cancellable = WebAPI.stocks()
            .print()
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                      self.stocks = $0.map(StockViewModel.init)
                  })
    }
}
