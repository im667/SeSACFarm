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
        
        if textfield.text == self.mainView.passwordTextField.text {
          
            self.mainView.signUpButton.isEnabled = true
            self.mainView.signUpButton.backgroundColor = UIColor(red: 52/255, green: 161/255, blue: 112/255, alpha: 1)
        } else {
            showToast(message: "비밀번호가 일치하지 않습니다.")
            self.mainView.signUpButton.isEnabled = false
        }
        
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

    func showToast(message : String) {
        let toastLabel = UILabel(frame: CGRect(
            x: self.view.frame.size.width/2 - 75,
            y: self.view.frame.size.height/2, width: 150, height: 35))
            toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            toastLabel.textColor = UIColor.white
            toastLabel.font = UIFont.systemFont(ofSize: 16)
            toastLabel.textAlignment = .center;
            toastLabel.text = message
            toastLabel.alpha = 1.0
            toastLabel.layer.cornerRadius = 10;
            toastLabel.clipsToBounds = true
            self.view.addSubview(toastLabel)
            UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: { toastLabel.alpha = 0.0 }, completion: {(isCompleted) in toastLabel.removeFromSuperview() })
    }

    
    
}

