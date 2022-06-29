//
//  StockCollectionViewCell.swift
//  Stock Tickers
//
//  Created by Peter Bassem on 29/06/2022.
//

import UIKit

protocol StockCollectionViewCellProtocol {
    func displayStockItemName(_ name: String)
    func displayStockItemPrice(_ price: String)
    func displayStockItemPriceColor(_ color: UIColor)
}

final class StockCollectionViewCell: BaseCollectionViewCell {

    // MARK: Outlets
    @IBOutlet private weak var stockNameLabel: UILabel!
    @IBOutlet private weak var stockPriceLabel: UILabel!
    
    // MARK: Variables
    
    // MARK: Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

// MARK: StockCollectionViewCellProtocol
extension StockCollectionViewCell: StockCollectionViewCellProtocol {
    func displayStockItemName(_ name: String) {
        stockNameLabel.text = name
    }
    
    func displayStockItemPrice(_ price: String) {
        stockPriceLabel.text = price
    }
    
    func displayStockItemPriceColor(_ color: UIColor) {
        stockPriceLabel.textColor = color
    }
}
