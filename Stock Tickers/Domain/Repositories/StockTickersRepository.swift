//
//  StockTickersRepository.swift
//  Stock Tickers
//
//  Created by Peter Bassem on 29/06/2022.
//

import Foundation

protocol StockTickersRepository {
    func getStockTickers(completion: @escaping ([StockTicker]) -> Void)
}
