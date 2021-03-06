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
        titleLabel.text = "?????? ????????? ????????????"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)

        contentLabel.text = "iOS ???????????? ????????? ???????????? \n?????? SeSAC?????? ??????????????????!"
        contentLabel.textColor = .black
        contentLabel.font = UIFont.systemFont(ofSize: 16)
        contentLabel.numberOfLines = 2
        contentLabel.textAlignment = .center
        
        checkLabel.text = "?????? ????????? ??????????"
    }
    
    func startButtonConfig() {
        startButton.setTitle("????????????", for: .normal)
        startButton.backgroundColor = .systemGreen
        startButton.layer.cornerRadius = 10
    }
    
    func loginButtonConfig() {
        loginButton.setTitle("?????????", for: .normal)
        loginButton.setTitleColor(.systemGreen, for: .normal)
        loginButton.backgroundColor = .none
    }
    
}
