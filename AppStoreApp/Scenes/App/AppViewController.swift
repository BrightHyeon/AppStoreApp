//
//  AppViewController.swift
//  AppStoreApp
//
//  Created by HyeonSoo Kim on 2022/02/28.
//

import UIKit

final class AppViewController: UIViewController {
    //1. collectionView를 section별로 정의하는 방법. //netflixStyleApp 참고.
    //2. THIS PROJECT: ScrollView와 StackView를 활용.
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
        let featureSectionView = UIView()
        let rankingFeatureSectionView = UIView()
        let exchangeCodeButtonView = UIView()
        
        featureSectionView.backgroundColor = .red
        rankingFeatureSectionView.backgroundColor = .yellow
        exchangeCodeButtonView.backgroundColor = .blue
        
        [
            featureSectionView,
            rankingFeatureSectionView,
            exchangeCodeButtonView
        ].forEach {
            $0.snp.makeConstraints { $0.height.equalTo(500.0) }
            stackView.addArrangedSubview($0)
        }
        
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationController()
        setupLayout()
    }
}

//현 강사의 스타일대로 해보기.
//view 관련 Method들은 따로 extension
private extension AppViewController {
    func setupNavigationController() {
        navigationItem.title = "앱"
        //.always: large로 설정됨. .never: normal title로 설정됨.
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true //large로 설정.
    }
    
    //Layout Setting
    func setupLayout() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            //safeArea조심.
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top) //???
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview() //세로스크롤만 되도록.
            //height은 subview들에 의해 결정되는 것이므로 따로 지정해주면 안됨.
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
