//
//  HomeUseCase.swift
//  Stock Tickers
//
//  Created by Peter Bassem on 29/06/2022.
//

import Foundation

class HomeUseCase {
    private let stockTickersRepository: StockTickersRepository
    private let newsRepository: NewsRepository
    
    init(stockTickersRepository: StockTickersRepository, newsRepository: NewsRepository) {
        self.stockTickersRepository = stockTickersRepository
        self.newsRepository = newsRepository
    }
    
    func getStockTickers(completion: @escaping ([StockTicker]) -> Void) {
        stockTickersRepository.getStockTickers(completion: completion)
    }
    
    func getNews(completion: @escaping (Result<APIResponse, NetworkErrorType>) -> Void) {
        newsRepository.getNews(completion: completion)
    }
    
    func fetchArticles(completion: ([ArticleModel]) -> Void) {
        newsRepository.fetchArticles(completion: completion)
    }
    
    func addArticle(_ article: Article, completion: (ArticleModel?, Error?) -> Void) {
        newsRepository.addArticle(article, completion: completion)
    }
    
    func deleteArtice(_ artice: ArticleModel, completion: (Error?) -> Void) {
        newsRepository.deleteArtice(artice, completion: completion)
    }
}
