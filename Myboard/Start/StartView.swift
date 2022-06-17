//
//  StartView.swift
//  Myboard
//
//  Created by bro on 2022/06/11.
//

import UIKit

class StartView: BaseUIView {
    
    let logoStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 10
        $0.alignment = .center
    }
    
    let logoImageView = UIImageView()
    let titleLabel = UILabel()
    let contentLabel = UILabel()
    
    let startButton = UIButton()
    
    let checkStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 10
        $0.alignment = .center
    }
    let checkLabel = UILabel()
    let loginButton = UIButton()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        initViewConfig()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func setupView() {
        addSubview(logoStackView)
        logoStackView.addArrangedSubview(logoImageView)
        logoStackView.addArrangedSubview(titleLabel)
        logoStackView.addArrangedSubview(contentLabel)
        
        addSubview(startButton)
        addSubview(checkStackView)
        checkStackView.addArrangedSubview(checkLabel)
        checkStackView.addArrangedSubview(loginButton)
    }
    
    override func setupConstraints() {
        //MARK: Center Constriants
        logoStackView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalToSuperview()
        }
                
        logoImageView.snp.makeConstraints {
            $0.width.equalToSuperview().multipliedBy(0.4)
            $0.height.equalTo(logoImageView.snp.width)
        }
        
        //MARK: Bottom Constriants
        checkStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide).offset(-20)
            $0.height.equalTo(50)
        }
                        
        startButton.snp.makeConstraints {
            $0.bottom.equalTo(checkStackView.snp.top).offset(-5)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(50)
        }
        
    }
    
    func initViewConfig() {
        imageViewConfig()
        labelConfig()
        startButtonConfig()
        loginButtonConfig()
    }
    
    func imageViewConfig() {
        logoImageView.image = UIImage(named: AssetImage.logo.rawValue)
        logoImageView.contentMode = .scaleAspectFit
    }
    
    func labelConfig() {
        titleLabel.text = "당신 근처의 새싹농장"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)

        contentLabel.text = "iOS 지식부터 바람의 나라까지 \n지금 SeSAC에서 함께해보세요!"
        contentLabel.textColor = .black
        contentLabel.font = UIFont.systemFont(ofSize: 16)
        contentLabel.numberOfLines = 2
        contentLabel.textAlignment = .center
        
        checkLabel.text = "이미 계정이 있나요?"
    }
    
    func startButtonConfig() {
        startButton.setTitle("시작하기", for: .normal)
        startButton.backgroundColor = .systemGreen
        startButton.layer.cornerRadius = 10
    }
    
    func loginButtonConfig() {
        loginButton.setTitle("로그인", for: .normal)
        loginButton.setTitleColor(.systemGreen, for: .normal)
        loginButton.backgroundColor = .none
    }
    
}
