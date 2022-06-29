//
//  UIImageViewExtensions.swift
//  Driver
//
//  Created by Peter Bassem on 27/12/2020.
//  Copyright © 2020 Eslam Maged. All rights reserved.
//

import UIKit
import Kingfisher

// MARK: Kingfisher download and cache image
extension UIImageView {
    func downloadRemoteImage(fromUrl url: URL?, placeholder: UIImage?) {
        kf.indicatorType = .activity
        kf.setImage(with: url, placeholder: placeholder, options: [
            .transition(.fade(1)),
            .cacheOriginalImage
        ]) { result in
            switch result {
            case .success(let value):
                _ = value
//                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
    }
}
