//
//  LatestNewsCollectionViewCell.swift
//  Stock Tickers
//
//  Created by Peter Bassem on 29/06/2022.
//

import UIKit

protocol LatestNewsCollectionViewCellProtocol {
    func displayLatestNewsItemTitle(_ title: String)
    func displayLatestNewsItemImage(_ imageURL: URL?)
}

final class LatestNewsCollectionViewCell: BaseCollectionViewCell {

    // MARK: Outlets
    @IBOutlet private weak var latestNewsItemTitleLabel: UILabel!
    @IBOutlet private weak var latestNewsItemImageView: UIImageView!
    
    // MARK: Variables
    
    // MARK: Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

// MARK: LatestNewsCollectionViewCellProtocol
extension LatestNewsCollectionViewCell: LatestNewsCollectionViewCellProtocol {
    func displayLatestNewsItemTitle(_ title: String) {
        latestNewsItemTitleLabel.text = title
    }
    
    func displayLatestNewsItemImage(_ imageURL: URL?) {
        latestNewsItemImageView.downloadRemoteImage(fromUrl: imageURL, placeholder: UIImage(systemName: "photo"))
    }
}
