//
//  MainViewController.swift
//  SeSACFarm
//
//  Created by mac on 2022/01/01.
//

import Foundation
import UIKit
import SnapKit

class MainViewController:UIViewController {
    
    let logoImageView = UIImageView()
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    let startButton = UIButton()
    let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 4
        view.backgroundColor = .clear
        view.distribution = .fillEqually
        return view
    }()
    
    let signInLabel = UILabel()
    let signInButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(logoImageView)
        self.logoImageView.image = UIImage(named: "logo_ssac_clear")
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-72)
            make.width.equalTo(120)
            make.height.equalTo(120)
        }
        
        view.addSubview(titleLabel)
        titleLabel.text = "당신 근처의 새싹농장"
        titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
        }
        
        view.addSubview(subTitleLabel)
        subTitleLabel.text = "iOS지식부터 바람의나라까지 \n 지금 SeSAC에서 함께해보세요"
        subTitleLabel.font = .systemFont(ofSize: 12, weight: .regular)
        subTitleLabel.numberOfLines = 2
        subTitleLabel.textAlignment = .center
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
        
        view.addSubview(startButton)
        startButton.addTarget(self, action: #selector(startButtonClicked), for: .touchUpInside)
        startButton.backgroundColor = UIColor(red: 52/255, green: 161/255, blue: 112/255, alpha: 1)
        startButton.setTitle("시작하기", for: .normal)
        startButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .black)
        startButton.layer.cornerRadius = 5
        startButton.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(150)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.centerX.equalToSuperview()
            make.height.equalTo(52)
        }
        
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(startButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(16)
        }
        signInLabel.text = "이미 계정이 있나요?"
        signInLabel.textColor = .lightGray
        signInLabel.font = .systemFont(ofSize: 12, weight: .bold)
        
        signInButton.addTarget(self, action: #selector(signInButtonClicked), for: .touchUpInside)
        signInButton.setTitle("로그인", for: .normal)
        signInButton.setTitleColor(UIColor(red: 52/255, green: 161/255, blue: 112/255, alpha: 1), for: .normal)
        signInButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .black)
        signInButton.backgroundColor = .clear
        
        
        stackView.addArrangedSubview(signInLabel)
        stackView.addArrangedSubview(signInButton)
    }
    
    @objc func startButtonClicked(){
      
        
        let vc = SignUpViewController()
         
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func signInButtonClicked(){
        
        let vc = LoginViewController()
         
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

