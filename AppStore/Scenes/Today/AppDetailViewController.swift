//
//  AppDetailViewController.swift
//  AppStore
//
//  Created by LeeHsss on 2022/02/18.
//

import SnapKit
import UIKit
import Kingfisher

final class AppDetailViewController: UIViewController, setImage {
    private var todayDetail: Today
    
    init(_ todayDetail: Today) {
        self.todayDetail = todayDetail
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8.0
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .medium)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private lazy var downLoadButton: UIButton = {
       let button = UIButton()
        button.setTitle("받기", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12.0
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13.0, weight: .bold)
        
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = .systemBlue // image tintColor
        button.addTarget(self, action: #selector(didTapShareButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground //darkMode 이슈 방지 (white로 하면 강제로 white로 적용하기 때문)
        setUp()
    }
    
    func set(image: UIImage) {
        DispatchQueue.main.async {
            self.imageView.image = image
        }
    }
    
    
}

//MARK: Private-
private extension AppDetailViewController {
    func setUp() {
        [imageView, titleLabel, subTitleLabel, downLoadButton, shareButton].forEach {
            view.addSubview($0)
        }
        
        imageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16.0)
            $0.top.equalToSuperview().inset(32.0)
            $0.width.equalTo(100)
            $0.height.equalTo(100)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.top)
            $0.leading.equalTo(imageView.snp.trailing).offset(16.0)
            $0.trailing.equalToSuperview().inset(16.0)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.top.equalTo(titleLabel.snp.bottom).offset(4.0)
            $0.trailing.equalToSuperview().inset(16.0)
        }
        
        downLoadButton.snp.makeConstraints {
            $0.leading.equalTo(subTitleLabel.snp.leading)
            $0.bottom.equalTo(imageView.snp.bottom)
            $0.width.equalTo(60)
            $0.height.equalTo(32.0)
        }
        
        shareButton.snp.makeConstraints {
            $0.top.equalTo(downLoadButton.snp.top)
            $0.trailing.equalToSuperview().inset(16.0)
            $0.width.height.equalTo(32)
        }
        
        if let imageURL = URL(string: todayDetail.imageURL) {
            imageView.kf.setImage(with: imageURL)
        }
        titleLabel.text = todayDetail.title
        subTitleLabel.text = todayDetail.subTitle
        
    }
    
    @objc func didTapShareButton() {
        //MARK: Share Program 사용방법
        let data = try? Data(contentsOf: URL(string: todayDetail.imageURL)!)
        let activityItems: [Any] = [UIImage(data: data!)!]
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: [PhotoUIActivity(self, delegate: self, image: UIImage(data: data!)!)])
        
        activityVC.excludedActivityTypes = [UIActivity.ActivityType.message, UIActivity.ActivityType.copyToPasteboard, UIActivity.ActivityType.saveToCameraRoll]
        
        self.present(activityVC, animated: true, completion: nil)
    }
}


