//
//  CommentView.swift
//  Myboard
//
//  Created by bro on 2022/06/17.
//

import UIKit
import SnapKit

class CommentView: BaseUIView {
    
    let textView = UITextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textViewConfig()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func setupView() {
        super.setupView()
        addSubview(textView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        textView.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide).inset(20)
        }
    }
    
    func initViewConfig() {
        textViewConfig()
    }
    
    func textViewConfig() {
        textView.font = .systemFont(ofSize: 20)
        textView.becomeFirstResponder()
    }
    
}
