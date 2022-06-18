//
//  CommonViewModel.swift
//  Myboard
//
//  Created by bro on 2022/06/18.
//

import Foundation
import RxSwift

protocol CommonViewModel {
    associatedtype Input
    associatedtype Output
    func transform(input: Input) -> Output
    var disposBag: DisposeBag { get set }
}
