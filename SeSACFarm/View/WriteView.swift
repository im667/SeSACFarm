//
//  BoardWriteView.swift
//  SeSACFarm
//
//  Created by mac on 2022/01/04.
//

import UIKit
import SnapKit

protocol WriteViewRepresentable {
    
    func setupView()
    func setupConstraints()
    
}

class WriteView: UIView, WriteViewRepresentable {
    
    let textView = UITextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView() {
        
        addSubview(textView)
        
    }
    
    func setupConstraints() {
        
        textView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide).inset(20)
        }
        
    }
    
    
    
}
