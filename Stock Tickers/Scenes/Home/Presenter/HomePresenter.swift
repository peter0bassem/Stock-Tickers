//
//  HomePresenter.swift
//  Stock Tickers
//
//  Created by Peter Bassem on 29/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

// MARK: Home Presenter -

class HomePresenter: BasePresenter {

    weak var view: HomeViewProtocol?
    private let interactor: HomeInteractorInputProtocol
    private let router: HomeRouterProtocol
    
    private let sectionTitles = ["Stocks", "Latest News", "More News"]
    private var stocks: [StockTicker] = []
    
    init(view: HomeViewProtocol, interactor: HomeInteractorInputProtocol, router: HomeRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - HomePresenterProtocol
extension HomePresenter: HomePresenterProtocol {
    
    func viewDidLoad() {
        interactor.fetchData()
    }
}

// MARK: - API
extension HomePresenter: HomeInteractorOutputProtocol {
    func fetchingStocksSuccessfully(_ stocks: [StockTicker]) {
        self.stocks = stocks
        view?.refreshStocksSection()
    }
}

// MARK: - Selectors
extension HomePresenter {
    
}

extension HomePresenter {
    func configureCollectionHeader(_ header: CollectionHeaderCollectionReusableViewProtocol, forSection section: Int) {
        header.displayTitle(sectionTitles[section])
    }
    
    var stocksCount: Int {
        return stocks.count
    }
    
    func configureStockCell(_ cell: StockCollectionViewCellProtocol, atIndex index: Int) {
        cell.displayStockItemName(stocks[index].stock)
        cell.displayStockItemPrice(String(format: "%.2f %@", stocks[index].price.toDouble() ?? 0.0, "USD"))
        cell.displayStockItemPriceColor((stocks[index].price.toDouble() ?? 0.0) >= 0 ? .systemGreen : .systemRed )
    }
}
