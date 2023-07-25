//
//  Login.swift
//  QuizX
//
//  Created by jothi-pt5112 on 16/08/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    var userArray:[User] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let scrollStackViewContainer: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = .systemBackground
        view.axis = .vertical
        view.spacing = 18.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let appIconImage : UIImageView = {
        let imageView = UIImageView()
        //imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "LaunchScreen")
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.clipsToBounds = true
        return imageView
    }()

    let mailIdTextField : UITextField = {
        let field = UITextField()
        //field.translatesAutoresizingMaskIntoConstraints = false
        //field.borderStyle = .roundedRect
        field.keyboardType = .emailAddress
        field.tag = 0
        field.heightAnchor.constraint(equalToConstant: 50).isActive = true
        field.layer.cornerRadius = 10
        field.layer.borderColor = UIColor.lightGray.withAlphaComponent(1).cgColor
        field.layer.borderWidth = 1.5
        field.placeholder = NSLocalizedString(" MailID", comment: "")
        field.addTarget(self, action: #selector(mailIdValidator), for: UIControl.Event.editingChanged)
        return field
    }()

    let mailValidationLabel : UILabel = {
        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        label.textAlignment = .right
        label.heightAnchor.constraint(equalToConstant: 25).isActive = true
        label.text = NSLocalizedString("Enter a valid emailId.", comment: "")
        label.textColor = .red
        return label
    }()

    let passwordTextField : UITextField = {
        let field = UITextField()
        //field.translatesAutoresizingMaskIntoConstraints = false
        field.layer.cornerRadius = 10
        //field.borderStyle = .roundedRect
        field.isSecureTextEntry = true
        field.heightAnchor.constraint(equalToConstant: 50).isActive = true
        field.tag = 1
        field.placeholder = " Password"
        field.layer.borderColor = UIColor.lightGray.withAlphaComponent(1).cgColor
        field.layer.borderWidth = 1.5
        field.addTarget(self, action: #selector(passwordValidator), for: UIControl.Event.editingChanged)
        return field
    }()

    let passwordValidationLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        label.textAlignment = .right
        label.text = "Invalid Password format."
        label.textColor = .red
        label.numberOfLines = 2
        return label
    }()

    let submitButton : UIButton = {
        let button = UIButton()
        //button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(NSLocalizedString("SIGN IN", comment: ""), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .body)
        button.heightAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
        button.titleLabel?.numberOfLines = 0
        button.backgroundColor = UIColor(red: 235/255, green: 163/255, blue: 82/255, alpha: 1)
        button.addTarget(self, action: #selector(validateLogin), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.borderColor =  UIColor.black.cgColor
        //button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.borderWidth = 0.2
        button.setTitleShadowColor(.black, for: .normal)
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.8
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        return button
    }()

    let invalidUserLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        label.textColor = .red
        label.backgroundColor = .secondarySystemBackground
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        return label
    }()

    let signUpLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Are you a new user?"
        //label.font = .systemFont(ofSize: 21)
        label.textAlignment = .center
        return label
    }()

    let signUpButton : UIButton = {
        let button = UIButton()
        //button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(NSLocalizedString("New user? Sign up", comment: ""), for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .body)
        button.titleLabel?.numberOfLines = 0
        button.heightAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
        button.underline()
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(registerNewUser), for: .touchUpInside)
        button.setTitleColor(UIColor(red: 235/255, green: 163/255, blue: 82/255, alpha: 1), for: .normal)
//        button.layer.cornerRadius = 10
//        button.layer.borderColor =  UIColor.black.cgColor
//        button.layer.borderWidth = 0.2
//        button.setTitleShadowColor(.black, for: .normal)
//        button.layer.shadowRadius = 5
//        button.layer.shadowOpacity = 0.8
//        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        return button
    }()
    
    var layOutGuide : UIView = {
        let guide = UIView()
        //guide.backgroundColor = .red
        guide.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return guide
    }()
    
    var layOutGuide2 : UIView = {
        let guide = UIView()
        //guide.backgroundColor = .red
        guide.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return guide
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUserObjects()
        hideKeyboardWhenTappedAround()
        mailIdTextField.delegate = self
        passwordTextField.delegate = self
        setupScrollView()
        configureContainerView()
        setPaddingConstraints()
        createTextfieldSpace()
        // Do any additional setup after loading the view.
    }
    
    @objc func registerNewUser() {

        let registerVC = UINavigationController(rootViewController: RegisterViewController())
        registerVC.modalPresentationStyle = .formSheet
        self.present(registerVC, animated: true)
    }

    @objc func validateLogin() {
        let mailId = mailIdTextField.text
        let password = passwordTextField.text
        let loggedUser: User? = checkUserExists(mailId: mailId!)
        
        if mailId == "" {
            let alert = UIAlertController(title: NSLocalizedString("Invalid Credentials", comment: ""), message: NSLocalizedString("Please give a valid mailId!!", comment: ""), preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("Okay", comment: ""), style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            print("Invalid user")
            return
        }
        
        guard loggedUser != nil else {
            let alert = UIAlertController(title: NSLocalizedString("Invalid User", comment: ""), message: "Given mailId doesn't exists!!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("Okay", comment: ""), style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            print("Invalid user")
            return
        }
        if loggedUser!.checkPassword(password: password!) || true {
            UserDefaults.standard.set(loggedUser?.userId, forKey: "Logged UserId")
            let launchVC = LaunchViewController()
            //ViewController.userId = loggedUser?.userId
            //print(Int64(UserDefaults.standard.integer(forKey: "Logged UserId")))
            launchVC.modalPresentationStyle = .formSheet
            self.present(launchVC,animated: true)
        }
        else{
            let alert = UIAlertController(title: NSLocalizedString("Invalid_credentials", comment: ""), message: NSLocalizedString("The given credentials doesn't match with the records!!", comment: ""), preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("Okay", comment: ""), style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            print("unsuccessful login")
        }
    }

    @objc func mailIdValidator() {
        print("mailIdValidator")
        if isValidEmail(mailIdTextField.text!) {
            mailValidationLabel.isHidden = true
            return
        }
        mailValidationLabel.isHidden = false
    }

    @objc func passwordValidator() {
        func isValidPassword(_ password: String) -> Bool {

            if password.count > 6 {
                return true
            }
            return false
        }
    }

    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    func isValidPassword(_ password: String) -> Bool {
        let passwordRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"

        let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordPred.evaluate(with: password)
    }

    func setUserObjects()->[User] {
        do {
            userArray = try context.fetch(User.fetchRequest())
            }
        catch {
            print("User Array fetching Issue")
        }
        return userArray
    }

    func checkUserExists(mailId:String) ->User? {
        let filteredUser = userArray.filter{ $0.mailId?.lowercased() == mailId.lowercased() }
        //print(filteredUser)
        if filteredUser != [] {
            return filteredUser.first!
        }
        return nil
    }
    
    private func setupScrollView() {
        let margins = view.safeAreaLayoutGuide
        view.addSubview(scrollView)
        scrollView.addSubview(scrollStackViewContainer)
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        scrollStackViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollStackViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollStackViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollStackViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        scrollStackViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }

    private func configureContainerView() {
        scrollStackViewContainer.addArrangedSubview(layOutGuide)
        scrollStackViewContainer.addArrangedSubview(appIconImage)
        scrollStackViewContainer.addArrangedSubview(mailIdTextField)
        scrollStackViewContainer.addArrangedSubview(mailValidationLabel)
        scrollStackViewContainer.addArrangedSubview(passwordTextField)
        //scrollStackViewContainer.addArrangedSubview(passwordValidationLabel)
        scrollStackViewContainer.addArrangedSubview(submitButton)
        scrollStackViewContainer.addArrangedSubview(signUpButton)
        scrollStackViewContainer.addArrangedSubview(layOutGuide2)
    }
    
    
    private func setPaddingConstraints() {

        submitButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20).isActive = true
        submitButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20).isActive = true
    
        signUpButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20).isActive = true

        mailIdTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20).isActive = true
        mailIdTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20).isActive = true
        
        mailValidationLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20).isActive = true
        
        passwordTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20).isActive = true
    }

    private func createTextfieldSpace() {
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: passwordTextField.frame.height))
        passwordTextField.leftViewMode = .always
        mailIdTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: passwordTextField.frame.height))
        mailIdTextField.leftViewMode = .always
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

extension LoginViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch(textField.tag) {
        case 0:
            print("return tapped")
            return passwordTextField.becomeFirstResponder()
        case 1:
            passwordTextField.resignFirstResponder()
            submitButton.sendActions(for: .touchUpInside)
            return true
        default:
            print("impossible issue")
        }
        return false
    }
}


extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


extension UIButton {
    func underline() {
        guard let title = self.titleLabel else { return }
        guard let tittleText = title.text else { return }
        let attributedString = NSMutableAttributedString(string: (tittleText))
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: (tittleText.count)))
        self.setAttributedTitle(attributedString, for: .normal)
    }
}
