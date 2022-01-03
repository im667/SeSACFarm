//
//  APIService.swift
//  SeSACFarm
//
//  Created by mac on 2022/01/01.
//

import Foundation
enum APIError: Error {
    case invalidResponse
    case noData
    case failed
    case invalidData
}


class APIService {
    
    static func SignUp(username: String, email:String, password: String, completion: @escaping (SignUser?, APIError?)->Void) {
        
        let url = URL(string: "http://test.monocoding.com:1231/auth/local/register")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = "username=\(username)&email=\(email)&password=\(password)".data(using: .utf8, allowLossyConversion: false)
        
      
        
        URLSession.shared.dataTask(with: request) { data, response, error in
      
            
            guard error == nil else {
                print("ERROR")
                completion(nil, .failed)
                return
            }
            
            guard let data = data else {
                print("NO DATA")
                completion(nil, .noData)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                
                completion(nil, .invalidResponse)
                return
            }
            
            guard response.statusCode == 200 else {
                print("ERROR CODE")
                completion(nil, .failed)
                return
            }

            do {
                let decoder = JSONDecoder()
                let userData = try decoder.decode(SignUser.self, from: data)
                completion(userData, nil)
            } catch {
                print("DECODE ERROR")
                completion(nil, .invalidData)
            }
            
        }.resume()
        
    }
    
    static func Login(identifier:String, password: String, completion: @escaping (SignUser?, APIError?)->Void) {
        
        let url = URL(string: "http://test.monocoding.com:1231/auth/local")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        //String=> data, dictionary -> JSONSerialization / Codable
        request.httpBody = "identifier=\(identifier)&password=\(password)".data(using: .utf8, allowLossyConversion: false)
        
      
        
        URLSession.shared.dataTask(with: request) { data, response, error in
      
            
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
                completion(nil, .failed)
                return
            }

            do {
                let decoder = JSONDecoder()
                let userData = try decoder.decode(SignUser.self, from: data)
                completion(userData, nil)
            } catch {
                completion(nil, .invalidData)
            }
            
        }.resume()
        
    }
    
    static func getPosts(_ text:String, completion: @escaping (Result?, APIError?)->Void) {
        
        let url = URL(string: "http://test.monocoding.com:1231/posts")!
        let token = UserDefaults.standard.string(forKey: "token") ?? ""
        print("token: \(token)")
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer " + token, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
      
            
            guard error == nil else {
                completion(nil, .failed)
                print("ERROR")
                return
            }
            
            guard let data = data else {
                completion(nil, .noData)
                print("NO DATA")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(nil, .invalidResponse)
                return
            }
            
            guard response.statusCode == 200 else {
                completion(nil, .failed)
                print("CODE ERROR")
                return
            }

            do {
                let decoder = JSONDecoder()
                let userData = try decoder.decode(Result.self, from: data)
                completion(userData, nil)
            } catch {
                print("DECODE ERROR")
                completion(nil, .invalidData)
            }
            
        }.resume()
        
    }
    
    
}
