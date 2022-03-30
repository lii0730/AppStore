//
//  RankingFeatureSectionViewCell.swift
//  AppStore
//
//  Created by LeeHsss on 2022/02/17.
//

import SnapKit
import UIKit

final class RankingFeatureSectionViewCell: UICollectionViewCell {
    
    static var height: CGFloat {
        return 70.0 
    }
    
    private lazy var imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .tertiarySystemBackground
        imageView.layer.borderColor = UIColor.tertiaryLabel.cgColor
        imageView.layer.cornerRadius = 7.0
        imageView.layer.borderWidth = 0.5
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .bold)
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
    
    private lazy var downLoadButton: UIButton = {
        let button = UIButton()
        button.setTitle("받기", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13.0, weight: .bold)
        button.backgroundColor = .secondarySystemBackground
        button.layer.cornerRadius = 12.0
        
        return button
    }()
    
    private lazy var inAppPurchaseInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "앱 내 구입"
        label.font = .systemFont(ofSize: 10.0, weight: .semibold)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    func setup(rankingFeature: RankingFeature) {
        setupLayout()
        titleLabel.text = rankingFeature.title
        descriptionLabel.text = rankingFeature.description
        inAppPurchaseInfoLabel.isHidden = !rankingFeature.isInPurchaseApp
        imageView.backgroundColor = .red
    }
}

private extension RankingFeatureSectionViewCell {
    func setupLayout() {
        [imageView, titleLabel, descriptionLabel, downLoadButton, inAppPurchaseInfoLabel].forEach {
            addSubview($0)
        }
        
        imageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview().inset(4.0)
            $0.bottom.equalToSuperview().inset(4.0)
            $0.width.equalTo(imageView.snp.height)
        }
        
        downLoadButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(24.0)
            $0.width.equalTo(50.0)
        }
        
        inAppPurchaseInfoLabel.snp.makeConstraints {
            $0.top.equalTo(downLoadButton.snp.bottom).offset(4.0)
            $0.centerX.equalTo(downLoadButton.snp.centerX)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing).offset(8.0)
            $0.top.equalTo(imageView.snp.top).offset(8.0)
            $0.trailing.equalTo(downLoadButton.snp.leading)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.trailing.equalTo(titleLabel.snp.trailing)
            $0.top.equalTo(titleLabel.snp.bottom).offset(4.0)
        }
    }
}
