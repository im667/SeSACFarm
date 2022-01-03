//
//  SignUpViewController.swift
//  SeSACFarm
//
//  Created by mac on 2022/01/01.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let mainView = SignUpView()
    var viewModel = SignUpViewModel()
    
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
   
        
        mainView.signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
        
        viewModel.username.bind { text in
            self.mainView.usernameTextField.text = text
        }
        
        viewModel.userEmail.bind { text in
            self.mainView.userEmailTextField.text = text
        }
  
        viewModel.password.bind { text in
            self.mainView.passwordTextField.text = text
        }
        
        viewModel.passwordCheck.bind { text in
            self.mainView.passwordCheckTextField.text = text
        }
        
        UserDefaults.standard.set(viewModel.password.value, forKey: "password")

        
        mainView.usernameTextField.addTarget(self, action: #selector(usernameTextFieldDidChange(_:)), for: .editingChanged)
      
        
        mainView.userEmailTextField.addTarget(self, action: #selector(userEmailTextFieldDidChange(_:)), for: .editingChanged)
        
        
        mainView.passwordTextField.addTarget(self, action: #selector(passwordTextFieldDidChange(_:)), for: .editingChanged)
        
        mainView.passwordCheckTextField.addTarget(self, action: #selector(passwordTextCheckFieldDidChange(_:)), for: .editingChanged)
        
        
        mainView.signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
    }

    @objc func usernameTextFieldDidChange(_ textfield: UITextField){
        viewModel.username.value = textfield.text ?? ""
    }
    
    @objc func userEmailTextFieldDidChange(_ textfield: UITextField){
        viewModel.userEmail.value = textfield.text ?? ""
    }
    
    
    @objc func passwordTextFieldDidChange(_ textfield: UITextField){
        viewModel.password.value = textfield.text ?? ""
    }
    
    @objc func passwordTextCheckFieldDidChange(_ textfield: UITextField){
        viewModel.passwordCheck.value = textfield.text ?? ""
    }
    
   
    
    
    @objc func signUpButtonClicked(){
        print(viewModel.username.value)
        print(viewModel.userEmail.value)
        print(viewModel.password.value)
        viewModel.UserSignUp {
            DispatchQueue.main.async {
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
                
                windowScene.windows.first?.rootViewController = UINavigationController(rootViewController: LoginViewController())
                windowScene.windows.first?.makeKeyAndVisible()
            }
        }
    }

}

