//
//  FeatureSectionView.swift
//  AppStoreApp
//
//  Created by HyeonSoo Kim on 2022/02/28.
//

import UIKit
import SnapKit

final class FeatureSectionView: UIView {
    
    private let separatorView = SeparatorView(frame: .zero) //init 호출.
    
    //custom collectionView Settings
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true //default: false; 딱딱넘어가도록함.
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false //scrollbar감추기.
        
        collectionView.register(FeatureSectionCollectionViewCell.self, forCellWithReuseIdentifier: "FeatureSectionColletionViewCell")
        
        return collectionView
    }()
    
    //CollectionViewController에서는 didload메서드에서 setup해주면 되지만, 이런 View class에선 init활용해보기.
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - UICollectionViewDataSource
extension FeatureSectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeatureSectionColletionViewCell", for: indexPath) as? FeatureSectionCollectionViewCell else { return UICollectionViewCell() }
        
        cell.setup()
        
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension FeatureSectionView: UICollectionViewDelegateFlowLayout {
    //Item의 CGSize
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 32.0, height: frame.width)
    }
    
    //Section Insets //중앙정렬을 위해선 inset 조정이 필수.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    //Section간 최소 margins.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
}

//setup
private extension FeatureSectionView {
    func setupViews() {
        [
            collectionView,
            separatorView
        ].forEach { addSubview($0) }
        
        collectionView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalToSuperview().inset(16)
            $0.height.equalTo(snp.width)
        }
        
        separatorView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(collectionView.snp.bottom).offset(16)
        }
    }
}
