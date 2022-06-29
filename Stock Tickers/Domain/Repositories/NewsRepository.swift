//
//  NewsRepository.swift
//  Stock Tickers
//
//  Created by Peter Bassem on 29/06/2022.
//

import Foundation

protocol NewsRepository {
    func getNews(completion: @escaping (Result<APIResponse, NetworkErrorType>) -> Void)
}
