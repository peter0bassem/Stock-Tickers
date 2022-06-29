//
//  NewsRepositoryImp.swift
//  Stock Tickers
//
//  Created by Peter Bassem on 29/06/2022.
//

import Foundation

class NewsRepositoryImp: NewsRepository {
    private let newsRemoteDataSource = NewsRemoteDataSource()
    
    func getNews(completion: @escaping (Result<APIResponse, NetworkErrorType>) -> Void) {
        newsRemoteDataSource.getNews(from: .getNews, completion: completion)
    }
}
