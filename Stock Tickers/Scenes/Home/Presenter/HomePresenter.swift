//
//  HomePresenter.swift
//  Stock Tickers
//
//  Created by Peter Bassem on 29/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import CoreData

// MARK: Home Presenter -

class HomePresenter: BasePresenter {

    weak var view: HomeViewProtocol?
    private let interactor: HomeInteractorInputProtocol
    private let router: HomeRouterProtocol
    
    private let sectionTitles = ["Stocks", "Latest News", "More News", "History"]
    private var stocks: [StockTicker] = []
    private var latestNews: [Article] = []
    private var moreNews: [Article] = []
    private var savedNews: [Article] = []
    
    init(view: HomeViewProtocol, interactor: HomeInteractorInputProtocol, router: HomeRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    private func saveArticleLocally(forSection section: Int, atIndex index: Int) {
        let newsItem = section == 1 ? latestNews[index] : moreNews[index]
        self.interactor.addArticle(newsItem)
    }
}

// MARK: - HomePresenterProtocol
extension HomePresenter: HomePresenterProtocol {
    
    func viewDidLoad() {
        view?.showLoading()
        interactor.fetchData()
    }
}

// MARK: - API
extension HomePresenter: HomeInteractorOutputProtocol {
    func endLoading() {
        view?.hideLoading()
    }
    
    func fetchingStocksSuccessfully(_ stocks: [StockTicker]) {
        self.stocks = stocks
        view?.refreshStocksSection()
    }
    
    func fetchingArticlesSuccessfully(_ artices: [Article]) {
        self.latestNews = Array(artices.prefix(6))
        view?.refreshLatestNewsSection()
        
        self.moreNews = Array(artices.dropFirst(6))
        view?.refreshMoreNewsSection()
    }
    
    func fetchingSavedArticlesSuccessfully(_ articles: [Article]) {
        self.savedNews = articles
        view?.refreshHistoryNewsSection()
    }
    
    func deleteSavedArticleSuccessfully(forSection section: Int, atIndex index: Int) {
        view?.deleteSavedArticle(atIndex: index)
        saveArticleLocally(forSection: section, atIndex: index)
    }
    
    func fetchingDataFailed(withError error: String) {
        print(error)
    }
}

// MARK: - Selectors
extension HomePresenter {
    
}

extension HomePresenter {
    var sectionsCount: Int {
        return sectionTitles.count
    }
    
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
    
    var latestNewsItemsCount: Int {
        return latestNews.count
    }
    
    func configureLatestNewsCell(_ cell: LatestNewsCollectionViewCellProtocol, atIndex index: Int) {
        cell.displayLatestNewsItemTitle(latestNews[index].title ?? "")
        cell.displayLatestNewsItemImage(URL(string: latestNews[index].urlToImage ?? ""))
    }
    
    var moreNewsItemsCount: Int {
        return moreNews.count
    }
    
    func configureMoreNewsCell(_ cell: MoreNewsCollectionViewCellProtocol, atIndex index: Int) {
        cell.displayMoreNewsItemImage(URL(string: moreNews[index].urlToImage ?? ""))
        cell.displayMoreNewsItemTitle(moreNews[index].title ?? "")
        cell.displayMoreNewsItemsPublishDate(moreNews[index].publishedAt?.formatDate(inputFormat: "yyyy-MM-dd'T'HH:mm:ss'Z'", outputFormat: "d/M/yy h:mm a") ?? "")
    }
    
    func didSelectNewsItem(inSection section: Int, atIndex index: Int) {
        if savedNews.count >= 10 {
            let toBeDeletedArticeModel = savedNews.filter { $0.title == savedNews[0].title && $0.urlToImage == savedNews[0].urlToImage && $0.publishedAt == savedNews[0].publishedAt }.first
            
            let articleModelObject = ArticleModel(context: CoreDataManager.shared.persistentContainer.viewContext)
            articleModelObject.title = toBeDeletedArticeModel?.title
            articleModelObject.urlToImage = toBeDeletedArticeModel?.urlToImage
            articleModelObject.publishedAt = toBeDeletedArticeModel?.publishedAt
            
        
            savedNews.remove(at: 0)
            interactor.deleteArtice(articleModelObject, forSection: section, atIndex: index)
        } else {
            saveArticleLocally(forSection: section, atIndex: index)
        }
    }
    
    var savedItemsCount: Int {
        return savedNews.count
    }
    
    func configureSavedNewsCell(_ cell: MoreNewsCollectionViewCellProtocol, atIndex index: Int) {
        cell.displayMoreNewsItemImage(URL(string: savedNews[index].urlToImage ?? ""))
        cell.displayMoreNewsItemTitle(savedNews[index].title ?? "")
        cell.displayMoreNewsItemsPublishDate(savedNews[index].publishedAt?.formatDate(inputFormat: "yyyy-MM-dd'T'HH:mm:ss'Z'", outputFormat: "d/M/yy h:mm a") ?? "")
    }
}
