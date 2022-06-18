//
//  StartViewController.swift
//  Myboard
//
//  Created by bro on 2022/06/13.
//

import UIKit

class StartViewController: BaseViewController {
    
    let startView = StartView()
    let viewModel = StartViewModel()
    
    override func loadView() {
        self.view = startView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = viewModel.navigationTitle
    }
    
    override func configure() {
        super.configure()
        startView.startButton.addTarget(self, action: #selector(startButtonClicked), for: .touchUpInside)
        startView.loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
    }
    

    @objc func startButtonClicked() {
        navigator?.changeTo(viewController: SignUpViewController(), transitionStyle: .push)
    }
    
    @objc func loginButtonClicked() {
        navigator?.changeTo(viewController: LoginViewController(), transitionStyle: .push)
    }
    
}
