//
//  MainView.swift
//  Myboard
//
//  Created by bro on 2022/06/17.
//

import UIKit
import SnapKit
import Then

class MainPostView: BaseUIView {
    
    let postTableView = UITableView()
    let floatingButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initViewConfig()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func setupView() {
        super.setupView()
        
        addSubview(postTableView)
        addSubview(floatingButton)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        postTableView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.bottom.equalTo(self.safeAreaLayoutGuide)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        floatingButton.snp.makeConstraints {
            $0.bottom.equalTo(self.safeAreaLayoutGuide).offset(-20)
            $0.trailing.equalTo(self.safeAreaLayoutGuide).offset(-20)
            $0.width.equalTo(80)
            $0.height.equalTo(80)
        }
        
    }
    
    private func initViewConfig() {
        bottonConfig()
        tableViewConfig()
    }
    
    private func tableViewConfig() {
        postTableView.separatorStyle = .none
        postTableView.register(PostViewCell.self, forCellReuseIdentifier: PostViewCell.reuseIdentifier)
        postTableView.rowHeight = 150
    }
    
    private func bottonConfig() {
        floatingButton.layer.cornerRadius = 40
        floatingButton.backgroundColor = .green
        floatingButton.layer.shadowColor = UIColor.black.cgColor
        floatingButton.layer.masksToBounds = false
        floatingButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        floatingButton.layer.shadowRadius = 5
        floatingButton.layer.shadowOpacity = 0.3
    }
        
}

