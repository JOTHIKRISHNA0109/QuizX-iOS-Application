//
//  LeaderBoardTableViewCell.swift
//  QuizX
//
//  Created by jothi-pt5112 on 26/07/22.
//

import UIKit

class LeaderBoardTableViewCell: UITableViewCell {

    static let identifier : String = "LeaderBoardTableViewCell"
    
    var rankLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 2
        return label
    }()
    
    var userNickNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        return label
    }()
    
    var pointsLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //backgroundColor = UIColor(red: 235/255, green: 163/255, blue: 82/255, alpha: 1)
        contentView.addSubview(rankLabel)
        contentView.addSubview(userNickNameLabel)
        contentView.addSubview(pointsLabel)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        let rankConstraints = [
            rankLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            rankLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            rankLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -10),
            rankLabel.widthAnchor.constraint(equalTo:contentView.widthAnchor,multiplier: 1/3,constant: -10)
        ]
        let userNameConstraints = [
            userNickNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            userNickNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            userNickNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -10),
            userNickNameLabel.widthAnchor.constraint(equalTo:contentView.widthAnchor,multiplier: 1/3)
            //userNickNameLabel.widthAnchor.constraint(equalToConstant: 160)
        ]
        let pointsConstraints = [
            pointsLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            pointsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10),
            pointsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -10),
            pointsLabel.widthAnchor.constraint(equalTo:contentView.widthAnchor,multiplier: 1/3,constant: -10)
            //pointsLabel.widthAnchor.constraint(equalToConstant: 120)
        ]
//        let rankConstraints = [
//            rankLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
//            rankLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
//            rankLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -10)
//        ]
//        let userNameConstraints = [
//            userNickNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
//            userNickNameLabel.leadingAnchor.constraint(equalTo: rankLabel.leadingAnchor,constant: 70),
//            userNickNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -10)
//            //userNickNameLabel.widthAnchor.constraint(equalToConstant: 160)
//        ]
//        let pointsConstraints = [
//            pointsLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
//            pointsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10),
//            pointsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -10)
//            //pointsLabel.widthAnchor.constraint(equalToConstant: 120)
//        ]
        NSLayoutConstraint.activate(rankConstraints)
        NSLayoutConstraint.activate(userNameConstraints)
        NSLayoutConstraint.activate(pointsConstraints)
    }
    

}
