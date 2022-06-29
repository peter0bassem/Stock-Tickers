//
//  HomeInteractor.swift
//  Stock Tickers
//
//  Created by Peter Bassem on 29/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

// MARK: Home Interactor -

class HomeInteractor: HomeInteractorInputProtocol {
    
    weak var presenter: HomeInteractorOutputProtocol?
    private let useCase: HomeUseCase
    
    private var stocks: [StockTicker]?
    
    init(useCase: HomeUseCase) {
        self.useCase = useCase
    }
    
    private func getStockTickers(completion: @escaping ([StockTicker]) -> Void) {
        useCase.getStockTickers(completion: completion)
    }
    
    func fetchData() {
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        getStockTickers { [unowned self] stocks in
            self.stocks = stocks
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) { [unowned self] in
            if let stocks = self.stocks {
                self.presenter?.fetchingStocksSuccessfully(stocks)
            }
        }
    }
}
