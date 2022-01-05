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
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView() {
        
    }
    
    func setupConstraints() {
        
    }
    
    
    
}
