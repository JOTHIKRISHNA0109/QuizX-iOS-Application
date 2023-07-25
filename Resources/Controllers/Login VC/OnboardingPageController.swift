//
//  OnboardingPageController.swift
//  QuizX
//
//  Created by jothi-pt5112 on 03/08/22.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    var imageName : String = ""
    var headLine : String = ""
    var label : String = ""
    
    init(imageName : String, headLine : String, label : String) {
        super.init(nibName: nil, bundle: nil)
        self.imageName = imageName
        self.headLine = headLine
        self.label = label
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let onboardingImage:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let onboardingHeadLine : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 235/255, green: 163/255, blue: 82/255, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 21)
        return label
    }()
    
    let onboardingLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 4
        label.font = UIFont.systemFont(ofSize: 21)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(onboardingImage)
        setOnboardingImageConstraints()
        view.addSubview(onboardingHeadLine)
        setOnboardingHeadLineConstraints()
        view.addSubview(onboardingLabel)
        setOnboardingLabelConstraints()
    onboardingImage.image = UIImage(named: imageName)
        onboardingHeadLine.text = headLine
        onboardingLabel.text = label
        // Do any additional setup after loading the view.
    }

    func setOnboardingImageConstraints() {
        var constraints = [NSLayoutConstraint]()

        constraints.append(onboardingImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 30))
        constraints.append(onboardingImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -30))
        constraints.append(onboardingImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 30))
        constraints.append(onboardingImage.heightAnchor.constraint(equalToConstant: view.frame.height/2))

        NSLayoutConstraint.activate(constraints)
    }
    
    func setOnboardingHeadLineConstraints() {
        var constraints = [NSLayoutConstraint]()

        constraints.append(onboardingHeadLine.topAnchor.constraint(equalTo: onboardingImage.bottomAnchor,constant: -90))
        constraints.append(onboardingHeadLine.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 30))
        constraints.append(onboardingHeadLine.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -30))
        constraints.append(onboardingHeadLine.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -70))

        NSLayoutConstraint.activate(constraints)
    }
    
    func setOnboardingLabelConstraints() {
        var constraints = [NSLayoutConstraint]()

        constraints.append(onboardingLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 30))
        constraints.append(onboardingLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -30))
        constraints.append(onboardingLabel.topAnchor.constraint(equalTo: onboardingHeadLine.bottomAnchor,constant: -120))

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
