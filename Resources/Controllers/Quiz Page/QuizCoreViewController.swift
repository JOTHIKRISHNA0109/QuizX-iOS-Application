//
//  QuizCoreViewController.swift
//  QuizX
//
//  Created by jothi-pt5112 on 11/07/22.
//

import UIKit

class QuizCoreViewController: UIViewController {
    
    static var testIdCounter : Int = 101
    var coreObject : Category? = nil
    weak var completionDelegate : QuizCompletionDelegate? = nil
    var testObject : Test = Test()
    var responseArray : [Response] = []
    weak var invalidateTimerDelegate : TimerInvalidateDelegate?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var quizTakenArray : [QuizTaken] = []
    
    

    let coreQuizTable : UITableView = {
        let table = UITableView()
        //table.alwaysBounceVertical = false
        table.register(CustomCoreTableViewCell.self,forCellReuseIdentifier: CustomCoreTableViewCell.identifier)
        //table.isScrollEnabled = false
        table.rowHeight = UITableView.automaticDimension
        table.translatesAutoresizingMaskIntoConstraints = false
        table.clipsToBounds = true
        table.bounces = false
        table.separatorStyle = .none
        table.separatorColor = .clear
        return table
    }()

    override func viewDidLoad() {
        print("view did load")
        super.viewDidLoad()
        view.addSubview(coreQuizTable)
        //view.isMultipleTouchEnabled = false
        CustomCoreTableViewCell.currentQuestion = 0
        title = coreObject?.categoryName ?? "Loading Issue"
        //checkOrientation()
        coreQuizTable.delegate = self
        coreQuizTable.dataSource = self
        setTableConstraints()
    }
    
    func checkOrientation() {
        if checkLandscape() {
            coreQuizTable.isScrollEnabled = true
        } else {
            coreQuizTable.isScrollEnabled = false
        }
    }
    
    func generateTestObject() {
        
        testObject = Test(context: context)
        testObject.testId = Int64(QuizCoreViewController.testIdCounter)
        QuizCoreViewController.testIdCounter += 1
        testObject.sectionId = coreObject!.categoryId
        testObject.testMarks = Int64(CustomCoreTableViewCell.points)
        testObject.dateCompleted = Date()
        testObject.responses = Set(self.responseArray) as NSSet
        print("test object created")
        do {
            try context.save()
        }catch{print("Test object saving issue")}
        generateQuizTakenObject(testObject: testObject)
        
    }
    
    func generateQuizTakenObject(testObject:Test) {
        do {
            self.quizTakenArray = try context.fetch(QuizTaken.fetchRequest())
        }
        catch{print("quiz taken array fetch issue")}
        let filteredArray = quizTakenArray.filter{ $0.userId == Int64(UserDefaults.standard.integer(forKey: "Logged UserId")) }
        let quizTakenObject = filteredArray.first
        quizTakenObject!.addToTests(testObject)
        do {
            try context.save()
        }catch{print("QuizTaken object saving issue")}
        print("Quiz has been taken")
        print(quizTakenObject)
    }
    
    func setTableConstraints() {
        let constraints =
        [coreQuizTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         coreQuizTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
         coreQuizTable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
         coreQuizTable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension QuizCoreViewController : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let questions = (coreObject?.questions?.allObjects as! [Question]).sorted(by: {$0.questionId<$1.questionId})
        
            
        let cell = (coreQuizTable.dequeueReusableCell(withIdentifier: CustomCoreTableViewCell.identifier,for:indexPath) as! CustomCoreTableViewCell)
        cell.selectionStyle = .none
        cell.isMultipleTouchEnabled = true
        cell.progressSlider.isUserInteractionEnabled = false
        cell.clickedOptionDelegate = self
        print("Question number***\(CustomCoreTableViewCell.currentQuestion+1)")
        cell.questionNumberLabel.text = "\(CustomCoreTableViewCell.currentQuestion+1)/10"
        cell.configureButtons(questions:questions)
        cell.categoryTitle.text = coreObject!.categoryName
        //print("#\((questions[CustomCoreTableViewCell.currentQuestion]).correctAnswer)")
        cell.counterLabel.textColor = .label
        CustomCoreTableViewCell.currentQuestion += 1
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coreQuizTable.deselectRow(at: indexPath, animated: true)
    }
}


extension QuizCoreViewController : ClickedOption {
    
    func clickExitButton(currentQuestion:Int){
        let alert = UIAlertController(title: NSLocalizedString("Are you sure to quit", comment: ""), message: NSLocalizedString("You can't resume the quiz again", comment: ""), preferredStyle: .alert)
        let confirmButton = UIAlertAction(title: NSLocalizedString("Confirm", comment: ""), style: .default) {(action) in
            self.generateResponseObjects(currentQuestion:currentQuestion)
            self.generateTestObject()
            let cell = self.coreQuizTable.cellForRow(at: IndexPath(row: 0, section: 0)) as! CustomCoreTableViewCell
            cell.timer?.invalidate()
            self.dismiss(animated: true)
            self.completionDelegate?.presentScoreCard(points:CustomCoreTableViewCell.points,responseArray: self.responseArray,testObject:self.testObject)
            CustomCoreTableViewCell.points = 0
        }
        let cancelButton = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .default) {(action) in
                //CustomCoreTableViewCell.setTimerCredentials()
        }
        confirmButton.titleTextColor = .systemRed
        alert.addAction(cancelButton)
        alert.addAction(confirmButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    func generateResponseObjects(currentQuestion:Int) {
        var questionIdCounter = currentQuestion
        var questionNumber = (currentQuestion+1)%10
        while (questionNumber<=10) {
            print(currentQuestion)
            print(questionNumber)
            print("created")
            let responseObject = Response(context: context)
            responseObject.questionId = Int64(questionIdCounter)
            responseObject.studentAnswer = NSLocalizedString("Quited", comment: "")
            responseObject.isCorrect = false
            
            do {
                try context.save()
            }catch{print("saving issue")}
            responseArray.append(responseObject)
            
            questionIdCounter += 1
            questionNumber += 1
        }
    }
    
    
    func buttonClicked(quizCompleted: Bool,response:Response?) {
        
        if !quizCompleted {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                //print("table reloaded")
                self.responseArray.append(response!)
                //print("Points",CustomCoreTableViewCell.points)
                //CustomCoreTableViewCell.currentQuestion += 1
                print("added sync")
                self.coreQuizTable.reloadData()
            }
        }
        else{
            print("Quiz Completed")
            responseArray.append(response!)
            generateTestObject()
            CustomCoreTableViewCell.currentQuestion = 0
            self.dismiss(animated: true)
            completionDelegate?.presentScoreCard(points:CustomCoreTableViewCell.points,responseArray:responseArray,testObject:testObject)
            CustomCoreTableViewCell.points = 0
        }
        
    }
    
    func timeUp(response:Response?) {
        print("added time up")
        //CustomCoreTableViewCell.currentQuestion += 1
        response!.studentAnswer = "N/A"
        response!.isCorrect = false
        responseArray.append(response!)
        self.coreQuizTable.reloadData()
    }
    
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//
//        super.viewWillTransition(to: size, with: coordinator)
//        if size.height < size.width {
//            coreQuizTable.isScrollEnabled = true
//        } else {
//            coreQuizTable.isScrollEnabled = false
//        }
//    }
}
            
            
            
            
            
//            case 0:
//                let cell = (coreQuizTable.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier,for:indexPath) as! TitleTableViewCell)
//                cell.isUserInteractionEnabled = false
//                cell.categoryTitle.text = coreObject!.categoryName
//                return cell
//            case 1:
//                let cell = (coreQuizTable.dequeueReusableCell(withIdentifier: QuestionTableViewCell.identifier,for:indexPath) as! QuestionTableViewCell)
//                cell.isUserInteractionEnabled = false
//                cell.questionLabel.text = (questions![QuizCoreViewController.currentQuestion] as! Question).questionPhrase
//                return cell
//            case 2:
//                let cell = (coreQuizTable.dequeueReusableCell(withIdentifier: OptionsTableViewCell.identifier,for:indexPath) as! OptionsTableViewCell)
//                cell.optionAButtonTitle = (questions![QuizCoreViewController.currentQuestion] as! Question).optionA
//                cell.optionBButtonTitle = (questions![QuizCoreViewController.currentQuestion] as! Question).optionB
//                cell.optionCButtonTitle = (questions![QuizCoreViewController.currentQuestion] as! Question).optionC
//                cell.optionDButtonTitle = (questions![QuizCoreViewController.currentQuestion] as! Question).optionD
//                return cell
//            default:
//                print("")


extension TimeZone {
    static let gmt = TimeZone(secondsFromGMT: 0)!
}

extension Locale {
    static let ptBR = Locale(identifier: "pt_BR")
}

extension Formatter {
    static let date = DateFormatter()
}

extension Date {
    func localizedDescription(date dateStyle: DateFormatter.Style = .medium,
                              time timeStyle: DateFormatter.Style = .medium,
                              in timeZone: TimeZone = .current,
                              locale: Locale = .current,
                              using calendar: Calendar = .current) -> String {
        Formatter.date.calendar = calendar
        Formatter.date.locale = locale
        Formatter.date.timeZone = timeZone
        Formatter.date.dateStyle = dateStyle
        Formatter.date.timeStyle = timeStyle
        return Formatter.date.string(from: self)
    }
    var localizedDescription: String { localizedDescription() }
}

extension UIAlertAction {
    var titleTextColor: UIColor? {
        get {
            return self.value(forKey: "titleTextColor") as? UIColor
        } set {
            self.setValue(newValue, forKey: "titleTextColor")
        }
    }
}
