//
//  OnboardingViewController.swift
//  QuizX
//
//  Created by jothi-pt5112 on 03/08/22.
//

import UIKit

class OnboardingPageController: UIPageViewController {
    
    var pages : [UIViewController] = []
    let pageControl = UIPageControl()
    let nextButton = UIButton()
    
    var nextButtonTopAnchor : NSLayoutConstraint?
    var pageControlBottomAnchor : NSLayoutConstraint?
    
    var initialPage : Int = 0
    
    var orientations = UIInterfaceOrientationMask.portrait
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        get { return self.orientations }
        set { self.orientations = newValue }
    }
    
    let loginButton : UIButton = {
        let button = UIButton()
        button.setTitle(NSLocalizedString("Let's get started", comment: ""), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.isHidden = true
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.8
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        button.backgroundColor = UIColor(red: 235/255, green: 163/255, blue: 82/255, alpha: 1)
        button.layer.borderColor =  UIColor.systemBackground.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 8
        return button
    }()
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: .none)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loginButton)
        setLoginButtonConstraints()
        pageControl.addTarget(self, action: #selector(pageControlTapped), for: .valueChanged)
        let onboardingVC1 = OnboardingViewController(imageName: "1st", headLine: NSLocalizedString("Take Your Favorite Quiz.", comment: ""), label: NSLocalizedString("Everyone has their own favorites and pick your own to explore.", comment: ""))
        let onboardingVC2 = OnboardingViewController(imageName: "2nd", headLine: NSLocalizedString("Get your scores instantly.", comment: ""), label: NSLocalizedString("View your test scores as quick as the test gets done.", comment: ""))
        let onboardingVC3 = OnboardingViewController(imageName: "3rd", headLine: NSLocalizedString("Challenge your peers.", comment: ""), label: NSLocalizedString("Have a healthy and a productive competion with your peers, thereby making learning more fun.", comment: ""))
        //let onboardingVC4 = LoginViewController()
        
        
        pages = [onboardingVC1,onboardingVC2,onboardingVC3]
        setViewControllers([pages[initialPage]], direction: .forward, animated: true)
        setButtonConstraints()
        delegate = self
        dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    @objc func loginButtonTapped() {
        let loginVC = LoginViewController()
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: true)
    }
    
    func setButtonConstraints() {
        view.addSubview(nextButton)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        //skipButton.addTarget(self, action: #selector(skipButtonTapped), for: .normal)
        view.addSubview(pageControl)
        nextButton.setTitle(NSLocalizedString("Next", comment: ""), for: .normal)
        nextButton.setTitleColor(UIColor(red: 235/255, green: 163/255, blue: 82/255, alpha: 1), for: .normal)
        pageControl.tintColor = .yellow
        pageControl.currentPageIndicatorTintColor = .label
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = initialPage
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    pageControl.widthAnchor.constraint(equalTo: view.widthAnchor),
                    pageControl.heightAnchor.constraint(equalToConstant: 20),
                    pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    view.trailingAnchor.constraint(equalToSystemSpacingAfter: nextButton.trailingAnchor, multiplier: 2),
                ])
                
        pageControlBottomAnchor = view.bottomAnchor.constraint(equalToSystemSpacingBelow: pageControl.bottomAnchor, multiplier: 10)
                nextButtonTopAnchor = nextButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2)
                
        pageControlBottomAnchor?.isActive = true
        nextButtonTopAnchor?.isActive = true
        
        
    }
    
    func setLoginButtonConstraints() {
        let constraints = [
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -50),
            loginButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 40),
            loginButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -40)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func pageControlTapped(_ sender : UIPageControl) {
        setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true)
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


extension OnboardingPageController : UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        if currentIndex != 0 {
           return pages[currentIndex-1]
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        if currentIndex < pages.count-1 {
           return pages[currentIndex+1]
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else {return }
        
        pageControl.currentPage = currentIndex
        hideButtonsForLastPage()
    }
    
    func hideButtonsForLastPage() {
        if (pageControl.currentPage) == pages.count-1 {
            nextButton.isHidden = true
            loginButton.isHidden = false
            pageControl.isHidden = true
        }
        else {
            nextButton.isHidden = false
            loginButton.isHidden = true
            pageControl.isHidden = false
        }
    }
    
    @objc func nextButtonTapped() {
        pageControl.currentPage += 1
        forwardPage()
        hideButtonsForLastPage()
    }
    
    @objc func skipButtonTapped() {
        pageControl.currentPage = pages.count-1
        //goToLastPage()
        hideButtonsForLastPage()
    }
    
}

extension UIPageViewController {
    
    func forwardPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        if let currentViewController = viewControllers?[0] {
            if let nextPage = dataSource?.pageViewController(self, viewControllerAfter: currentViewController) {
                    setViewControllers([nextPage], direction: .forward, animated: animated, completion: completion)
            }
        }
    }
    
    func getToLastPage (index: Int = 3, ofViewControllers pages: [UIViewController]) {
        setViewControllers([pages[index]], direction: .forward, animated: true,completion: nil)
    }
}
