//
//  DetailView.swift
//  Myboard
//
//  Created by bro on 2022/06/17.
//

import UIKit
import SnapKit

class DetailView: BaseUIView {
    
    let detailHeaderView = DetailPostHeadView()
    let commentTableView = UITableView()
    let textView = UITextView()
    
    override func setupView() {
        super.setupView()
        
        addSubview(detailHeaderView)
        addSubview(commentTableView)
        addSubview(textView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        detailHeaderView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
    
        commentTableView.snp.makeConstraints {
            $0.top.equalTo(detailHeaderView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(textView.snp.top)
        }
        
        textView.snp.makeConstraints {
            $0.bottom.equalTo(self.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().offset(50)
            $0.trailing.equalToSuperview().offset(-50)
            $0.height.greaterThanOrEqualTo(44)
        }
    }
    
    private func tableViewConfig() {
        commentTableView.register(CommentTableViewCell.self, forCellReuseIdentifier: CommentTableViewCell.reuseIdentifier)
   }
    
    private func textViewConfig() {
        textView.layer.cornerRadius = 10
        textView.layer.borderWidth = 2
        textView.layer.borderColor = UIColor.systemGreen.cgColor
        textView.font = .systemFont(ofSize: 20)
        textView.text = "댓글을 입력해 주세요"
        textView.textColor = .lightGray
        textView.sizeToFit()
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = true
    }
        
}
