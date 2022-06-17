//
//  BaseViewController.swift
//  Myboard
//
//  Created by bro on 2022/06/13.
//

import UIKit
import SnapKit
import Then

class BaseViewController: UIViewController, Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    var navigator: Navigator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        //setupConstraints()
    }
    
    func configure() {
        view.backgroundColor = .white
        navigator = Navigator(vc: self)
    }
    
//    func setupConstraints() {
//
//    }
    
}

