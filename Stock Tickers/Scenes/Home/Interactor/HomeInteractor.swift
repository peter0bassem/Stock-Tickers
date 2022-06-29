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
    private var error: String?
    private var articles: [Article]?
    
    init(useCase: HomeUseCase) {
        self.useCase = useCase
    }
    
    private func getStockTickers(completion: @escaping ([StockTicker]) -> Void) {
        useCase.getStockTickers(completion: completion)
    }
    
    private func getNews(successCompletion: @escaping ([Article]) -> Void, failureCompletion: @escaping (String) -> Void) {
        useCase.getNews { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let newsResponse):
                    if newsResponse.status == "ok" {
                        guard let articles = newsResponse.articles else {
                            failureCompletion(NetworkErrorType.unknownError.rawValue.localized())
                            return
                        }
                        successCompletion(articles)
                    }
                case .failure(let error):
                    failureCompletion(error.rawValue.localized())
                }
            }
        }
    }
    
    func fetchData() {
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        getStockTickers { [unowned self] stocks in
            self.stocks = stocks
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        getNews { [unowned self] articles in
            self.articles = articles
            dispatchGroup.leave()
        } failureCompletion: { [unowned self] error in
            self.error = error
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        fetchSavedArticles()
        dispatchGroup.leave()
        
        dispatchGroup.notify(queue: .main) { [unowned self] in
            self.presenter?.endLoading()
            if let error = self.error {
                self.presenter?.fetchingDataFailed(withError: error)
            }
            if let stocks = self.stocks {
                self.presenter?.fetchingStocksSuccessfully(stocks)
            }
            if let articles = self.articles {
                self.presenter?.fetchingArticlesSuccessfully(articles)
            }
        }
    }
    
    func fetchSavedArticles() {
        useCase.fetchArticles { [unowned self] articles in
            let savedArticles = articles.map { Article(title: $0.title, urlToImage: $0.urlToImage, publishedAt: $0.publishedAt) }
            DispatchQueue.main.async { [unowned self] in
                self.presenter?.fetchingSavedArticlesSuccessfully(savedArticles)
            }
        }
    }
    
    func addArticle(_ article: Article) {
        useCase.addArticle(article) { [unowned self] savedArticle, error in
            if let error = error {
                DispatchQueue.main.async { [unowned self] in
                    self.presenter?.fetchingDataFailed(withError: error.localizedDescription)
                    return
                }
            }
            useCase.fetchArticles { [unowned self] articles in
                let savedArticles = articles.map { Article(title: $0.title, urlToImage: $0.urlToImage, publishedAt: $0.publishedAt) }
                DispatchQueue.main.async { [unowned self] in
                    self.presenter?.fetchingSavedArticlesSuccessfully(savedArticles)
                }
            }
        }
    }
    
    func deleteArtice(_ artice: ArticleModel, forSection section: Int, atIndex index: Int) {
        useCase.deleteArtice(artice) { [unowned self] error in
            DispatchQueue.main.async { [unowned self] in
                if let error = error {
                    self.presenter?.fetchingDataFailed(withError: error.localizedDescription)
                    return
                }
                self.presenter?.deleteSavedArticleSuccessfully(forSection: section, atIndex: index)
            }
        }
    }
}
