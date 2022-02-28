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
    let title = UILabel()
    let subTitle = UILabel()
    let descrip = UILabel()
    
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
        
        //addSubview to imageView
        [subTitle, title, descrip].forEach {
            imageView.addSubview($0)
            $0.textColor = UIColor.white
        }
        
        //Make Constraints
        subTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.leading.equalToSuperview().offset(24)
        }
        
        title.snp.makeConstraints {
            $0.top.equalTo(subTitle.snp.bottom).offset(4)
            $0.leading.equalTo(subTitle)
        }
        
        descrip.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(24)
            $0.leading.equalTo(subTitle)
        }
        
        //Label Configuration
        subTitle.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        title.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        descrip.font = .systemFont(ofSize: 14, weight: .bold)
    }
}
