//
//  URL+Extension.swift
//  Myboard
//
//  Created by bro on 2022/06/17.
//

import Foundation

extension URL {
    static let baseURL = "http://test.monocoding.com:1231/"
    
    static func makeEndPoint(_ endpoint: String) -> URL {
        URL(string: baseURL + endpoint)!
    }
    
    
}

extension String {
    static let baseURL = "http://test.monocoding.com:1231/"
    
    static func makeEndPointString(_ endpoint: String) -> String {
        baseURL + endpoint
    }
}
