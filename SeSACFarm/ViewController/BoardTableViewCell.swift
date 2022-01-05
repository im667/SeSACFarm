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
    
  
    
    let usernameLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.backgroundColor = .systemGray5
        label.clipsToBounds = true
        label.layer.cornerRadius = 3
        label.textColor = .systemGray
        return label
    }()
    
    let postTextLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    let postDateLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .light)
        return label
    }()
    
    let lineView : UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray5
        return line
    }()
    
    let commentBox : UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 4
        view.backgroundColor = .clear
        view.alignment = .leading
        view.distribution = .fill
        return view
    }()
    
    let commentImage : UIImageView = {
        let image = UIImageView()
        
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "bubble.right")
        image.tintColor = .lightGray
     
        return image
    }()
    
    let commentLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .darkGray
        return label
    }()
    
    
    let lastLine: UIView = {
       let line = UIView()
        line.backgroundColor = .lightGray
        return line
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: "BoardTableViewCell")
        
        loadLayout()
    }
        
    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
    
    func loadLayout() {
        
        
        
        contentView.addSubview(usernameLabel)
        usernameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(16)
        }
        
        contentView.addSubview(postTextLabel)
        postTextLabel.snp.makeConstraints { make in
            make.top.equalTo(usernameLabel.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-12)
       
        }
        
        contentView.addSubview(postDateLabel)
        postDateLabel.snp.makeConstraints { make in
            make.top.equalTo(postTextLabel.snp.bottom).offset(16)
            make.leading.equalTo(usernameLabel.snp.leading)
            make.height.equalTo(16)
        }
        
        contentView.addSubview(lineView)
        lineView.snp.makeConstraints { make in
            make.top.equalTo(postDateLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        commentBox.addArrangedSubview(commentImage)
        commentImage.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.height.equalTo(16)
            make.width.equalTo(16)
        }
        
        commentBox.addArrangedSubview(commentLabel)
        commentLabel.snp.makeConstraints { make in
            make.height.equalTo(16)
            make.leading.equalTo(commentImage.snp.trailing).offset(4)
        }
        
        contentView.addSubview(commentBox)
        commentBox.snp.makeConstraints { make in
            make.top.equalTo(postDateLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(24)
            make.trailing.equalToSuperview().offset(-16)
            
        }
        
        contentView.addSubview(lastLine)
        lastLine.snp.makeConstraints { make in
            make.top.equalTo(commentBox.snp.bottom)
            make.height.equalTo(4)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        
        
    }
    
}
