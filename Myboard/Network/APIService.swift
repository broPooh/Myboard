//
//  APIService.swift
//  Myboard
//
//  Created by bro on 2022/06/17.
//

import Foundation

class APIService {
 
    //MARK: - relateive Auth
    static func signUp(username: String, email: String, password: String, completion: @escaping (SignData?, APIError?) -> Void) {
        var request = URLRequest(url: Endpoint.signup.url)
        request.httpMethod = Method.POST.rawValue
        request.httpBody = "username=\(username)&email=\(email)&password=\(password)".data(using: .utf8, allowLossyConversion: false)
        
        URLSession.request(endpoint: request, completion: completion)
    }
    
    static func login(email: String, password: String, completion: @escaping (SignData?, APIError?) -> Void) {
        var request = URLRequest(url: Endpoint.login.url)
        request.httpMethod = Method.POST.rawValue
        request.httpBody = "identifier=\(email)&password=\(password)".data(using: .utf8, allowLossyConversion: false)
        
        URLSession.request(endpoint: request, completion: completion)
    }
    
    static func changePassword() {
        
    }
    
    //MARK: - relateive Post
    static func fetchPost(completion: @escaping ([Post]?, APIError?) -> Void) {
        var request = URLRequest(url: Endpoint.post.url)
        request.httpMethod = Method.GET.rawValue
        request.setValue("Bearer \(UserDefaultManager.token)", forHTTPHeaderField: "Authorization")
        
        URLSession.request(endpoint: request, completion: completion)
    }
    
    static func fetchPost(startPage: Int, limitPage: Int = 10, completion: @escaping ([Post]?, APIError?) -> Void) {
        var request = URLRequest(url: Endpoint.post.url)
        request.httpMethod = Method.GET.rawValue
        request.setValue("Bearer \(UserDefaultManager.token)", forHTTPHeaderField: "Authorization")
        
        URLSession.request(endpoint: request, completion: completion)
    }
    
    static func fetchPostsFromPage(startPage: Int, limitPage: Int = 10, completion: @escaping ([Post]?, APIError?) -> Void) {
        guard var component = URLComponents(string: Endpoint.post.urlString) else { return }
        component.queryItems = [
            URLQueryItem(name: "_start", value: "\(startPage)"),
            URLQueryItem(name: "_limit", value: "\(limitPage)"),
            URLQueryItem(name: "_sort", value: "created_at:desc")
        ]

        let request = URLRequest(url: component.url!)
        URLSession.request(endpoint: request, completion: completion)
    }
    
    static func writePost() {
        
    }
    
    static func detailPost() {
        
    }
    
    static func updatePost() {
        
    }
    
    static func deletePost() {
        
    }
    
    //MARK: - relatevie Comment
    static func fetchComment() {
        
    }
    
    static func writeComment() {
        
    }
    
    static func updateComment() {
        
    }
    
    static func deleteComment() {
        
    }
    
}
