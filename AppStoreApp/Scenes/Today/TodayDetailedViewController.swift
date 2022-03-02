//
//  TodayDetailedViewController.swift
//  AppStoreApp
//
//  Created by HyeonSoo Kim on 2022/03/01.
//

import UIKit
import SnapKit

class TodayDetailedViewController: UIViewController {
    
    //Question. lazy var 와 let 의 차이?
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray //imageView의 배경컬러.
        imageView.contentMode = .scaleAspectFill //View에 들어올 image의 contentMode?
        imageView.clipsToBounds = true //imageView의 Corner대로 image가 잘 잘리도록?
        imageView.layer.cornerRadius = 8.0

        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        label.textColor = .label
        
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .medium)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private let downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("받기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13.0, weight: .bold)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12.0
        
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = .systemBlue
        //button에 액션추가.
        button.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view초기화 코드의 중요성!!! 아래처럼 backgroundColor정도도 지정해주지않으면 아예 뜨질않고, 오류남.
        view.backgroundColor = .systemBackground
        
        setupViews()
    }
}

private extension TodayDetailedViewController {
    func setupViews() {
        [
            imageView,
            titleLabel,
            descriptionLabel,
            downloadButton,
            shareButton
        ].forEach { view.addSubview($0) }
        
        imageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(32)
            $0.height.width.equalTo(100)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView)
            $0.leading.equalTo(imageView.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel)
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.trailing.equalTo(titleLabel)
        }
        
        downloadButton.snp.makeConstraints {
            $0.leading.equalTo(titleLabel)
            $0.bottom.equalTo(imageView)
            $0.width.equalTo(60)
            $0.height.equalTo(24)
        }
        
        shareButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(downloadButton)
            $0.width.height.equalTo(32)
        }
    }
    
    //share sheet - UIActivityViewController
    //init(activityItems: [Any], applicationActivities: [UIActivity])
    @objc func shareButtonTapped() {
        let activityItems: [Any] = [titleLabel.text!]
        let activityViewController = UIActivityViewController(
            activityItems: activityItems, //앱에서 공유할 콘텐츠. ex) 앱 상세화면으로 이동할 URL
            applicationActivities: nil //공유될 목적지. ex) iOS 기본 메시지 앱 - 사용자가 자주 쓰는 앱 순서대로 알아서 나옴. 간단하니 사용 추천.
        )
        present(activityViewController, animated: true, completion: nil)
    }
}
