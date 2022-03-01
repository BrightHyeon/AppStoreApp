//
//  ExchangeCodeButtonView.swift
//  AppStoreApp
//
//  Created by HyeonSoo Kim on 2022/03/01.
//

import UIKit
import SnapKit

class ExchangeCodeButtonView: UIView {
    
    private lazy var exchangeCodeButton: UIButton = {
        let button = UIButton()
        button.setTitle("코드 교환", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15.0, weight: .bold)
        button.backgroundColor = .tertiarySystemGroupedBackground
        //tertiary랑 secondary랑 색 비슷. terti가 좀더연한가?
        button.layer.cornerRadius = 7.0
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ExchangeCodeButtonView {
    func setupView() {
        addSubview(exchangeCodeButton)
        
        exchangeCodeButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.bottom.equalToSuperview().inset(32)
            $0.height.equalTo(40)
        }
    }
}
