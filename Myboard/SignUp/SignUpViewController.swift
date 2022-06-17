//
//  SignUnViewController.swift
//  Myboard
//
//  Created by bro on 2022/06/17.
//

import UIKit

class SignUpViewController: BaseViewController {
    
    let signUpView = SignUpView()
    let viewModel = SignUpViewModel()
    
    override func loadView() {
        super.loadView()
        self.view = signUpView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "새싹농장 가입하기"
        
        bind()
        targetConfig()
    }
    
    override func configure() {
        super.configure()
        signUpView.signUpButton.setTitle(viewModel.buttonTitle, for: .normal)
    }

    
    private func bind() {
        viewModel.email.bind { text in
            self.signUpView.emailTextField.text = text
            self.buttonEnable()
        }
        
        viewModel.nickName.bind { text in
            self.signUpView.nickNameTextField.text = text
            self.buttonEnable()
        }
        
        viewModel.password.bind { text in
            self.signUpView.passwordTextField.text = text
            self.buttonEnable()
        }
        
        viewModel.passwordCheck.bind { text in
            self.signUpView.passwordCheckTextFiled.text = text
            self.buttonEnable()
        }
    }
    
    private func targetConfig() {
        signUpView.emailTextField.addTarget(self, action: #selector(emailFieldDidChange(_:)), for: .editingChanged)
        signUpView.nickNameTextField.addTarget(self, action: #selector(nickNameFieldDidChange(_:)), for: .editingChanged)
        signUpView.passwordTextField.addTarget(self, action: #selector(passwordFieldDidChange(_:)), for: .editingChanged)
        signUpView.passwordCheckTextFiled.addTarget(self, action: #selector(passwordCheckFieldDidChange(_:)), for: .editingChanged)
        signUpView.signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
    }
    
    @objc private func nickNameFieldDidChange(_ textField: UITextField) {
        viewModel.nickName.value = textField.text ?? ""
    }
    @objc private func emailFieldDidChange(_ textField: UITextField) {
        viewModel.email.value = textField.text ?? ""
    }
    @objc private func passwordFieldDidChange(_ textField: UITextField) {
        viewModel.password.value = textField.text ?? ""
    }
    @objc private func passwordCheckFieldDidChange(_ textField: UITextField) {
        viewModel.passwordCheck.value = textField.text ?? ""
    }
    
    @objc private func signUpButtonClicked() {
        viewModel.postSignUp { error in
            if error != nil {
                let alert = UIAlertController(title: "오류", message: "이미 존재하는 아이디 혹은 이메일입니다.", preferredStyle: .alert)
                let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
            } else {
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
                windowScene.windows.first?.rootViewController = UINavigationController(rootViewController: StartViewController())
                windowScene.windows.first?.makeKeyAndVisible()
            }
        }
    }
    
    private func buttonEnable() {
        signUpView.signUpButton.isEnabled = viewModel.formIsValid
        signUpView.signUpButton.backgroundColor = viewModel.buttonBackgroundColor
        signUpView.signUpButton.setTitle(viewModel.buttonTitle, for: .normal)
    }
    
    
}
