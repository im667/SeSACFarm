//
//  Secssion1-PostTableViewCell.swift
//  SeSACFarm
//
//  Created by mac on 2022/01/05.
//

import UIKit
import SnapKit

class CommentTableViewCell: UITableViewCell {
    
    static let identifier = "DetailTableViewCell"
    
  
    let commentUsernameLabel : UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    let commentLabel : UILabel = {
        let text = UILabel()
        text.numberOfLines = 0
       text.font = .systemFont(ofSize: 12, weight: .regular)
        return text
    }()
    
    let commentModifyButton : UIButton = {
        let button = UIButton()
        button.tintColor = .systemGray5
        button.backgroundColor = .clear
        button.setImage(UIImage(systemName: "ellipsis.vertical.bubble"), for: .normal)
        return button
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: "CommentTableViewCell")
        
        loadLayout()
    }
        
    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
    
    func loadLayout() {
        
        contentView.addSubview(commentUsernameLabel)
        commentUsernameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(8)
            make.height.equalTo(24)
          
        }
        
        contentView.addSubview(commentModifyButton)
        commentModifyButton.snp.makeConstraints { make in
            make.centerY.equalTo(commentUsernameLabel.snp.centerY)
            make.trailing.equalToSuperview().offset(-8)
            make.size.equalTo(30)
        }
        
        contentView.addSubview(commentLabel)
        commentLabel.snp.makeConstraints { make in
            make.top.equalTo(commentUsernameLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-16)
        }
        
      
        
        
    }
}

