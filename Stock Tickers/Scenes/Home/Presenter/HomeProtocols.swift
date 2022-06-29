//
//  HomeProtocols.swift
//  Stock Tickers
//
//  Created by Peter Bassem on 29/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

// MARK: Home Protocols

protocol HomeViewProtocol: BaseViewProtocol {
    var presenter: HomePresenterProtocol! { get set }
    func refreshStocksSection()
    func refreshLatestNewsSection()
    func refreshMoreNewsSection()
}

protocol HomePresenterProtocol: BasePresenterProtocol {
    var view: HomeViewProtocol? { get set }
    
    func viewDidLoad()

    func configureCollectionHeader(_ header: CollectionHeaderCollectionReusableViewProtocol, forSection section: Int)
    var stocksCount: Int { get }
    func configureStockCell(_ cell: StockCollectionViewCellProtocol, atIndex index: Int)
    var latestNewsItemsCount: Int { get }
    func configureLatestNewsCell(_ cell: LatestNewsCollectionViewCellProtocol, atIndex index: Int)
    var moreNewsItemsCount: Int { get }
    func configureMoreNewsCell(_ cell: MoreNewsCollectionViewCellProtocol, atIndex index: Int)
}

protocol HomeRouterProtocol: BaseRouterProtocol {
    
}

protocol HomeInteractorInputProtocol: BaseInteractorInputProtocol {
    var presenter: HomeInteractorOutputProtocol? { get set }
    func fetchData()
}

protocol HomeInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func endLoading()
    func fetchingStocksSuccessfully(_ stocks: [StockTicker])
    func fetchingArticlesSuccessfully(_ artices: [Article])
    func fetchingDataFailed(withError error: String)
}
