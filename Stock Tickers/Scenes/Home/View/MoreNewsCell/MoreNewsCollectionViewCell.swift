//
//  MoreNewsCollectionViewCell.swift
//  Stock Tickers
//
//  Created by Peter Bassem on 29/06/2022.
//

import UIKit

protocol MoreNewsCollectionViewCellProtocol {
    func displayMoreNewsItemImage(_ imageURL: URL?)
    func displayMoreNewsItemTitle(_ title: String)
    func displayMoreNewsItemsPublishDate(_ date: String)
    
}

final class MoreNewsCollectionViewCell: BaseCollectionViewCell {

    // MARK: Outlets
    @IBOutlet private weak var moreNewsItemImageView: UIImageView!
    @IBOutlet private weak var moreNewsItemTitleLabel: UILabel!
    @IBOutlet private weak var moreNewsItemPublishDateLabel: UILabel!
    
    // MARK: Variables
    
    // MARK: Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

// MARK: LatestNewsCollectionViewCellProtocol
extension MoreNewsCollectionViewCell: MoreNewsCollectionViewCellProtocol {
    func displayMoreNewsItemImage(_ imageURL: URL?) {
        moreNewsItemImageView.downloadRemoteImage(fromUrl: imageURL, placeholder: UIImage(systemName: "photo")?.withTintColor(.lightGray, renderingMode: .alwaysTemplate))
    }
    
    func displayMoreNewsItemTitle(_ title: String) {
        moreNewsItemTitleLabel.text = title
    }
    
    func displayMoreNewsItemsPublishDate(_ date: String) {
        moreNewsItemPublishDateLabel.text = date
    }
}
