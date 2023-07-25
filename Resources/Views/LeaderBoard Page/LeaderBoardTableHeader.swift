//
//  LeaderBoardTableHeader.swift
//  QuizX
//
//  Created by jothi-pt5112 on 26/07/22.
//

import UIKit

class LeaderBoardTableHeader: UITableViewCell {
    
    static let identifier = "LeaderBoardTableHeader"
    
    var rankLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.text = NSLocalizedString("Rank", comment: "")
        return label
    }()
    
    var userNickNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.text = NSLocalizedString("Nick Name", comment: "")
        return label
    }()
    
    var pointsLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.text = "Trivia Points"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //backgroundColor = UIColor(red: 235/255, green: 163/255, blue: 82/255, alpha: 1)
        backgroundColor = UIColor(red: 235/255, green: 163/255, blue: 82/255, alpha: 1)
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
        NSLayoutConstraint.activate(rankConstraints)
        NSLayoutConstraint.activate(userNameConstraints)
        NSLayoutConstraint.activate(pointsConstraints)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
