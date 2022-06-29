//
//  HomeUseCase.swift
//  Stock Tickers
//
//  Created by Peter Bassem on 29/06/2022.
//

import Foundation

class HomeUseCase {
    private let stockTickersRepository: StockTickersRepository
    
    init(stockTickersRepository: StockTickersRepository) {
        self.stockTickersRepository = stockTickersRepository
    }
    
    func getStockTickers(completion: @escaping ([StockTicker]) -> Void) {
        stockTickersRepository.getStockTickers(completion: completion)
    }
}
