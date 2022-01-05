//
//  LoginViewController.swift
//  SeSACFarm
//
//  Created by mac on 2022/01/01.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    let mainView = LoginView()
    var viewModel = LoginViewModel()
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        if UserDefaults.standard.string(forKey: "token") != nil{

            DispatchQueue.main.async {
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }

                windowScene.windows.first?.rootViewController = UINavigationController(rootViewController: BoardViewController())
                windowScene.windows.first?.makeKeyAndVisible()

            }
        }
    
        viewModel.userEmail.bind { text in
            self.mainView.userEmailTextField.text = text
        }
  
        viewModel.password.bind { text in
            self.mainView.passwordTextField.text = text
        }
        
        mainView.signInButton.addTarget(self, action: #selector(signInButtonClicked), for: .touchUpInside)
        
        mainView.userEmailTextField.addTarget(self, action: #selector(userEmailTextFieldDidChange(_:)), for: .editingChanged)
        
        
        mainView.passwordTextField.addTarget(self, action: #selector(passwordTextFieldDidChange(_:)), for: .editingChanged)
        
        
       
    }
    
    @objc func userEmailTextFieldDidChange(_ textfield: UITextField){
        viewModel.userEmail.value = textfield.text ?? ""
    }
    
    
    @objc func passwordTextFieldDidChange(_ textfield: UITextField){
        viewModel.password.value = textfield.text ?? ""
    }
    
    @objc func signInButtonClicked(){
        print(#function)
        
        viewModel.postUserLogin {
            DispatchQueue.main.async {
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
                
                windowScene.windows.first?.rootViewController = UINavigationController(rootViewController: BoardViewController())
                windowScene.windows.first?.makeKeyAndVisible()
            }
        }
    }
}
