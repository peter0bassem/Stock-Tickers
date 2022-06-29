//
//  CoreDataManager.swift
//  Stock Tickers
//
//  Created by Peter Bassem on 29/06/2022.
//

import Foundation
import CoreData

class CoreDataManager: NSObject, LocalStorageManager {
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Stock_Tickers")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Loading of store failed: \(error.localizedDescription)")
            }
        }
        return container
    }()
    
    func fetchArticles(completion: ([ArticleModel]) -> Void) {
        let context = persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<ArticleModel>(entityName: "ArticleModel")
        
        do {
            let articles = try context.fetch(fetchRequest)
            
            completion(articles)
            
        } catch(let error) {
            print("Failed to fetch request companies: \(error.localizedDescription)")
            completion([])
        }
    }
    
    func addArticle(_ article: Article, completion: (ArticleModel?, Error?) -> Void) {
        let context = persistentContainer.viewContext
        
        let articleItem = NSEntityDescription.insertNewObject(forEntityName: "ArticleModel", into: context) as! ArticleModel
        
        articleItem.title = article.title
        articleItem.urlToImage = article.urlToImage
        articleItem.publishedAt = article.publishedAt
        do {
            try context.save()
            completion(articleItem ,nil)
        } catch(let error) {
            print("Failed to create employee: \(error.localizedDescription)")
            completion(nil, error)
        }
    }
    
    
    
    func deleteArtice(_ artice: ArticleModel, completion: (Error?) -> Void) {
        let context = persistentContainer.viewContext
        context.delete(artice)
        do {
            try context.save()
            completion(nil)
            print("Artice deleted!!")
        } catch(let error) {
            print("Failed to create employee: \(error.localizedDescription)")
            completion(error)
        }
    }
}
