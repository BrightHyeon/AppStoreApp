//
//  RankingFeatureCollectionViewCell.swift
//  AppStoreApp
//
//  Created by HyeonSoo Kim on 2022/02/28.
//

import UIKit
import SnapKit

final class RankingFeatureCollectionViewCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .tertiarySystemGroupedBackground
        
        return imageView
    }()
}
