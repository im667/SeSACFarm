//
//  LoginView.swift
//  SeSACFarm
//
//  Created by mac on 2022/01/01.
//

import UIKit
import SnapKit


protocol LoginViewRepresentable {
    
    func setupView()
    func setupConstraints()
    
}

class LoginView: UIView, LoginViewRepresentable {
    
    
    
    let userEmailTextField = UITextField()
    let passwordTextField = UITextField()
    let signInButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView() {
        
        addSubview(userEmailTextField)
      
        userEmailTextField.placeholder = "이메일 주소"
        userEmailTextField.layer.borderWidth = 1
        userEmailTextField.layer.borderColor = UIColor.lightGray.cgColor
        userEmailTextField.layer.masksToBounds = true
        userEmailTextField.layer.cornerRadius = 5
   
        addSubview(passwordTextField)
        passwordTextField.placeholder = "비밀번호"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.masksToBounds = true
        passwordTextField.layer.cornerRadius = 5
      
        
        addSubview(signInButton)
        signInButton.backgroundColor = UIColor(cgColor: .init(gray: 0.5, alpha: 0.3))
        signInButton.setTitle("로그인", for: .normal)
        signInButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .black)
        signInButton.layer.cornerRadius = 5
        
    }
    
    func setupConstraints() {
      
        
        userEmailTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.centerX.equalToSuperview()
            make.height.equalTo(52)
        }
        
     
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(userEmailTextField.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.centerX.equalToSuperview()
            make.height.equalTo(52)
        }
        
    
        
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.centerX.equalToSuperview()
            make.height.equalTo(52)
        }
        
        
    }
    
    
}
