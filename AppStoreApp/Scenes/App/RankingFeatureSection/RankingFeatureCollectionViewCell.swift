//
//  RankingFeatureCollectionViewCell.swift
//  AppStoreApp
//
//  Created by HyeonSoo Kim on 2022/02/28.
//

import UIKit
import SnapKit

final class RankingFeatureCollectionViewCell: UICollectionViewCell {
    static var height: CGFloat = 70.0
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .tertiarySystemGroupedBackground
        imageView.layer.borderColor = UIColor.tertiaryLabel.cgColor
        imageView.layer.borderWidth = 0.5
        imageView.layer.cornerRadius = 7
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .label
        label.numberOfLines = 2
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.0, weight: .semibold)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private lazy var downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("받기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13.0, weight: .bold)
        button.backgroundColor = .secondarySystemBackground
        button.layer.cornerRadius = 12.0
        
        return button
    }()
    
    private var inAppPurchaseInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "앱 내 구입"
        label.font = .systemFont(ofSize: 10.0, weight: .semibold)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    func setup() {
        setupLayout()
        
        titleLabel.text = "App title"
        descriptionLabel.text = "description: 이러이러한 앱입니다."
        //isHidden 활용.
        inAppPurchaseInfoLabel.isHidden = [true, false].randomElement() ?? true
    }
}

private extension RankingFeatureCollectionViewCell {
    func setupLayout() {
        [
            imageView,
            titleLabel,
            descriptionLabel,
            downloadButton,
            inAppPurchaseInfoLabel
        ].forEach { addSubview($0) }
        
        imageView.snp.makeConstraints {
            $0.leading.equalToSuperview() //이미 sizeForItemAt메서드에서 줄여놨으니 여기선 inset안해도 됨.
            $0.top.bottom.equalToSuperview().inset(4.0)
            //높이와 너비 같게; 너비 명시안해주면 image가 안뜬다.*****
            $0.width.equalTo(imageView.snp.height)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing).offset(8.0)
            //trailing도 잡아주기.
            $0.trailing.equalTo(downloadButton.snp.leading)
            $0.top.equalTo(imageView).inset(8.0)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel)
            $0.trailing.equalTo(titleLabel)
            $0.top.equalTo(titleLabel.snp.bottom).offset(4.0)
        }
        
        downloadButton.snp.makeConstraints {
            //center잡기
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
            //자연스럽게 버튼크기 지정되며 cornerRadius, backgroundColor등 적용됨.
            $0.height.equalTo(24.0)
            $0.width.equalTo(50.0)
        }
        
        inAppPurchaseInfoLabel.snp.makeConstraints {
            //center잡기
            $0.centerX.equalTo(downloadButton)
            $0.top.equalTo(downloadButton.snp.bottom).offset(4.0)
        }
    }
}
