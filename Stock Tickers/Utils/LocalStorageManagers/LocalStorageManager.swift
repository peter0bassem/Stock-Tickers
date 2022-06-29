//
//  LocalStorageManager.swift
//  Stock Tickers
//
//  Created by Peter Bassem on 29/06/2022.
//

import Foundation

protocol LocalStorageManager {
    func fetchArticles(completion: ([ArticleModel]) -> Void)
    func addArticle(_ article: Article, completion: (ArticleModel?, Error?) -> Void)
    func deleteArtice(_ artice: ArticleModel, completion: (Error?) -> Void)
}
