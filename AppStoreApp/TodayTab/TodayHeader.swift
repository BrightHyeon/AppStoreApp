//
//  TodayHeader.swift
//  AppStoreApp
//
//  Created by HyeonSoo Kim on 2022/02/26.
//

import UIKit

class TodayHeader: UICollectionReusableView {
    
    let headerStackView = UIStackView()
    
    let dateLabel = UILabel()
    let titleLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //Add StackView in View
        addSubview(headerStackView)
        
        //StackView's Attributes
        headerStackView.axis = .vertical
        headerStackView.alignment = .leading
        headerStackView.distribution = .fillProportionally
        headerStackView.spacing = 5
        
        //Make StackView's Constraints
        headerStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        //StackView's Components
        [dateLabel, titleLabel].forEach {
            headerStackView.addArrangedSubview($0)
        }
        
        //Label Configuration
        dateLabel.font = .systemFont(ofSize: 12)
        dateLabel.textColor = UIColor.secondaryLabel
        dateLabel.sizeToFit()
        
        titleLabel.font = .systemFont(ofSize: 30, weight: .bold)
        titleLabel.textColor = UIColor.black
        titleLabel.sizeToFit()
    }
}
