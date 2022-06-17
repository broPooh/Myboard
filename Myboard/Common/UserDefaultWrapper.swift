//
//  UserDefaultWrapper.swift
//  Myboard
//
//  Created by bro on 2022/06/15.
//

import Foundation

@propertyWrapper
struct UserDefaultWrapper<T> {
    private let userdefault = UserDefaults.standard
    private let key: String

    private var defaultValue: T
    
    //wrappedValue 정의
    var wrappedValue: T {
        get {
            return userdefault.value(forKey: key) as? T ?? defaultValue
        }
        set {
            userdefault.setValue(newValue, forKey: key)
        }
    }
    
    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
}
