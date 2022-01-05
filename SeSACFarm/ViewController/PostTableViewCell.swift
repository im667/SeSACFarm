import UIKit
import SnapKit

class PostTableViewCell: UITableViewCell {
    
    static let identifier = "PostTableViewCell"
    
    let userImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.fill")
        image.clipsToBounds = true
        image.layer.cornerRadius = 16
        image.tintColor = .systemGray
        return image
    }()
    
    let usernameLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.backgroundColor = .systemGray5
        label.clipsToBounds = true
        label.layer.cornerRadius = 3
        label.textColor = .systemGray
        return label
    }()
    
    
    let postDateLabel = UILabel()
    let postTextView = UITextView()
    
    let lineView : UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray5
        return line
    }()
    
    let lineView2 : UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray5
        return line
    }()
    
    let lineView3 : UIView = {
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
    
    let commentCountLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .darkGray
        return label
    }()
    
 
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: "PostTableViewCell")
        
        loadLayout()
    }
        
    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
    
    func loadLayout() {
        
        contentView.addSubview(userImage)
        userImage.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(24)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(32)
            make.height.equalTo(32)
           
        }
        
        contentView.addSubview(usernameLabel)
        usernameLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(24)
            make.leading.equalTo(userImage.snp.trailing).offset(12)
            make.height.equalTo(16)
        }
        
        contentView.addSubview(postDateLabel)
        postDateLabel.snp.makeConstraints { make in
            make.top.equalTo(usernameLabel.snp.bottom).offset(4)
            make.leading.equalTo(userImage.snp.trailing).offset(12)
            make.height.equalTo(12)
        }
        
        contentView.addSubview(lineView)
        lineView.snp.makeConstraints { make in
            make.top.equalTo(postDateLabel.snp.bottom).offset(12)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        contentView.addSubview(postTextView)
        postTextView.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
       
        
        contentView.addSubview(lineView2)
        lineView.snp.makeConstraints { make in
            make.top.equalTo(postTextView.snp.bottom).offset(24)
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
        
        commentBox.addArrangedSubview(commentCountLabel)
        commentCountLabel.snp.makeConstraints { make in
            make.height.equalTo(16)
            make.leading.equalTo(commentImage.snp.trailing).offset(4)
        }
        
        contentView.addSubview(commentBox)
        commentBox.snp.makeConstraints { make in
            make.top.equalTo(lineView2.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(24)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview()
      
        }
        
        contentView.addSubview(lineView3)
        lineView.snp.makeConstraints { make in
            make.top.equalTo(commentBox.snp.bottom).offset(24)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        
        
    }
}

