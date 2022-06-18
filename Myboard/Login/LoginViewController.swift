//
//  SignInViewController.swift
//  Myboard
//
//  Created by bro on 2022/06/17.
//

import UIKit

class LoginViewController: BaseViewController {
    
    let loginView = LoginView()
    let viewModel = LoginViewModel()
    
    override func loadView() {
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "로그인"
    }
    
    override func configure() {
        super.configure()
    }
    
    func bind() {
        viewModel.email.bind { text in
            self.loginView.emailTextField.text = text
            self.buttonEnable()
        }
                
        viewModel.password.bind { text in
            self.loginView.passwordTextField.text = text
            self.buttonEnable()
        }
    }
    
    func targetConfig() {
        loginView.emailTextField.addTarget(self, action: #selector(emailFieldDidChange(_:)), for: .editingChanged)
        loginView.passwordTextField.addTarget(self, action: #selector(passwordFieldDidChange(_:)), for: .editingChanged)
        
        loginView.loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
    }
    
    
    @objc private func emailFieldDidChange(_ textField: UITextField) {
        viewModel.email.value = textField.text ?? ""
    }
    
    @objc private func passwordFieldDidChange(_ textField: UITextField) {
        viewModel.password.value = textField.text ?? ""
    }
    
    @objc private func loginButtonClicked() {
        viewModel.postLogin { error in
            if error != nil {
                let alert = UIAlertController(title: "오류", message: "잘못된 로그인 정보입니다.", preferredStyle: .alert)
                let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
            } else {
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
                windowScene.windows.first?.rootViewController = UINavigationController(rootViewController: MainPostViewController())
                windowScene.windows.first?.makeKeyAndVisible()
            }
        }
    }
    
    private func buttonEnable() {
        loginView.loginButton.isEnabled = viewModel.formIsValid
        loginView.loginButton.backgroundColor = viewModel.buttonBackgroundColor
    }
    
}
