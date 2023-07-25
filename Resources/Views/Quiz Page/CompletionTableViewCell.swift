//
//  CompletionTableViewCell.swift
//  QuizX
//
//  Created by jothi-pt5112 on 14/07/22.
//

import UIKit

class CompletionTableViewCell: UITableViewCell {

    static var identifier:String = "CompletionTableViewCell"
    weak var takeToHomeDelegate : TakeToHomeDelegate? = nil
    
    var completedLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        //label.text = "You have completed the Quiz!!"
        label.textAlignment = .center
        //label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    var CategoryLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.adjustsFontForContentSizeCategory = true
        //label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    var trophyView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "trophy")
        return imageView
    }()
    
    var scoreMessage : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        return label
    }()
    
    var accuracyLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = NSLocalizedString("Accuracy", comment: "")
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.adjustsFontForContentSizeCategory = true
        //label.font = .boldSystemFont(ofSize: 25)
        return label
    }()
    
    var progressView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.backgroundColor = .secondarySystemBackground
        return view
    }()
    
    var correctLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = NSLocalizedString("Correct", comment: "")
        label.textColor = .systemGreen
        return label
    }()
    
    var inCorrectLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = NSLocalizedString("Incorrect", comment: "")
        label.textColor = .systemRed
        return label
    }()
    
    var accuracyPercentage : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.adjustsFontForContentSizeCategory = true
        //label.font = .boldSystemFont(ofSize: 25)
        label.textColor = .lightGray
        return label
    }()
    
    var scoreProgress : UIProgressView = {
        let progress = UIProgressView()
        progress.progressViewStyle = .bar
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.setProgress(0.0, animated: true)
        progress.clipsToBounds = true
        progress.layer.sublayers![0].cornerRadius = 5
        progress.subviews[0].clipsToBounds = true
        progress.layer.sublayers![1].cornerRadius = 5
        progress.subviews[1].clipsToBounds = true
        progress.trackTintColor = .systemRed
        progress.tintColor = .systemGreen
        return progress
    }()
    
    var leaderBoardButton : UIButton = {
        var button = UIButton()
        button.setTitle(NSLocalizedString("Response", comment: ""), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(red: 235/255, green: 163/255, blue: 82/255, alpha: 1)
        button.titleLabel?.font = .preferredFont(forTextStyle: .body)
        button.titleLabel?.numberOfLines = 0
//        button.title.adjustsFontForContentSizeCategory = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleShadowColor(.black, for: .normal)
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.8
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        button.layer.borderColor =  UIColor.systemBackground.cgColor
        button.addTarget(self, action: #selector(clickedLeaderBoardButton), for: .touchUpInside)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 8
        return button
    }()
    
    var homeButton : UIButton = {
        var button = UIButton()
        button.setTitle(NSLocalizedString("Home", comment: ""), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .body)
        button.backgroundColor = UIColor(red: 235/255, green: 163/255, blue: 82/255, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.numberOfLines = 0
        button.setTitleShadowColor(.black, for: .normal)
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.8
        button.addTarget(self, action: #selector(clickedHomeButton), for: .touchUpInside)
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        button.layer.borderColor =  UIColor.systemBackground.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 8
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        completedLabel.text = NSLocalizedString("You have already completed the test", comment: "")
        contentView.addSubview(completedLabel)
        addAllSubviews()
        setAllConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addAllSubviews() {
        contentView.addSubview(CategoryLabel)
        contentView.addSubview(trophyView)
        contentView.addSubview(scoreMessage)
        contentView.addSubview(accuracyLabel)
        contentView.addSubview(progressView)
        progressView.addSubview(scoreProgress)
        progressView.addSubview(correctLabel)
        progressView.addSubview(inCorrectLabel)
        contentView.addSubview(accuracyPercentage)
        contentView.addSubview(leaderBoardButton)
        contentView.addSubview(homeButton)
    }
    
    func setAllConstraints() {
        addCategoryLabelConstraints()
        setCompletedLabelConstraints()
        addTrophyViewConstraints()
        addScoreMessageConstraints()
        setAccuracyLabelConstraints()
        addProgressViewConstraints()
        setScoreProgressConstraints()
        setCorrectLabelConstraints()
        setIncorrectLabelConstraints()
        setAccuracyPercentConstraints()
        setLeaderBoardConstraints()
        setHomeButtonConstraints()
        contentView.bottomAnchor.constraint(equalTo: leaderBoardButton.bottomAnchor, constant: 20).isActive = true
    }
    
    @objc func clickedHomeButton() {
        takeToHomeDelegate!.takeToHome()
    }
    
    @objc func clickedLeaderBoardButton() {
        takeToHomeDelegate!.takeToLeaderBoard()
    }
    
    func addCategoryLabelConstraints() {
        let constraints = [
            CategoryLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            CategoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            CategoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
            //CategoryLabel.heightAnchor.constraint(equalToConstant: 70)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setCompletedLabelConstraints() {
        let constraints = [
            completedLabel.topAnchor.constraint(equalTo: CategoryLabel.bottomAnchor,constant: 20),
            completedLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            completedLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
            //completedLabel.heightAnchor.constraint(equalToConstant: 50)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func addTrophyViewConstraints() {
        let constraints = [
            trophyView.topAnchor.constraint(equalTo: completedLabel.bottomAnchor,constant: -90),
            trophyView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            trophyView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20)
            //trophyView.heightAnchor.constraint(equalToConstant: 100)
            //trophyView.heightAnchor.constraint(equalTo:contentView.heightAnchor,multiplier: 0.5)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func addScoreMessageConstraints() {
        let constraints = [
            scoreMessage.topAnchor.constraint(equalTo: trophyView.bottomAnchor,constant: -90),
            scoreMessage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            scoreMessage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
            //scoreMessage.heightAnchor.constraint(equalToConstant: 60)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setAccuracyLabelConstraints() {
        let constraints = [
            accuracyLabel.topAnchor.constraint(equalTo: scoreMessage.bottomAnchor,constant: 20),
            accuracyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 25),
            //accuracyLabel.heightAnchor.constraint(equalToConstant: 60)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func addProgressViewConstraints() {
        let constraints = [
            progressView.topAnchor.constraint(equalTo: accuracyLabel.bottomAnchor,constant: 10),
            progressView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            progressView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
            progressView.heightAnchor.constraint(equalToConstant: 80)
        ]
        NSLayoutConstraint.activate(constraints)
    }
     
    func setScoreProgressConstraints() {
        let constraints = [
            scoreProgress.topAnchor.constraint(equalTo: progressView.topAnchor,constant: 27),
            scoreProgress.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 40),
            scoreProgress.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -40),
            scoreProgress.heightAnchor.constraint(equalToConstant: 10)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setCorrectLabelConstraints() {
        let constraints = [
            correctLabel.topAnchor.constraint(equalTo: scoreProgress.bottomAnchor,constant: 5),
            correctLabel.leadingAnchor.constraint(equalTo: progressView.leadingAnchor,constant: 20),
            correctLabel.trailingAnchor.constraint(equalTo: progressView.trailingAnchor,constant: -20),
            //correctLabel.heightAnchor.constraint(equalToConstant: 30)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setIncorrectLabelConstraints() {
        let constraints = [
            inCorrectLabel.topAnchor.constraint(equalTo: scoreProgress.bottomAnchor,constant: 5),
            inCorrectLabel.trailingAnchor.constraint(equalTo: progressView.trailingAnchor,constant: -30),
            //inCorrectLabel.heightAnchor.constraint(equalToConstant: 30)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setAccuracyPercentConstraints() {
        let constraints = [
            accuracyPercentage.topAnchor.constraint(equalTo: scoreMessage.bottomAnchor),
            accuracyPercentage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -30),
            accuracyPercentage.heightAnchor.constraint(equalToConstant: 70),
            //accuracyPercentage.widthAnchor.constraint(equalToConstant: 70)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setLeaderBoardConstraints() {
        let constraints = [
            leaderBoardButton.topAnchor.constraint(equalTo: scoreProgress.bottomAnchor,constant: 70),
            leaderBoardButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 30),
            leaderBoardButton.widthAnchor.constraint(equalToConstant: 140)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setHomeButtonConstraints() {
        let constraints = [
            homeButton.topAnchor.constraint(equalTo: scoreProgress.bottomAnchor,constant: 70),
            homeButton.widthAnchor.constraint(equalToConstant: 140),
            homeButton.leadingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -170)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
}
