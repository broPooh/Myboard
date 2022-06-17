//
//  PostViewCell.swift
//  Myboard
//
//  Created by bro on 2022/06/17.
//

import UIKit
import SnapKit

class PostViewCell: UITableViewCell {
    
    // MARK: - Views
    let nameLabel = UILabel()
    let contentLabel = UILabel()
    let dateLabel = UILabel()
    let dividerView = UIView()
    let commentStackView = UIStackView()
    let commentImageView = UIImageView()
    let commentLabel = UILabel()
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
     
        selectionStyle = .none
        
        setUp()
        setupConstrains()
        initViewConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUp() {
        addSubview(nameLabel)
        addSubview(contentLabel)
        addSubview(dateLabel)
        addSubview(dividerView)
                
        addSubview(commentStackView)
        commentStackView.addArrangedSubview(commentImageView)
        commentStackView.addArrangedSubview(commentLabel)
    }
    
    private func setupConstrains() {
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(15)
            $0.leading.equalToSuperview().offset(20)
            $0.height.equalTo(20)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(10)
            $0.leading.equalTo(nameLabel)
            $0.trailing.equalToSuperview()
            $0.height.greaterThanOrEqualTo(100)

        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(10)
            $0.leading.equalTo(nameLabel)
            $0.trailing.equalToSuperview()
        }
        
        dividerView.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }

        commentStackView.snp.makeConstraints {
            $0.top.equalTo(dividerView.snp.bottom).offset(10)
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
        nameLabel.backgroundColor = .systemGroupedBackground
        nameLabel.font = .systemFont(ofSize: 15)
        nameLabel.textRect(forBounds: nameLabel.bounds, limitedToNumberOfLines: 1)
        nameLabel.numberOfLines = 1
        nameLabel.layer.cornerRadius = 8
        
        contentLabel.font = .systemFont(ofSize: 20)
        contentLabel.numberOfLines = 4
        contentLabel.sizeToFit()
        
        dateLabel.font = .systemFont(ofSize: 15)
        dateLabel.sizeToFit()
    
        commentLabel.font = .systemFont(ofSize: 18)
        commentLabel.sizeToFit()
            
    }
    
    private func dividerViewConfig() {
        dividerView.backgroundColor = .lightGray
    }
    
    private func stackViewConfig() {
        commentStackView.axis = .horizontal
        commentStackView.spacing = 20
    }
    
    private func imageViewConfig() {
        commentImageView.image = UIImage(systemName: "bubble.right")
    }
    
    func bind(post: Post) {
        nameLabel.text = post.user
        contentLabel.text = post.text
        dateLabel.text = post.updatedAt.dateFormat()
        commentLabel.text = "댓글 \(post.comments.count)"
    }
    
}
