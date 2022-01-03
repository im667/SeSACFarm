//
//  BoardTableViewCell.swift
//  SeSACFarm
//
//  Created by mac on 2022/01/03.
//

import Foundation
import UIKit
import SnapKit

class BoardTableViewCell: UITableViewCell {
    
    static let identifier = "BoardTableViewCell"
    
    let usernameLabel = UILabel()
    let postTextView = UITextView()
    let postDateLabel = UILabel()
    let commentBox : UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 4
        view.backgroundColor = .clear
        view.distribution = .fillEqually
        return view
    }()
    
    let commentImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "bubble.right")
        image.tintColor = .lightGray
        
        return image
    }()
    
    let commentLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: "BoardTableViewCell")
    }
        
    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
    
    func loadLayout() {
        
        self.backgroundColor = .white
        self.addSubview(usernameLabel)
        usernameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalToSuperview().offset(12)
            make.width.equalTo(usernameLabel.snp.width)
            make.height.equalTo(16)
        }
        
        let sizeToFits = postTextView.sizeThatFits(CGSize(width: self.frame.width, height: CGFloat(MAXFLOAT)))
        
        self.addSubview(postTextView)
        postTextView.snp.makeConstraints { make in
            make.top.equalTo(usernameLabel.snp.bottom)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.height.equalTo(sizeToFits)
        }
        self.addSubview(postDateLabel)
        postDateLabel.snp.makeConstraints { make in
            make.top.equalTo(postTextView.snp.bottom).offset(16)
            make.leading.equalTo(usernameLabel.snp.leading)
            make.height.equalTo(16)
        }
        
        
        commentBox.addArrangedSubview(commentImage)
        commentBox.addArrangedSubview(commentLabel)
        
        self.addSubview(commentBox)
        commentBox.snp.makeConstraints { make in
            make.top.equalTo(postDateLabel.snp.bottom).offset(16)
            make.leading.equalTo(usernameLabel.snp.leading)
            make.height.equalTo(24)
        }
        
        
    }
    
}
