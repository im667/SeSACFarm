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
    
    let commentTextView : UITextView = {
        let text = UITextView()
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
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(16)
        }
        
        contentView.addSubview(commentModifyButton)
        commentModifyButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        contentView.addSubview(commentTextView)
        commentTextView.snp.makeConstraints { make in
            make.top.equalTo(commentUsernameLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        
    }
}

