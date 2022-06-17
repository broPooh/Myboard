//
//  SignUpViewModel.swift
//  Myboard
//
//  Created by bro on 2022/06/17.
//

import Foundation
import UIKit

class SignUpViewModel {
    var email: Observable<String> = Observable("")
    var nickName: Observable<String> = Observable("")
    var password: Observable<String> = Observable("")
    var passwordCheck: Observable<String> = Observable("")
            
    var formIsValid: Bool {
        email.value.isEmpty == false && nickName.value.isEmpty == false && password.value.isEmpty == false && passwordCheck.value.isEmpty == false
    }
    
    var buttonTitle: String {
        formIsValid ? "시작하기" : "가입하기"
    }
    
    var buttonBackgroundColor: UIColor {
        formIsValid ? .systemGreen : .systemGreen.withAlphaComponent(0.5)
    }
    
    func postSignUp(completion: @escaping (APIError?) -> Void) {
        APIService.signUp(username: nickName.value, email: email.value, password: password.value) { data, error in
            guard let data = data else {
                completion(error)
                return
            }
            UserDefaultManager.token = data.jwt
            UserDefaultManager.userId = data.user.id
        }
    }
}
