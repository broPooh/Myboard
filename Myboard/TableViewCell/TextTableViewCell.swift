//
//  TextTableViewCell.swift
//  Myboard
//
//  Created by bro on 2022/06/17.
//

import UIKit

class TextTableViewCell: UITableViewCell {

    let mainTextLabel = UILabel()
  

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
        addSubview(mainTextLabel)
    }
    
    private func setupConstrains() {
        mainTextLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(20)
            $0.leading.equalTo(safeAreaLayoutGuide).offset(20)
            $0.trailing.equalTo(safeAreaLayoutGuide).offset(-20)
            $0.bottom.equalToSuperview().offset(-20)
        }
    }
    
    private func initViewConfig() {
        labelConfig()
    }
    
    private func labelConfig() {
        mainTextLabel.font = .systemFont(ofSize: 20)
        mainTextLabel.numberOfLines = 0
        mainTextLabel.sizeToFit()
    }

    func bind(post: Post) {
        mainTextLabel.text = post.text
    }
    
}
