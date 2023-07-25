//
//  ResponseTableViewCell.swift
//  QuizX
//
//  Created by jothi-pt5112 on 25/07/22.
//

import UIKit

class ResponseTableViewCell: UITableViewCell {

    static let identifier = "ResponseTableViewCell"
    var questionLabel : UILabel? = nil
    
    var questionNumberLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        return label
    }()
    
    var yourAnswerLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.text = NSLocalizedString("Your Answer:", comment: "")
        return label
    }()
    
    var answerLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        return label
    }()
    
    var evaluationLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(questionNumberLabel)
        contentView.addSubview(yourAnswerLabel)
        contentView.addSubview(answerLabel)
        contentView.addSubview(evaluationLabel)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        let questionNumberConstraints = [
            questionNumberLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            questionNumberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            questionNumberLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10)
        ]
        
        let answerConstraints = [
            yourAnswerLabel.topAnchor.constraint(equalTo: questionNumberLabel.bottomAnchor,constant: 10),
            yourAnswerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            //yourAnswerLabel.widthAnchor.constraint(equalToConstant: 100)
        ]
        let yourAnswerConstraints = [
            answerLabel.topAnchor.constraint(equalTo: yourAnswerLabel.bottomAnchor),
            answerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            answerLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -10)
        ]
        let answerStatusConstraints = [
            evaluationLabel.topAnchor.constraint(equalTo: questionNumberLabel.bottomAnchor,constant: 10),
            evaluationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10),
            evaluationLabel.widthAnchor.constraint(equalToConstant: 90),
            evaluationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -10)
        ]
        
        NSLayoutConstraint.activate(questionNumberConstraints)
        NSLayoutConstraint.activate(answerConstraints)
        NSLayoutConstraint.activate(yourAnswerConstraints)
        NSLayoutConstraint.activate(answerStatusConstraints)
    }
    
}
