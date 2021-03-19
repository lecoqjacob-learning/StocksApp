//
//  WebService.swift
//  StocksApp
//
//  Created by Jacob LeCoq on 3/17/21.
//

import Foundation
import Combine

enum WebAPI {
    static let agent = Agent()
    static let base = URL(string: "https://island-bramble.glitch.me")!
}

extension WebAPI {
    
    static func stocks() -> AnyPublisher<[Stock], Error> {
        // 1
        let request = URLRequest(url: base.appendingPathComponent("stocks"))
        
        // 2
        return agent.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    static func topNews() -> AnyPublisher<[Article], Error> {
        // 1
        let request = URLRequest(url: base.appendingPathComponent("top-news"))
        
        // 2
        return agent.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
