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
    
    func refreshLatestNewsSection() {
        _collectionView.reloadSections(IndexSet(integer: 1))
    }
    
    func refreshMoreNewsSection() {
        _collectionView.reloadSections(IndexSet(integer: 2))
    }
}
