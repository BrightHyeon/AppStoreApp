//
//  TodayHeader.swift
//  AppStoreApp
//
//  Created by HyeonSoo Kim on 2022/02/26.
//

import UIKit
import SnapKit

class TodayHeader: UICollectionReusableView {
    
    let headerStackView = UIStackView()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor.secondaryLabel
        label.sizeToFit()
        return label
    }()
    //위처럼 바로 정의해도되고, 아래에서 따로 정의해도된다.
    let titleLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //Add StackView in View
        addSubview(headerStackView)
        
        //StackView's Attributes
        headerStackView.axis = .vertical
        headerStackView.alignment = .leading
//        headerStackView.distribution = .fillProportionally
        headerStackView.spacing = 5
        
        //Make StackView's Constraints
        headerStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
        }
        
        //StackView's Components
        [dateLabel, titleLabel].forEach {
            headerStackView.addArrangedSubview($0)
        }
        
        //Label Configuration
        titleLabel.font = .systemFont(ofSize: 36, weight: .black)
        titleLabel.textColor = UIColor.black
        titleLabel.sizeToFit()
        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(headerStackView.snp.top).offset(32)
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(8)
        }
    }
}
