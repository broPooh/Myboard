//
//  SignUpView.swift
//  Myboard
//
//  Created by bro on 2022/06/17.
//

import UIKit
import Then

class SignUpView: BaseUIView {
    
    let emailTextField = UITextField()
    let nickNameTextField = UITextField()
    let passwordTextField = UITextField()
    let passwordCheckTextFiled = UITextField()
    let signUpButton = UIButton()
    
    let signUpStackView = UIStackView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViewConfig()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func setupView() {
        addSubview(signUpStackView)
        signUpStackView.addArrangedSubview(emailTextField)
        signUpStackView.addArrangedSubview(nickNameTextField)
        signUpStackView.addArrangedSubview(passwordTextField)
        signUpStackView.addArrangedSubview(passwordCheckTextFiled)
        signUpStackView.addArrangedSubview(signUpButton)
    }

    override func setupConstraints() {
        signUpStackView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
                
        [emailTextField, nickNameTextField, passwordTextField, passwordCheckTextFiled].forEach {
            $0.snp.makeConstraints { make in
                make.height.equalTo(50)
                make.leading.equalToSuperview()
                make.trailing.equalToSuperview()
            }
        }
        
        signUpButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
    func initViewConfig() {
        stackViewConfig()
        textFiledConfig()
        buttonConfig()
    }
    
    func stackViewConfig() {
        signUpStackView.alignment = .center
        signUpStackView.axis = .vertical
        signUpStackView.spacing = 10
    }
    
    func textFiledConfig() {
        [emailTextField, nickNameTextField, passwordTextField, passwordCheckTextFiled].forEach {
            $0.textColor = .black
            $0.font = UIFont.systemFont(ofSize: 14)
            $0.borderStyle = .roundedRect
        }
        
        emailTextField.attributedPlaceholder = myAttributedPlaceholder(text: "이메일을 입력해주세요")
        nickNameTextField.attributedPlaceholder = myAttributedPlaceholder(text: "닉네임을 입력해주세요")
        passwordTextField.attributedPlaceholder = myAttributedPlaceholder(text: "비밀번호를 입력해주세요")
        passwordTextField.isSecureTextEntry = true
        passwordCheckTextFiled.attributedPlaceholder = myAttributedPlaceholder(text: "다시 한번 비밀번호를 입력해주세요")
        passwordCheckTextFiled.isSecureTextEntry = true
    }
    
    func buttonConfig() {
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        signUpButton.setTitle("시작하기", for: .normal)
        signUpButton.backgroundColor = .systemGreen.withAlphaComponent(0.5)
        signUpButton.layer.cornerRadius = 10
        signUpButton.isEnabled = false
    }
    
    func myAttributedPlaceholder(text: String) -> NSAttributedString {
        return NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    }
}
