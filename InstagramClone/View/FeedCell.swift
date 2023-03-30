//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Vadim Kononenko on 28.03.2023.
//

import UIKit
import SnapKit

class FeedCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.image = #imageLiteral(resourceName: "venom-7")
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    private lazy var usernameBtn: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle("venom", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 13)
        btn.addTarget(self, action: #selector(didTapUsername), for: .touchUpInside)
        return btn
    }()
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.image = #imageLiteral(resourceName: "venom-7")
        return imageView
    }()
    
    private lazy var likeBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "like_unselected"), for: .normal)
        btn.tintColor = .black
        return btn
    }()
    
    private lazy var commentBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "comment"), for: .normal)
        btn.tintColor = .black
        return btn
    }()
    
    private lazy var shareBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "send2"), for: .normal)
        btn.tintColor = .black
        return btn
    }()
    
    private let likesLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "1 like"
        lbl.font = .boldSystemFont(ofSize: 13)
        return lbl
    }()
    
    private let captionLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Some caption text for now..."
        lbl.font = .systemFont(ofSize: 14)
        return lbl
    }()
    
    private let postTimeLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "2 days ago"
        lbl.font = .systemFont(ofSize: 12)
        lbl.textColor = .lightGray
        return lbl
    }()
    
    private let postActionsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        return stack
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Actions
    
    @objc private func didTapUsername() {
        print("Did tap!")
    }
    
}

//MARK: - Constraints

extension FeedCell {
    private func configure() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        addSubview(profileImageView)
        addSubview(usernameBtn)
        addSubview(postImageView)
        addSubview(postActionsStackView)
        
        postActionsStackView.addArrangedSubview(likeBtn)
        postActionsStackView.addArrangedSubview(commentBtn)
        postActionsStackView.addArrangedSubview(shareBtn)
        
        addSubview(likesLabel)
        addSubview(captionLabel)
        addSubview(postTimeLabel)
    }
    
    private func setupConstraints() {
        profileImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(12)
            $0.height.width.equalTo(40)
        }
        usernameBtn.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(8)
            $0.centerY.equalTo(profileImageView)
        }
        postImageView.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(self.snp.width)
        }
        postActionsStackView.snp.makeConstraints {
            $0.top.equalTo(postImageView.snp.bottom)
            $0.width.equalTo(120)
            $0.height.equalTo(50)
        }
        likesLabel.snp.makeConstraints {
            $0.top.equalTo(postActionsStackView.snp.bottom).offset(-8)
            $0.leading.equalToSuperview().offset(8)
        }
        captionLabel.snp.makeConstraints {
            $0.top.equalTo(likeBtn.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(8)
        }
        postTimeLabel.snp.makeConstraints {
            $0.top.equalTo(captionLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(8)
        }
    }
}
