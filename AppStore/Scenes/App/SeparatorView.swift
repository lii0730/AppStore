//
//  SeparatorView.swift
//  AppStore
//
//  Created by LeeHsss on 2022/02/17.
//

import SnapKit
import UIKit

final class SeparatorView: UIView {
    private lazy var separator: UIView = {
       let view = UIView()
        view.backgroundColor = .separator
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(separator)
        
        separator.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16.0)
            $0.trailing.top.equalToSuperview()
            $0.height.equalTo(0.5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
