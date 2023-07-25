//
//  ActivityTableViewCell.swift
//  QuizX
//
//  Created by jothi-pt5112 on 19/07/22.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {
    
    static let identifier : String = "ActivityTableViewCell"
    
    let categoryImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        //imageView.layer.cornerRadius = 30
        return imageView
    }()

    var categoryLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        //label.font = UIFont.boldSystemFont(ofSize: 25.0)
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.adjustsFontForContentSizeCategory = true
        label.font = label.font.bold()
        return label
    }()
    
    let scoreView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 235/255, green: 163/255, blue: 82/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var scoreName : UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("Score", comment: "")
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var scoreLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18.0)
        return label
    }()
    
    var totalScoreLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18.0)
//        label.font = UIFont.preferredFont(forTextStyle: .title1)
//        label.adjustsFontForContentSizeCategory = true
        label.text = NSLocalizedString("Score", comment: "")
        label.textColor = .black
        return label
    }()
    
    var dateLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = NSLocalizedString("Date Completed", comment: "")
//        label.font = UIFont.italicSystemFont(ofSize: 16)
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    var dateCompleted : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(categoryImage)
        addCategoryImageConstraints()
        contentView.addSubview(categoryLabel)
        setCategoryLabelConstraints()
        contentView.addSubview(scoreView)
        setScoreViewConstraints()
        scoreView.addSubview(totalScoreLabel)
        setTotalScoreConstraints()
        scoreView.addSubview(scoreLabel)
        setScoreLabel()
        contentView.addSubview(dateLabel)
        setDateLabelConstraints()
        contentView.addSubview(dateCompleted)
        setDateCompletedConstraints()
        //contentView.bottomAnchor.constraint(equalTo: dateCompleted.bottomAnchor).isActive = true
        // Do any additional setup after loading the view.
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        scoreView.layoutIfNeeded()
//        scoreView.layer.masksToBounds = true
        scoreView.layer.cornerRadius = scoreView.frame.width / 2
        scoreView.clipsToBounds = true
    }
    
    func addCategoryImageConstraints() {
        let constraints = [
            categoryImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoryImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            categoryImage.heightAnchor.constraint(equalTo:contentView.widthAnchor,multiplier: 1/2)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setCategoryLabelConstraints() {
        let constraints = [
            categoryLabel.topAnchor.constraint(equalTo: categoryImage.bottomAnchor),
            categoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            categoryLabel.trailingAnchor.constraint(equalTo: contentView.centerXAnchor),
            categoryLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor,constant: -5)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setScoreViewConstraints() {
        let constraints = [
            scoreView.topAnchor.constraint(equalTo: topAnchor,constant:20),
            scoreView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -30),
            scoreView.widthAnchor.constraint(equalToConstant: 70),
            scoreView.heightAnchor.constraint(equalToConstant: 70)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setTotalScoreConstraints() {
        let constraints = [
            totalScoreLabel.topAnchor.constraint(equalTo: scoreView.topAnchor,constant: 15),
            totalScoreLabel.trailingAnchor.constraint(equalTo: scoreView.trailingAnchor,constant: 20),
            totalScoreLabel.widthAnchor.constraint(equalToConstant: 80)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setScoreLabel() {
        let constraints = [
            scoreLabel.topAnchor.constraint(equalTo: totalScoreLabel.bottomAnchor),
            scoreLabel.trailingAnchor.constraint(equalTo: scoreView.trailingAnchor,constant: 30),
            scoreLabel.widthAnchor.constraint(equalToConstant: 80)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setDateLabelConstraints() {
        let constraints = [
            dateLabel.topAnchor.constraint(equalTo: categoryImage.bottomAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5),
            dateLabel.leadingAnchor.constraint(equalTo:contentView.centerXAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setDateCompletedConstraints() {
        let constraints = [
            dateCompleted.topAnchor.constraint(equalTo: dateLabel.bottomAnchor),
            dateCompleted.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            dateCompleted.leadingAnchor.constraint(equalTo: contentView.centerXAnchor),
            dateCompleted.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor,constant: -5)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    
}
