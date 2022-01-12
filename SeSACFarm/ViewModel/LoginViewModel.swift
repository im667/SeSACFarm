//
//  LoginViewModel.swift
//  SeSACFarm
//
//  Created by mac on 2022/01/01.
//


import Foundation

class LoginViewModel {
    
    var password: Observable<String> = Observable("")
    var userEmail: Observable<String> = Observable("")
    var username: Observable<String> = Observable("")
    
    
    func postUserLogin(completion: @escaping (Bool)->Void ) {
        
        APIService.Login(identifier: userEmail.value, password: password.value, completion: { userData, error in
            
            guard let userData = userData else {
                return
            }
            print(userData.jwt)
            UserDefaults.standard.set(userData.jwt, forKey: "token")
            UserDefaults.standard.set(userData.user.email, forKey: "email")
            UserDefaults.standard.set(userData.user.username, forKey: "nickname")
            UserDefaults.standard.set(userData.user.id, forKey: "id")
//            UserDefaults.standard.set(userData.user.password, forKey: "password")
           
            print(UserDefaults.standard.string(forKey: "token"))
            completion(true)
        })
    }
    func getUsername() {
        
        username.value = UserDefaults.standard.string(forKey: "nickname")!
        
    }

    
}
