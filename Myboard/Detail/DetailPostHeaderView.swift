//
//  DetailPostHeadTableViewCell.swift
//  Myboard
//
//  Created by bro on 2022/06/17.
//

import UIKit

class DetailPostHeadView: BaseUIView {
    
    let profileImageView = UIImageView()
    let nameLabel = UILabel()
    let dateLabel = UILabel()
    let dividerView = UIView()
    let textLable = UILabel()
    let dividerView2 = UIView()
    
    let commentStackView = UIStackView()
    let commentImageView = UIImageView()
    let commentLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initViewConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func setupView() {
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(dateLabel)
        addSubview(dividerView)
        addSubview(textLable)
        addSubview(dividerView2)
        
        addSubview(commentStackView)
        commentStackView.addArrangedSubview(commentImageView)
        commentStackView.addArrangedSubview(commentLabel)
    }

    override func setupConstraints() {
        profileImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(10)
            $0.width.height.equalTo(60)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.top)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(10)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(30)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom)
            $0.leading.equalTo(nameLabel)
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(profileImageView.snp.bottom)
            $0.height.equalTo(30)
        }
        
        dividerView.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        textLable.snp.makeConstraints {
            $0.top.equalTo(dividerView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.greaterThanOrEqualTo(50)
        }
        
        dividerView2.snp.makeConstraints {
            $0.top.equalTo(textLable.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        commentStackView.snp.makeConstraints {
            $0.top.equalTo(dividerView2.snp.bottom).offset(10)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
        }
        
        commentImageView.snp.makeConstraints {
            $0.width.equalTo(30)
            $0.height.equalTo(30)
        }
    }
        
    private func initViewConfig() {
        labelConfig()
        dividerViewConfig()
        stackViewConfig()
        imageViewConfig()
    }
    
    private func labelConfig() {
        nameLabel.font = .boldSystemFont(ofSize: 18)
        nameLabel.sizeToFit()
        
        dateLabel.font = .systemFont(ofSize: 15)
        dateLabel.sizeToFit()
    }
    
    private func dividerViewConfig() {
        dividerView.backgroundColor = .lightGray
    }
    
    private func stackViewConfig() {
        commentStackView.axis = .horizontal
        commentStackView.spacing = 20
    }

    
    private func imageViewConfig() {
        profileImageView.image = UIImage(systemName: SystemImage.person.rawValue)
        profileImageView.contentMode = .scaleAspectFit
    }
    
    func bind(post: Post) {
        nameLabel.text = post.user
        dateLabel.text = post.updatedAt.dateFormat()
        textLable.text = post.text
        commentLabel.text = "댓글 \(post.comments.count)"
    }
}
