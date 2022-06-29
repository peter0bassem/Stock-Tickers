//
//  HomeRouter.swift
//  Stock Tickers
//
//  Created by Peter Bassem on 29/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

// MARK: Home Router -

class HomeRouter: BaseRouter, HomeRouterProtocol {
    
    static func createModule() -> UIViewController {
        let view =  HomeViewController()

        let interactor = HomeInteractor(
            useCase: HomeUseCase(
                stockTickersRepository: StockTickersRepositoryImp(),
                newsRepository: NewsRepositoryImp(
                    newsLocalDataSource: NewsLocalDataSource(
                        localStorageManager: CoreDataManager.shared
                    )
                )
            )
        )
        let router = HomeRouter()
        let presenter = HomePresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }

}
