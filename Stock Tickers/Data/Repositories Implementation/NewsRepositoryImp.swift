//
//  NewsRepositoryImp.swift
//  Stock Tickers
//
//  Created by Peter Bassem on 29/06/2022.
//

import Foundation

class NewsRepositoryImp: NewsRepository {
    private let newsRemoteDataSource = NewsRemoteDataSource()
    private let newsLocalDataSource: NewsLocalDataSource
    
    init(newsLocalDataSource: NewsLocalDataSource) {
        self.newsLocalDataSource = newsLocalDataSource
    }
    
    func getNews(completion: @escaping (Result<APIResponse, NetworkErrorType>) -> Void) {
        newsRemoteDataSource.getNews(from: .getNews, completion: completion)
    }
    
    func fetchArticles(completion: ([ArticleModel]) -> Void) {
        newsLocalDataSource.fetchArticles(completion: completion)
    }
    
    func addArticle(_ article: Article, completion: (ArticleModel?, Error?) -> Void) {
        newsLocalDataSource.addArticle(article, completion: completion)
    }
    
    func deleteArtice(_ artice: ArticleModel, completion: (Error?) -> Void) {
        newsLocalDataSource.deleteArtice(artice, completion: completion)
    }
}
