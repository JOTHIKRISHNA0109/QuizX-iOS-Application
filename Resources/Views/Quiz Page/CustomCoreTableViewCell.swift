//
//  CustomCoreTableViewCell.swift
//  QuizX
//
//  Created by jothi-pt5112 on 11/07/22.
//

import UIKit
import AVFoundation

class CustomCoreTableViewCell: UITableViewCell {

    static let identifier:String = "CustomCoreTableViewCell"
    let generator = UINotificationFeedbackGenerator()
    static var currentQuestion:Int = 0
    static var points:Int = 0
    lazy var responseObject: Response? = nil
    weak var clickedOptionDelegate:ClickedOption? = nil
    static var questionId:Int? = nil
    var correctAnswer:String? = nil
    var counter = 30
    var timer : Timer? = Timer()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var exitQuizButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(NSLocalizedString("Exit", comment: ""), for: .normal)
        button.isUserInteractionEnabled = true
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(red: 235/255, green: 163/255, blue: 82/255, alpha: 1)
//        button.layer.borderColor = UIColor.black.cgColor
//        button.layer.borderWidth = 1
        button.layer.cornerRadius = 8
        return button
    }()
    @objc func buttonTapped(){
        print("Clicked")
    }
    let categoryTitle : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.font = .boldSystemFont(ofSize: 25)
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    let questionNumberLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.font = .boldSystemFont(ofSize: 22)
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.text = "\(CustomCoreTableViewCell.currentQuestion+1)/10"
        label.backgroundColor = .systemPurple
        label.textAlignment = .center
        label.layer.cornerRadius = 40
        return label
    }()
    
    let progressSlider : UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.layer.cornerRadius = 20
        slider.setValue(0.0, animated: true)
        slider.setThumbImage(UIImage(named: "stars"), for: .normal)
        slider.layer.cornerRadius = 20
        slider.tintColor = .systemPurple
        return slider
    }()
    
    let countDownImage:UIView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let counterLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 28)
//        label.font = UIFont.preferredFont(forTextStyle: .title3)
//        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        return label
    }()
    
    var questionLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 10
//        label.font = label.font.withSize(20)
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    var optionAButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isExclusiveTouch = true
        button.addTarget(self, action: #selector(optionAClicked), for: .touchUpInside)
        //button.titleLabel?.font = .systemFont(ofSize: 22)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    var optionBButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isExclusiveTouch = true
        button.addTarget(self, action: #selector(optionBClicked), for: .touchUpInside)
        //button.titleLabel?.font = .systemFont(ofSize: 22)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    var optionCButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isExclusiveTouch = true
        button.addTarget(self, action: #selector(optionCClicked), for: .touchUpInside)
        //button.titleLabel?.font = .systemFont(ofSize: 22)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    var optionDButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isExclusiveTouch = true
        button.addTarget(self, action: #selector(optionDClicked), for: .touchUpInside)
//        button.titleLabel?.font = .systemFont(ofSize: 22)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(exitQuizButton)
        setExitQuizButtonConstraints()
        contentView.addSubview(questionNumberLabel)
        setQuestionNumberConstraints()
        contentView.addSubview(progressSlider)
        setProgressViewConstraints()
        contentView.addSubview(categoryTitle)
        addTitleConstraints()
        contentView.addSubview(countDownImage)
        setCountDownImageConstraints()
        setTimerLayers()
        setTimerCredentials()
        countDownImage.layer.addSublayer(bgShapeLayer)
        countDownImage.layer.addSublayer(timeLeftShapeLayer)
        countDownImage.addSubview(counterLabel)
        setCounterConstraints()
        contentView.addSubview(questionLabel)
        setQuestionLabelConstraints()
        contentView.addSubview(optionAButton)
        contentView.addSubview(optionBButton)
        contentView.addSubview(optionCButton)
        contentView.addSubview(optionDButton)
        addOptionButtonConstraints()
        setHeightConstraints()
        exitQuizButton.addTarget(self, action: #selector(exitQuizTapped), for: .touchUpInside)

        NotificationCenter.default.addObserver(self, selector: #selector(preferredContentSizeChanged(_:)), name: UIContentSizeCategory.didChangeNotification, object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        drawBgShape()
        drawTimeLeftShape()
    }
    
    @objc func preferredContentSizeChanged(_ notification: Notification) {
        timer?.invalidate()
    }
    
    func setTimerCredentials() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    
    @objc func exitQuizTapped() {
        print("exitQuizTapped")
        generator.notificationOccurred(.warning)
        clickedOptionDelegate?.clickExitButton(currentQuestion: CustomCoreTableViewCell.questionId!)
    }

//    static func invalidateTimer() {
//        timer?.invalidate()
//    }
    
    func generateResponseObject(userAnswer:String,questionId:Int,isCorrect:Bool) {
        
        let responseObject = Response(context: context)
        responseObject.questionId = Int64(questionId)
        responseObject.studentAnswer = userAnswer
        responseObject.isCorrect = isCorrect
        
        self.responseObject = responseObject
        
        do {
            try context.save()
        }catch{print("Response object saving issue")}
        
        print("Response object created")
        
    }
    
    func setTimerLayers() {
        strokeIt.fromValue = 0
        strokeIt.toValue = 1
        strokeIt.duration = CFTimeInterval(counter)
        timeLeftShapeLayer.add(strokeIt, forKey: nil)
    }
    
    func setHeightConstraints() {
//        let constraint = contentView.heightAnchor.constraint(equalToConstant: 800)
//        constraint.priority = UILayoutPriority(999)
//        constraint.isActive = true
        contentView.bottomAnchor.constraint(equalTo: optionDButton.bottomAnchor,constant: 20).isActive = true
    }
    
    
    func configureButtons(questions:[Question]) {
        optionAButton.isEnabled = true
        optionBButton.isEnabled = true
        optionCButton.isEnabled = true
        optionDButton.isEnabled = true
        
        optionAButton.backgroundColor = UIColor(red: 235/255, green: 163/255, blue: 82/255, alpha: 1)
        optionBButton.backgroundColor = UIColor(red: 235/255, green: 163/255, blue: 82/255, alpha: 1)
        optionCButton.backgroundColor = UIColor(red: 235/255, green: 163/255, blue: 82/255, alpha: 1)
        optionDButton.backgroundColor = UIColor(red: 235/255, green: 163/255, blue: 82/255, alpha: 1)
        
        questionLabel.text = (questions[CustomCoreTableViewCell.currentQuestion] ).questionPhrase
        CustomCoreTableViewCell.questionId = Int((questions[CustomCoreTableViewCell.currentQuestion]).questionId)
        correctAnswer = (questions[CustomCoreTableViewCell.currentQuestion]).correctAnswer
        optionAButton.setTitle((questions[CustomCoreTableViewCell.currentQuestion]).optionA, for: .normal)
        optionBButton.setTitle((questions[CustomCoreTableViewCell.currentQuestion]).optionB, for: .normal)
        optionCButton.setTitle((questions[CustomCoreTableViewCell.currentQuestion]).optionC, for: .normal)
        optionDButton.setTitle((questions[CustomCoreTableViewCell.currentQuestion]).optionD, for: .normal)
    }
    
    
    func setExitQuizButtonConstraints() {
        let constraints = [
            exitQuizButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            exitQuizButton.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 25),
            //exitQuizButton.heightAnchor.constraint(equalToConstant: 40),
            exitQuizButton.widthAnchor.constraint(equalToConstant: 60)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setQuestionNumberConstraints() {
        let constraints = [
            questionNumberLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
            questionNumberLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 25),
            //questionNumberLabel.heightAnchor.constraint(equalToConstant: 40),
            //questionNumberLabel.widthAnchor.constraint(equalToConstant: 60)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setProgressViewConstraints() {
        let constraints = [
            //progressSlider.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            progressSlider.widthAnchor.constraint(equalToConstant: contentView.frame.width),
            progressSlider.topAnchor.constraint(equalTo: exitQuizButton.bottomAnchor,constant: 80),
            progressSlider.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            progressSlider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -100)
//            progressSlider.heightAnchor.constraint(equalToConstant: contentView.frame.width/3)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func addTitleConstraints() {
        let constraints = [
            categoryTitle.leadingAnchor.constraint(equalTo: exitQuizButton.trailingAnchor,constant: -30),
            categoryTitle.trailingAnchor.constraint(equalTo: questionNumberLabel.leadingAnchor,constant: 30),
            //categoryTitle.widthAnchor.constraint(equalToConstant: 300),
            //categoryTitle.centerYAnchor.constraint(equalTo: exitQuizButton.centerYAnchor)
            categoryTitle.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 20)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setCountDownImageConstraints() {
        
        let constraints = [
            countDownImage.topAnchor.constraint(equalTo: progressSlider.topAnchor,constant: -10),
            countDownImage.widthAnchor.constraint(equalToConstant: 70),
            countDownImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
            countDownImage.heightAnchor.constraint(equalToConstant: 70)
        ]
        NSLayoutConstraint.activate(constraints)
        
    }
    
    func setCounterConstraints() {
        
        let constraints = [
            counterLabel.topAnchor.constraint(equalTo: countDownImage.topAnchor,constant: 22),
            counterLabel.leadingAnchor.constraint(equalTo: countDownImage.leadingAnchor,constant: 5),
            counterLabel.trailingAnchor.constraint(equalTo: countDownImage.trailingAnchor,constant: -5),
            counterLabel.heightAnchor.constraint(equalToConstant: 30)
        ]
        NSLayoutConstraint.activate(constraints)
        
    }
        
    func setQuestionLabelConstraints() {

        let constraints = [
            questionLabel.topAnchor.constraint(equalTo: progressSlider.bottomAnchor,constant: 60),
            questionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            questionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
            //questionLabel.heightAnchor.constraint(equalToConstant: 80)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    
    @objc func updateCounter() {

        if counter > -1 {
            DispatchQueue.global(qos:.background).async {
                print("\(self.counter) seconds to the end of the world")
                self.counter -= 1
                DispatchQueue.main.async {
                    if self.counter<5 {
                        self.counterLabel.textColor = .red
                    }
                    self.counterLabel.text = String(self.counter+1)
                }
            }
        }
        else {
            counter = 30
            setTimerLayers()
            //playSound(audioName: "")
            progressSlider.value += 0.1
            let responseObject = Response(context: context)
            responseObject.questionId = Int64(CustomCoreTableViewCell.questionId!)
            responseObject.studentAnswer = "N/A"
            responseObject.isCorrect = false
            if CustomCoreTableViewCell.currentQuestion == 10 {
                clickedOptionDelegate?.buttonClicked(quizCompleted:true, response: responseObject)
                timer?.invalidate()
            }
            else {
                clickedOptionDelegate?.timeUp(response:responseObject)
            }
            //questionNumberLabel.text = "\(CustomCoreTableViewCell.currentQuestion+1)/10"
        }
    }
    
    @objc func optionAClicked() {
        
        prepareTimerAndProgress()
        print(optionAButton.currentTitle!)
        //write this method in test/result class after handling user
        if validateUserAnswer(userAnswer: optionAButton.currentTitle!) {
            CustomCoreTableViewCell.points += 10
            optionAButton.backgroundColor = .systemGreen
            generator.notificationOccurred(.success)
        }
        else {
            optionAButton.backgroundColor = .systemRed
            generator.notificationOccurred(.warning)
        }
        checkQuizCompleted()
        //questionNumberLabel.text = "\(CustomCoreTableViewCell.currentQuestion+1)/10"
    }
    
    @objc func optionBClicked() {

        prepareTimerAndProgress()
        print(optionBButton.currentTitle!)
        //write this method in test/result class after handling user
        if validateUserAnswer(userAnswer: optionBButton.currentTitle!) {
            CustomCoreTableViewCell.points += 10
            optionBButton.backgroundColor = .systemGreen
            generator.notificationOccurred(.success)
        }
        else {
            optionBButton.backgroundColor = .systemRed
            generator.notificationOccurred(.warning)
        }
        checkQuizCompleted()
        //questionNumberLabel.text = "\(CustomCoreTableViewCell.currentQuestion+1)/10"
    }
    
    @objc func optionCClicked() {
        
        prepareTimerAndProgress()
        print(optionCButton.currentTitle!)
        //write this method in test/result class after handling user
        if validateUserAnswer(userAnswer: optionCButton.currentTitle!) {
            CustomCoreTableViewCell.points += 10
            optionCButton.backgroundColor = .systemGreen
            generator.notificationOccurred(.success)
        }
        else {
            optionCButton.backgroundColor = .systemRed
            generator.notificationOccurred(.warning)
        }
        checkQuizCompleted()
        //questionNumberLabel.text = "\(CustomCoreTableViewCell.currentQuestion+1)/10"
    }
    
    @objc func optionDClicked() {
        
        prepareTimerAndProgress()
        print(optionDButton.currentTitle!)
        //write this method in test/result class after handling user
        if validateUserAnswer(userAnswer: optionDButton.currentTitle!) {
            CustomCoreTableViewCell.points += 10
            optionDButton.backgroundColor = .systemGreen
            generator.notificationOccurred(.success)
        }
        else {
            optionDButton.backgroundColor = .systemRed
            generator.notificationOccurred(.warning)
        }
        checkQuizCompleted()
        //questionNumberLabel.text = "\(CustomCoreTableViewCell.currentQuestion+1)/10"
    }
    
    func prepareTimerAndProgress() {
        
        optionAButton.isEnabled = false
        optionBButton.isEnabled = false
        optionCButton.isEnabled = false
        optionDButton.isEnabled = false
        //questionNumberLabel.text = "\(CustomCoreTableViewCell.currentQuestion+1)/10"
        counter = 30
        progressSlider.value += 0.1
        setTimerLayers()
        
        
    }
    
    func validateUserAnswer(userAnswer: String)->Bool {
        ////////IMPORTANT : Write this method in its appropriate space
        
        if userAnswer.lowercased() == correctAnswer?.lowercased() {
            generateResponseObject(userAnswer:userAnswer,questionId:CustomCoreTableViewCell.questionId!,isCorrect:true)
            playSound(audioName: "correctAnswer")
            return true
        }
        generateResponseObject(userAnswer:userAnswer,questionId:CustomCoreTableViewCell.questionId!,isCorrect:false)
        playSound(audioName: "wrongAnswer")
        return false
    }
    
    func checkQuizCompleted() {
        if CustomCoreTableViewCell.currentQuestion == (MockDataManager.numberOfQuestionsPerSection) {
            clickedOptionDelegate?.buttonClicked(quizCompleted:true, response: responseObject)
            timer?.invalidate()
        }
        else{
            clickedOptionDelegate?.buttonClicked(quizCompleted:false, response: responseObject)
        }
    }
    
    
    func addOptionButtonConstraints() {
        
        let constraints1 = [
            optionAButton.topAnchor.constraint(equalTo: questionLabel.bottomAnchor,constant: 60),
            optionAButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            optionAButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            optionAButton.heightAnchor.constraint(equalToConstant: 60)
        ]
        NSLayoutConstraint.activate(constraints1)
        
        let constraints2 = [
            optionBButton.topAnchor.constraint(equalTo: optionAButton.bottomAnchor,constant: 20),
            optionBButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            optionBButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            optionBButton.heightAnchor.constraint(equalToConstant: 60)
        ]
        NSLayoutConstraint.activate(constraints2)
        
        let constraints3 = [
            optionCButton.topAnchor.constraint(equalTo: optionBButton.bottomAnchor,constant: 20),
            optionCButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            optionCButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            optionCButton.heightAnchor.constraint(equalToConstant: 60)
        ]
        NSLayoutConstraint.activate(constraints3)
        
        let constraints4 = [
            optionDButton.topAnchor.constraint(equalTo: optionCButton.bottomAnchor,constant: 20),
            optionDButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            optionDButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            optionDButton.heightAnchor.constraint(equalToConstant: 60)
        ]
        NSLayoutConstraint.activate(constraints4)
    }
    

    var player: AVAudioPlayer?

    func playSound(audioName:String) {
        
        let urlString = Bundle.main.path(forResource: audioName, ofType: "mp3")

        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setCategory(.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            guard let urlString = urlString else {
                return
            }
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
            player?.play()

        } catch{print("audio error")}
    }
    
    let timeLeftShapeLayer = CAShapeLayer()
    let bgShapeLayer = CAShapeLayer()
    var timeLabel =  UILabel()
    let strokeIt = CABasicAnimation(keyPath: "strokeEnd")
    
    func drawBgShape() {

        bgShapeLayer.path = UIBezierPath(arcCenter: CGPoint(x: countDownImage.bounds.midX , y: countDownImage.bounds.midY), radius:
            30, startAngle: -90.degreesToRadians, endAngle: 270.degreesToRadians, clockwise: true).cgPath
        bgShapeLayer.strokeColor = UIColor.systemGray.cgColor
        bgShapeLayer.fillColor = UIColor.clear.cgColor
        bgShapeLayer.lineWidth = 5
    }
    
    func drawTimeLeftShape() {
        
        timeLeftShapeLayer.path = UIBezierPath(arcCenter: CGPoint(x: countDownImage.bounds.midX , y: countDownImage.bounds.midY), radius:
            30, startAngle: -90.degreesToRadians, endAngle: 270.degreesToRadians, clockwise: true).cgPath
        timeLeftShapeLayer.strokeColor = UIColor.systemPurple.cgColor
        timeLeftShapeLayer.fillColor = UIColor.clear.cgColor
        timeLeftShapeLayer.lineWidth = 5
    }
    
}

extension CustomCoreTableViewCell : TimerInvalidateDelegate {
    
    func invalidateTimer() {
        timer?.invalidate()
    }
    
    
}

extension Int {
    var degreesToRadians : CGFloat {
        return CGFloat(self) * .pi / 180
    }

}
