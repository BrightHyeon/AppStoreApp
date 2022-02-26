//
//  TodayCollectionViewCell.swift
//  AppStoreApp
//
//  Created by HyeonSoo Kim on 2022/02/26.
//

import UIKit
import SnapKit

class TodayCollectionViewCell: UICollectionViewCell {
    let imageView = UIImageView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //contentView Settings
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 5
        contentView.clipsToBounds = true
        
        //imageView Setting
        imageView.contentMode = .scaleToFill
        
        //addSubview
        contentView.addSubview(imageView)
        
        //Make Constraints
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
