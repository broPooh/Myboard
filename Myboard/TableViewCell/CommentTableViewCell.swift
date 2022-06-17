//
//  CommentTableViewCell.swift
//  Myboard
//
//  Created by bro on 2022/06/17.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    
    let nameLabel = UILabel()
    let commentLabel = UILabel()
    let button = UIButton()
    
    var commentButtonCliked: (() -> Void)?
    

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
        addSubview(commentLabel)
        addSubview(button)
    }
    
    private func setupConstrains() {
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(10)
            $0.leading.equalTo(safeAreaLayoutGuide).offset(20)
        }
        
        button.snp.makeConstraints {
            $0.trailing.equalTo(safeAreaLayoutGuide).offset(-20)
            $0.top.equalTo(nameLabel)
            $0.width.equalTo(30)
        }
        
        commentLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(5)
            $0.leading.equalTo(nameLabel)
            $0.trailing.lessThanOrEqualTo(button.snp.leading).offset(-10)
            $0.bottom.lessThanOrEqualTo(safeAreaLayoutGuide).offset(-10)
        }
    }
    
    private func initViewConfig() {
        labelConfig()
        buttonConfig()
    }
    
    private func labelConfig() {
        nameLabel.font = .systemFont(ofSize: 15)
        nameLabel.sizeToFit()
        
        commentLabel.font = .systemFont(ofSize: 17)
        commentLabel.numberOfLines = 0
        commentLabel.sizeToFit()
    }
    
    private func buttonConfig() {
        button.setTitle("", for: .normal)
        button.setImage(UIImage(systemName: SystemImage.ellipsis.rawValue), for: .normal)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
    
    @objc func buttonClicked() {
        commentButtonCliked?()
    }
    
    func bind(comment: Comment) {
        nameLabel.text = "\(comment.user)"
        commentLabel.text = "댓글 \(comment.comment)"
    }
    
}
