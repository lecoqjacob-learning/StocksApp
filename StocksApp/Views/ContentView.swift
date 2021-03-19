//
//  ContentView.swift
//  StocksAppSwiftUI
//
//  Created by Mohammad Azam on 1/6/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var stockListVM = StockListViewModel()
    @ObservedObject private var articleListVM = ArticleListViewModel()
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor.black
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UITableView.appearance().backgroundColor = UIColor.black
        UITableViewCell.appearance().backgroundColor = UIColor.black
        
        stockListVM.load()
        articleListVM.load()
    }
    
    var body: some View {
        let filteredStocks = self.stockListVM.searchTerm.isEmpty ? self.stockListVM.stocks : self.stockListVM.stocks.filter { $0.symbol.starts(with: self.stockListVM.searchTerm) }
        
        return NavigationView {
            ZStack(alignment: .leading) {
                Color.black
                
                Text("January 5 2020")
                    .font(.custom("Arial", size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .offset(y: -400)
                
                SearchView(searchTerm: self.$stockListVM.searchTerm)
                    .offset(y: -250)
                
                StockListView(stocks: filteredStocks)
                    .offset(y: 200)
                
                NewsArticleView(newsArticles: self.articleListVM.articles, onDragBegin: { value in
                    self.articleListVM.dragOffset = value.translation
                }, onDragEnd: { value in
                    
                    if value.translation.height < 0 {
                        self.articleListVM.dragOffset = CGSize(width: 0, height: 100)
                    } else {
                        self.articleListVM.dragOffset = CGSize(width: 0, height: 650)
                    }
                    
                })
                    .animation(.spring())
                    .offset(y: self.articleListVM.dragOffset.height)
            }
            .navigationBarTitle("Stocks")
        }.edgesIgnoringSafeArea(Edge.Set(.bottom))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
