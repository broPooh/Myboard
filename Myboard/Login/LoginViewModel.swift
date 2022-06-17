//
//  LoginViewModel.swift
//  Myboard
//
//  Created by bro on 2022/06/17.
//

import Foundation
import UIKit

class LoginViewModel {
    var email: Observable<String> = Observable("")
    var password: Observable<String> = Observable("")
            
    var formIsValid: Bool {
        email.value.isEmpty == false && password.value.isEmpty == false
    }
  
    
    var buttonBackgroundColor: UIColor {
        formIsValid ? .systemGreen : .systemGreen.withAlphaComponent(0.5)
    }
    
    func postLogin(completion: @escaping (APIError?) -> Void) {
        APIService.login(email: email.value, password: password.value) { data, error in
            guard let data = data else {
                completion(error)
                return
            }
            UserDefaultManager.token = data.jwt
            UserDefaultManager.userId = data.user.id
        }
    }
}
