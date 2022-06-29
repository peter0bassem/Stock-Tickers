//
//  MoreNewsCollectionViewCell.swift
//  Stock Tickers
//
//  Created by Peter Bassem on 29/06/2022.
//

import UIKit

protocol MoreNewsCollectionViewCellProtocol {
    func displayLatestNewsItemImage(_ imageURL: URL?)
    func displayLatestNewsItemTitle(_ title: String)
}

final class MoreNewsCollectionViewCell: BaseCollectionViewCell {

    // MARK: Outlets
    @IBOutlet private weak var latestNewsItemImageView: UIImageView!
    @IBOutlet private weak var latestNewsItemTitleLabel: UILabel!
    
    // MARK: Variables
    
    // MARK: Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

// MARK: LatestNewsCollectionViewCellProtocol
extension MoreNewsCollectionViewCell: MoreNewsCollectionViewCellProtocol {
    func displayLatestNewsItemImage(_ imageURL: URL?) {
        latestNewsItemImageView.downloadRemoteImage(fromUrl: imageURL, placeholder: UIImage(systemName: "photo")?.withTintColor(.lightGray, renderingMode: .alwaysTemplate))
    }
    
    func displayLatestNewsItemTitle(_ title: String) {
        latestNewsItemTitleLabel.text = title
    }
}
