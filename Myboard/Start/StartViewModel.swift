//
//  StartViewModel.swift
//  Myboard
//
//  Created by bro on 2022/06/13.
//

import UIKit

class StartViewModel {
    var navigationTitle: String = "새싹 농장"

    var listener: ((String, UIColor) -> Void)?
    
    func bind(listener: @escaping (String, UIColor) -> Void) {
        self.listener = listener
    }
}
