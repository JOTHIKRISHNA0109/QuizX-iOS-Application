//
//  SubjectTableViewCell.swift
//  QuizX
//
//  Created by jothi-pt5112 on 06/07/22.
//

import UIKit

class SubjectTableViewCell: UITableViewCell {

    static let identifier:String = "SubjectTableViewCell"
    
    static let categoryTitle : UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.adjustsFontForContentSizeCategory = true
        label.font = label.font.bold()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var difficultyLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = NSLocalizedString("Medium", comment: "")
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        label.textColor = .black
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        label.backgroundColor = .systemPurple
        return label
    }()
    
    var lineSeperator : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBackground
        contentView.addSubview(SubjectTableViewCell.categoryTitle)
        setCategoryTitleConstraints()
        contentView.addSubview(difficultyLabel)
        setDifficultyLabelConstraints()
        contentView.bottomAnchor.constraint(equalTo: difficultyLabel.bottomAnchor).isActive = true
//        let constraint = contentView.heightAnchor.constraint(equalToConstant: 100)
//        constraint.priority = UILayoutPriority(999)
//        constraint.isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(title:String) {
        SubjectTableViewCell.categoryTitle.text = title
    }
    
    func setCategoryTitleConstraints() {
        let constraints = [
            SubjectTableViewCell.categoryTitle.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            SubjectTableViewCell.categoryTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -30),
            SubjectTableViewCell.categoryTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setDifficultyLabelConstraints() {
        let constraints = [
            difficultyLabel.topAnchor.constraint(equalTo: SubjectTableViewCell.categoryTitle.bottomAnchor),
            //difficultyLabel.widthAnchor.constraint(equalToConstant: 80),
            difficultyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            //difficultyLabel.heightAnchor.constraint(equalToConstant: 20)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setLineSperatorConstraints() {
        let constraints = [
            lineSeperator.topAnchor.constraint(equalTo: difficultyLabel.bottomAnchor,constant: 20),
            lineSeperator.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            lineSeperator.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            lineSeperator.heightAnchor.constraint(equalToConstant: 1)
        ]
        NSLayoutConstraint.activate(constraints)
    }


}
