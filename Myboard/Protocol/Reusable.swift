//
//  Reusable.swift
//  Myboard
//
//  Created by bro on 2022/06/11.
//

import Foundation

protocol Reusable {
    static var reuseIdentifier: String {
        get
    }
}
