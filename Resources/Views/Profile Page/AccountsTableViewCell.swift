//
//  AccountsTableViewCell.swift
//  QuizX
//
//  Created by jothi-pt5112 on 27/07/22.
//

import UIKit

class AccountsTableViewCell: UITableViewCell {

    static let identifier = "AccountsTableViewCell"
    //weak var editButtonDelegate : NickNameEditDelegate)?
    
    let userNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        //label.font = UIFont.boldSystemFont(ofSize: 21.0)
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .left
        return label
    }()
    
    let userNameText : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        //label.font = UIFont.boldSystemFont(ofSize: 21.0)
        label.textAlignment = .left
        return label
    }()
    
    let nickNameText : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        //label.font = UIFont.boldSystemFont(ofSize: 21.0)
        label.textAlignment = .left
        return label
    }()
    
//    let nickNameLabel : UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        //label.font = UIFont.systemFont(ofSize: 18.0)
//        label.textAlignment = .left
//        return label
//    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(userNameText)
        contentView.addSubview(nickNameText)
        setProfileConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    @objc func editButtonTapped() {
//        editButtonDelegate?.editButtonTapped()
//    }
    
    func setProfileConstraints() {
        let constraints1 = [
            userNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
            userNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            userNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5),
            //userNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -40)
        ]
        NSLayoutConstraint.activate(constraints1)
        
        let constraints2 = [
            userNameText.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
            userNameText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
            userNameText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5),
            userNameText.leadingAnchor.constraint(equalTo: userNameLabel.trailingAnchor),
            userNameText.widthAnchor.constraint(equalTo: contentView.widthAnchor,multiplier: 0.5)
        ]
        NSLayoutConstraint.activate(constraints2)
        
        let constraints3 = [
            nickNameText.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
            nickNameText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
            nickNameText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5),
            userNameText.leadingAnchor.constraint(equalTo: userNameLabel.trailingAnchor),
            nickNameText.widthAnchor.constraint(equalTo: contentView.widthAnchor,multiplier: 0.43)
        ]
        NSLayoutConstraint.activate(constraints3)
    }
    
}
