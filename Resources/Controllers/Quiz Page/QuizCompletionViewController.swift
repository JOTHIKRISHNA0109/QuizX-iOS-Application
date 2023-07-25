//
//  QuizCompletionViewController.swift
//  QuizX
//
//  Created by jothi-pt5112 on 13/07/22.
//

import UIKit

class QuizCompletionViewController: UIViewController {
    
    var totalPoints:Int? = nil
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var completionString : String? = nil
    var responseArray : [Response] = []
    var testObject : Test = Test()
    
    var completionTableView : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(CompletionTableViewCell.self,forCellReuseIdentifier: CompletionTableViewCell.identifier)
        //table.rowHeight = UITableView.automaticDimension
        //table.clipsToBounds = true
        table.separatorStyle = .none
        table.separatorColor = .clear
        return table
    }()
    
    init(points:Int,completion:String,responseArray:[Response]) {
        super.init(nibName: nil, bundle: nil)
        self.totalPoints = points
        self.completionString = completion
        self.responseArray = responseArray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(completionTableView)
        setCompletionTableConstraints()
        completionTableView.delegate = self
        completionTableView.dataSource = self
    }
    
    func getCategoryName(sectionId:Int64) -> String? {
        do {
            let categoryArray = try context.fetch(Category.fetchRequest())
            let filteredObject = categoryArray.filter{ $0.categoryId == sectionId }
            print(filteredObject)
            if filteredObject != [] {
                return filteredObject.first!.categoryName
            }
        }
        catch {
            print("Quiz Taken fetching Issue")
        }
       
        return nil
    }
    
    func setCompletionTableConstraints() {

            let constraints =
            [completionTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
             completionTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
             completionTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
             completionTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
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

extension QuizCompletionViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if UIDevice.current.orientation.isLandscape {
//            //return UITableView.automaticDimension
//            return view.frame.height*2
//        }
//        return view.frame.height
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = completionTableView.dequeueReusableCell(withIdentifier: CompletionTableViewCell.identifier, for: indexPath) as! CompletionTableViewCell
        cell.selectionStyle = .none
        cell.completedLabel.text = completionString
        cell.CategoryLabel.text = (getCategoryName(sectionId: testObject.sectionId))?.uppercased()
        cell.takeToHomeDelegate = self
        setScoreMessage(cell:cell)
        cell.scoreProgress.setProgress(Float(totalPoints!)/100.0, animated: true)
        cell.accuracyPercentage.text = "\(String(describing: totalPoints!))%"
        return cell
    }
    
    func setScoreMessage(cell:CompletionTableViewCell) {
        if totalPoints! > 70 {
            //cell.scoreMessage.text = "WaHoo!! You have made it up!!\nYou have scored \(totalPoints!) out of 100!!"
            cell.scoreMessage.text = "\("above_70".localized)\(totalPoints!) \("total".localized)"
        }
        else if totalPoints! > 50 {
            //cell.scoreMessage.text = "Hurray!! Very good try!!\nYou have scored \(totalPoints!) out of 100!!"
            cell.scoreMessage.text = "\("above_50".localized) \(totalPoints!) \("total".localized)"
        }
        else {
            //cell.scoreMessage.text = "Good try!! All the best!!\nYou have scored \(totalPoints!) out of 100!!"
            cell.scoreMessage.text = "\("below_50".localized) \(totalPoints!) \("total".localized)"
        }
    }

}


extension QuizCompletionViewController: TakeToHomeDelegate {
    
    func takeToLeaderBoard() {
        let responseVC = ResponseViewController()
        let responseNavVC = UINavigationController.init(rootViewController: responseVC)
        responseNavVC.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButton))
        responseVC.categoryName = getCategoryName(sectionId: testObject.sectionId)
        responseVC.title = NSLocalizedString("Your Responses", comment: "")
        responseVC.testObject = testObject
        responseVC.responseArray = responseArray
        responseNavVC.modalPresentationStyle = .formSheet
        self.present(responseNavVC, animated: true)
    }
    
    
    func takeToHome() {
        let tabBarVC = ViewController()
        tabBarVC.modalPresentationStyle = .fullScreen
        self.present(tabBarVC, animated: true)
    }
    
    @objc func cancelButton() {
        self.dismiss(animated: true)
    }
}
