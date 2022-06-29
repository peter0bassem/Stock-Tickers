//
//  HomeViewController.swift
//  Stock Tickers
//
//  Created by Peter Bassem on 29/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

final class HomeViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Variables
	var presenter: HomePresenterProtocol!
    
    var _collectionView: UICollectionView {
        return collectionView
    }

    // MARK: - Lifecycle
	override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        presenter.viewDidLoad()
        title = "Stock Tickers"
        configureCollectionView()
    }
}

// MARK: - Helpers
extension HomeViewController {
    private func configureCollectionView() {
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = createCollectionViewCompositionalLayout()
        collectionView.registerHeader(header: CollectionHeaderCollectionReusableView.self, type: .header)
        collectionView.registerCell(cell: StockCollectionViewCell.self)
    }
    
    private func createCollectionViewCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout.init { [unowned self] section, _ -> NSCollectionLayoutSection? in
            switch section {
            case 0: return self.configureStocksSection()
            default: return nil
            }
        }
    }
    
    private func configureStocksSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1)))
        item.contentInsets.trailing = 16
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(40)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets.leading = 16
        section.boundarySupplementaryItems = [
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
        ]
        return section
    }
}

// MARK: - Selectors
extension HomeViewController {
    
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueHeader(for: kind, at: indexPath) as CollectionHeaderCollectionReusableView
        presenter.configureCollectionHeader(header, forSection: indexPath.section)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return presenter.stocksCount
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueCell(at: indexPath) as StockCollectionViewCell
            presenter.configureStockCell(cell, atIndex: indexPath.item)
            return cell
        default: return UICollectionViewCell()
        }
    }
    
    
}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    
}

class Cell: UICollectionViewCell {
    
}
