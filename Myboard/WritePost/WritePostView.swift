//
//  WritePostView.swift
//  Myboard
//
//  Created by bro on 2022/06/17.
//

import UIKit
import SnapKit
import Then

class WritePostView: BaseUIView {
    
    let textField = UITextView()
    
    override func setupView() {
        super.setupView()
        addSubview(textField)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        textField.snp.makeConstraints {
            $0.edges.equalTo(safeAreaLayoutGuide).inset(20)
        }
    }
    
    func textFieldConfig() {
        textField.font = .systemFont(ofSize: 20)
        textField.becomeFirstResponder()
    }
    
}
