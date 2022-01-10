//
//  EndPoint.swift
//  SeSACFarm
//
//  Created by mac on 2022/01/03.
//


import Foundation

enum Method:String {
    case GET
    case POST
    case PUT
    case DELETE
}

enum Endpoint {
    
    case signUp
    case login
    case boards
    case boardsDetail(id: Int)
    case postComment
    case editComment(id: Int)
    case deleteComment(id: Int)
    
}


extension Endpoint {
    var url: URL {
        switch self {
        
        case .signUp:
            return .makeEndpoint("auth/local/register")
        case .login:
            return .makeEndpoint("auth/local")
        case .boards:
            return .makeEndpoint("posts?_sort=created_at:desc")
        case .boardsDetail(id: let id):
            return .makeEndpoint("comments?post=\(id)")
        case .postComment:
            return .makeEndpoint("comments")
        case .editComment(id: let id):
            return .makeEndpoint("comments/\(id)")
        case .deleteComment(id: let id):
            return .makeEndpoint("comments/\(id)")
        }
       
    }
}

extension URL {
    
    static let baseURL = "http://test.monocoding.com:1231/"
    
    static func makeEndpoint(_ endpoint: String) -> URL {
        URL(string: baseURL + endpoint)!
    }
    
}

extension URLSession {
    
    typealias Handler = (Data?, URLResponse?, Error?) -> Void
    
    @discardableResult

    func dataTask(_ endpoint: URLRequest, handler: @escaping Handler)-> URLSessionDataTask {
        let task = dataTask(with: endpoint, completionHandler: handler)
        
        task.resume()
        return task
        
    }
    
    static func request<T: Decodable>(_ session:URLSession = .shared, endpoint:URLRequest, completion: @escaping (T?, APIError?)->Void) {
        
        session.dataTask(endpoint) { data, response, error in
            DispatchQueue.main.async {
            
                print(data)
                print(response)
                print(error)
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
                    let userData = try decoder.decode(T.self, from: data)
                    completion(userData, nil)
                } catch {
                   
                    completion(nil, .invalidData)
                }
            }
            
        }
    }
    
}

