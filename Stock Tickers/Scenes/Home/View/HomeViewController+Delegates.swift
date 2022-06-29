//
//  HomeViewController+Delegates.swift
//  Stock Tickers
//
//  Created by Peter Bassem on 29/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

extension HomeViewController: HomeViewProtocol {
    func refreshStocksSection() {
        _collectionView.reloadSections(IndexSet(integer: 0))
    }
}
