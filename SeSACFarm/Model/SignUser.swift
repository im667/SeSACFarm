//
//  User.swift
//  SeSACFarm
//
//  Created by mac on 2022/01/01.
//

import Foundation

struct SignUser: Codable {
    let jwt: String
    let user: SignUserClass
}

// MARK: - UserClass
struct SignUserClass: Codable {
    let id: Int
    let username, email: String
//    let password: String
}
