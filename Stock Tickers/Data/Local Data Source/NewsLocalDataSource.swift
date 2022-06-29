//
//  NewsLocalDataSource.swift
//  Stock Tickers
//
//  Created by Peter Bassem on 29/06/2022.
//

import Foundation

class NewsLocalDataSource {
    
    private let localStorageManager: LocalStorageManager
    
    init(localStorageManager: LocalStorageManager) {
        self.localStorageManager = localStorageManager
    }
    
    func fetchArticles(completion: ([ArticleModel]) -> Void) {
        localStorageManager.fetchArticles(completion: completion)
    }
    
    func addArticle(_ article: Article, completion: (ArticleModel?, Error?) -> Void) {
        localStorageManager.addArticle(article, completion: completion)
    }
    
    func deleteArtice(_ artice: ArticleModel, completion: (Error?) -> Void) {
        localStorageManager.deleteArtice(artice, completion: completion)
    }
}
