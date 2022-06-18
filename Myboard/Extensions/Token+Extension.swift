//
//  Token+Extension.swift
//  Myboard
//
//  Created by bro on 2022/06/18.
//

import UIKit

extension BaseViewController {
    
    func refreshToken() {
        let okAction = UIAlertAction(title: "확인", style: .default) { action in
            self.navigator?.changeFirstViewController(firstVC: StartViewController())
        }
        
        presentAlert(title: "로그인 시간 만료", message: "다시 로그인해주세요", style: .alert, alertActions: okAction)
    }
    
}
