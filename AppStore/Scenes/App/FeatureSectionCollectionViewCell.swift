//
//  FeatureSectionCollectionViewCell.swift
//  AppStore
//
//  Created by LeeHsss on 2022/02/17.
//

import SnapKit
import UIKit
import Kingfisher

final class FeatureSectionCollectionViewCell : UICollectionViewCell {
    private lazy var typeLabel: UILabel = {
       let typeLabel = UILabel()
        typeLabel.textColor = .systemBlue
        typeLabel.font = .systemFont(ofSize: 12.0, weight: .semibold)
        return typeLabel
    }()
    
    private lazy var appNameLabel: UILabel = {
       let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
       let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16.0, weight: .semibold)
        return label
    }()
    
    private lazy var imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.layer.cornerRadius = 7.0
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.separator.cgColor
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    func setup(feature: Feature) {
        setUpLayout()
        
        typeLabel.text = feature.type
        appNameLabel.text = feature.appName
        descriptionLabel.text = feature.description
        
        if let imageURL = URL(string: feature.imageURL) {
            imageView.kf.setImage(with: imageURL)
        }
    }
}

private extension FeatureSectionCollectionViewCell {
    func setUpLayout() {
        [typeLabel, appNameLabel, descriptionLabel, imageView].forEach {
            addSubview($0)
        }
        
        typeLabel.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
        }
        
        appNameLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(typeLabel.snp.bottom)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(appNameLabel.snp.bottom).offset(4.0)
        }
        
        imageView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(8.0)
            $0.bottom.equalToSuperview().inset(8.0)
        }
    }
}
