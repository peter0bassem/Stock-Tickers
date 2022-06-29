//
//  NewsRemoteDataSource.swift
//  Stock Tickers
//
//  Created by Peter Bassem on 29/06/2022.
//

import Foundation

class NewsRemoteDataSource {
    func getNews(from apiRouter: APIRouter, completion: @escaping (Result<APIResponse, NetworkErrorType>) -> Void) {
        APIClient.performRequest(route: apiRouter).execute { response in
            completion(.success(response))
        } onFailure: { error in
            completion(.failure(error))
        }
    }
}
