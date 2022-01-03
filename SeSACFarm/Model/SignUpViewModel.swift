//
//  SignViewModel.swift
//  SeSACFarm
//
//  Created by mac on 2022/01/01.
//


import Foundation

class SignUpViewModel {
    
    var username: Observable<String> = Observable("")
    var password: Observable<String> = Observable("")
    var passwordCheck: Observable<String> = Observable("")
    var userEmail: Observable<String> = Observable("")
    
    func UserSignUp(completion: @escaping ()->Void ) {
      
        APIService.SignUp(username: username.value, email: userEmail.value, password: password.value, completion: { userData, error in
         
            guard let userData = userData else {
                return
            }
            
            UserDefaults.standard.set(userData.jwt, forKey: "token")
            UserDefaults.standard.set(userData.user.email, forKey: "email")
            UserDefaults.standard.set(userData.user.username, forKey: "nickname")
            UserDefaults.standard.set(userData.user.id, forKey: "id")
//            UserDefaults.standard.set(userData.user.password, forKey: "password")
           

            completion()
        })
    }
    

    
}
