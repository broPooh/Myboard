//
//  URLSession+Extension.swift
//  Myboard
//
//  Created by bro on 2022/06/17.
//

import Foundation

extension URLSession {
    
    typealias Handler = (Data?, URLResponse?, Error?) -> Void
    
    @discardableResult
    func dataTask(_ endpoint: URLRequest, handler: @escaping Handler) -> URLSessionDataTask {
        let task = dataTask(with: endpoint, completionHandler: handler)
        task.resume()
        return task
    }
    
    static func request<T: Codable>(_ session: URLSession = .shared, endpoint: URLRequest, completion: @escaping (T?, APIError?) -> Void) {
        
        session.dataTask(endpoint) { data, response, error in
            DispatchQueue.main.async {
                
                guard error == nil else {
                    completion(nil, .failed)
                    return
                }
                
                guard let data = data else {
                    completion(nil, .noData)
                    return
                }
                
                guard let response = response as? HTTPURLResponse else {
                    completion(nil, .invalidResponse)
                    return
                }
                
                
                guard response.statusCode == 200 else {
                    do {
                        let decoder = JSONDecoder()
                        let jsonData = try decoder.decode(ErrorBody.self, from: data)
                        if jsonData.message == ErrorMessage.invalidToken.rawValue {
                            completion(nil, .tokenExpired)
                            return
                        }
                    } catch {
                        return
                    }
                    completion(nil, .failed)
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let userData = try decoder.decode(T.self, from: data)
                    completion(userData, nil)
                } catch {
                    completion(nil, .invalidData)
                }
            }
        }
    }
    
    static func request(_ session: URLSession = .shared, endpoint: URLRequest, completion: @escaping (APIError?) -> Void) {
        
        session.dataTask(endpoint) { data, response, error in
            DispatchQueue.main.async {
                
                guard error == nil else {
                    completion(.failed)
                    return
                }
                
                guard data != nil else {
                    completion(.noData)
                    return
                }
                
                guard let response = response as? HTTPURLResponse else {
                    completion(.invalidResponse)
                    return
                }
                
                guard response.statusCode == 200 else {
                    do {
                        let decoder = JSONDecoder()
                        let jsonData = try decoder.decode(ErrorBody.self, from: data!)
                        if jsonData.message == ErrorMessage.invalidToken.rawValue {
                            completion(.tokenExpired)
                            return
                        }
                    } catch {
                        return
                    }
                    completion(.failed)
                    return
                }

                completion(nil)
            }
        }
    }

}
