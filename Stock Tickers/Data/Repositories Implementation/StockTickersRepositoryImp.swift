//
//  StockTickersRepositoryImp.swift
//  Stock Tickers
//
//  Created by Peter Bassem on 29/06/2022.
//

import Foundation

class StockTickersRepositoryImp: StockTickersRepository {
    
    private let stockTickersRemoteDataSource = StockTickersRemoteDataSource()
    
    func getStockTickers(completion: @escaping ([StockTicker]) -> Void) {
        stockTickersRemoteDataSource.getStockTickers(fromContentsOfURL: KNetworkConstants.EndPoint.stocks.rawValue, completion: completion)
    }
}
