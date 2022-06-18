//
//  LoginViewModel.swift
//  Myboard
//
//  Created by bro on 2022/06/17.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewModel: CommentViewModel {
    var disposBag = DisposeBag()
    
    struct Input {
        let email: ControlProperty<String?>
        let password: ControlProperty<String?>
        let tap: ControlEvent<Void>
    }
    
    struct Output {
        let validButtonStatus: Observable<Bool>
        let validText: BehaviorRelay<String>
        let sceneTransition: ControlEvent<Void>
    }
    
    let emailRx = PublishSubject<String>()
    let passwordRx = PublishSubject<String>()
    
    
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
