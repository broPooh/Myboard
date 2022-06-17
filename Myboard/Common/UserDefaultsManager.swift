//
//  UserDefaultsManager.swift
//  Myboard
//
//  Created by bro on 2022/06/15.
//

import Foundation

struct UserDefaultManager {
    
    @UserDefaultWrapper(key: "token", defaultValue: "")
    static var token: String
    
    @UserDefaultWrapper(key: "userId", defaultValue: 0)
    static var userId: Int
}
