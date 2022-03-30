//
//  TodayCollectionHeaderView.swift
//  AppStore
//
//  Created by LeeHsss on 2022/02/11.
//

import UIKit
import SnapKit
import Kingfisher

final class TodayCollectionHeaderView: UICollectionReusableView {
    //MARK: Header와 Footer를 생성하기 위해서는 반드시 UICollectionReusableView를 상속해야 함
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .semibold)
        label.textColor = .secondaryLabel
        label.text = "2월 11일 금요일"
        
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 36.0, weight: .black)
        label.textColor = .label
        label.text = "투데이"
        
        return label
    }()
    
    func setupViews() {
        [dateLabel, titleLabel].forEach {
            addSubview($0)
        }
        
        dateLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16.0)
            $0.top.equalToSuperview().inset(32.0)
            $0.trailing.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(dateLabel)
            $0.top.equalTo(dateLabel.snp.bottom).offset(8.0)
        }
    }
}
