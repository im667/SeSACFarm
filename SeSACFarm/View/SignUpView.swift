//
//  SignUpView.swift
//  SeSACFarm
//
//  Created by mac on 2022/01/01.
//

import UIKit
import SnapKit


protocol signUpViewRepresentable {
    
    func setupView()
    func setupConstraints()
    
}

class SignUpView: UIView, signUpViewRepresentable {
    
    
    
    let usernameTextField = UITextField()
    let userEmailTextField = UITextField()
    let passwordTextField = UITextField()
    let passwordCheckTextField = UITextField()
    let signUpButton = UIButton()
    
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
        
        addSubview(usernameTextField)
        usernameTextField.placeholder = "닉네임"
        usernameTextField.layer.borderWidth = 1
        usernameTextField.layer.borderColor = UIColor.lightGray.cgColor
        usernameTextField.layer.masksToBounds = true
        usernameTextField.layer.cornerRadius = 5
        
        addSubview(passwordTextField)
        passwordTextField.placeholder = "비밀번호"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.masksToBounds = true
        passwordTextField.layer.cornerRadius = 5
        
        addSubview(passwordCheckTextField)
        passwordCheckTextField.placeholder = "비밀번호 확인"
        passwordCheckTextField.isSecureTextEntry = true
        passwordCheckTextField.layer.borderWidth = 1
        passwordCheckTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordCheckTextField.layer.masksToBounds = true
        passwordCheckTextField.layer.cornerRadius = 5
        addSubview(signUpButton)
        
//        signUpButton.backgroundColor = .lightGray
        signUpButton.backgroundColor = UIColor(cgColor: .init(gray: 0.5, alpha: 0.3))
        signUpButton.setTitle("가입하기", for: .normal)
        signUpButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .black)
        signUpButton.layer.cornerRadius = 5
        
    }
    
    func setupConstraints() {
      
        
        userEmailTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.centerX.equalToSuperview()
            make.height.equalTo(52)
        }
        
        usernameTextField.snp.makeConstraints { make in
            make.top.equalTo(userEmailTextField.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.centerX.equalToSuperview()
            make.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.centerX.equalToSuperview()
            make.height.equalTo(52)
        }
        
        passwordCheckTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.centerX.equalToSuperview()
            make.height.equalTo(52)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(passwordCheckTextField.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.centerX.equalToSuperview()
            make.height.equalTo(52)
        }
        
        
    }
    
    
}
