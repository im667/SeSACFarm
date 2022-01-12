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
        
        if textfield.text != "" {
            self.mainView.signInButton.backgroundColor = UIColor(red: 52/255, green: 161/255, blue: 112/255, alpha: 1)
        }
    }
    
    @objc func signInButtonClicked(){
        print(#function)
        
        viewModel.postUserLogin { value in
            if value {
            DispatchQueue.main.async {
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
                
                windowScene.windows.first?.rootViewController = UINavigationController(rootViewController: BoardViewController())
                windowScene.windows.first?.makeKeyAndVisible()
                }
            } else {
                self.showToast(message: "없거나 잘못된 ID/PW 입니다.")
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
