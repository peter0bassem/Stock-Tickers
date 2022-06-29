//
//  CollectionHeaderCollectionReusableView.swift
//  Stock Tickers
//
//  Created by Peter Bassem on 29/06/2022.
//

import UIKit

protocol CollectionHeaderCollectionReusableViewProtocol {
    func displayTitle(_ title: String)
}

final class CollectionHeaderCollectionReusableView: UICollectionReusableView {
    
    // MARK: Outlets
    @IBOutlet private weak var titleLabel: UILabel!
    
    // MARK: Variables

    // MARK: Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

// MARK: CollectionHeaderCollectionReusableViewProtocol
extension CollectionHeaderCollectionReusableView: CollectionHeaderCollectionReusableViewProtocol {
    func displayTitle(_ title: String) {
        titleLabel.text = title
    }
}
