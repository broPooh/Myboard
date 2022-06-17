//
//  BaseUIView.swift
//  Myboard
//
//  Created by bro on 2022/06/11.
//

import UIKit
import SnapKit
import Then

class BaseUIView: UIView, ViewRepresentable {

    func setupView() { }

    func setupConstraints() { }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError()
    }
}
