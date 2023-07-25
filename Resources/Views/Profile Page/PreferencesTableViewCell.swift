//
//  PreferencesTableViewCell.swift
//  QuizX
//
//  Created by jothi-pt5112 on 27/07/22.
//

enum AppTheme : Int{
    case unspecified = 0
    case light = 1
    case dark = 2
    
    var uiInterfaceStyle : UIUserInterfaceStyle {
        switch self {
        case .unspecified:
            return .unspecified
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
}


import UIKit

class PreferencesTableViewCell: UITableViewCell {

    static let identifier : String = "PreferencesTableViewCell"

    var preferenceLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.textAlignment = .left
        //label.textAlignment = .left
        return label
    }()
    
    var appearanceSegmentation : UISegmentedControl = {
        let segmented = UISegmentedControl(items: ["Auto","Light","Dark"])
        segmented.translatesAutoresizingMaskIntoConstraints = false
        segmented.addTarget(self, action: #selector(themeChange), for: .valueChanged)
        //segmented.backgroundColor = .systemBackground
        segmented.selectedSegmentIndex = 0
        segmented.isHidden = true
        return segmented
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(preferenceLabel)
        contentView.addSubview(appearanceSegmentation)
        setPreferenceLabelConstraints()
        // Do any additional setup after loading the view.
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func themeChange() {
        if appearanceSegmentation.selectedSegmentIndex == 0 {
            window!.overrideUserInterfaceStyle = .unspecified
            UserDefaults.standard.set(AppTheme.unspecified.rawValue, forKey: "appTheme")
        }
        else if appearanceSegmentation.selectedSegmentIndex == 1 {
            window!.overrideUserInterfaceStyle = .light
            UserDefaults.standard.set(AppTheme.light.rawValue, forKey: "appTheme")
        }
        else {
            window!.overrideUserInterfaceStyle = .dark
            UserDefaults.standard.set(AppTheme.dark.rawValue, forKey: "appTheme")
        }
    }
    
    func setPreferenceLabelConstraints() {
        
        let constraints2 = [
            appearanceSegmentation.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor,constant: 10),
            appearanceSegmentation.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
            appearanceSegmentation.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor,constant: -10),
            appearanceSegmentation.widthAnchor.constraint(equalToConstant: 150),
            appearanceSegmentation.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        NSLayoutConstraint.activate(constraints2)

        let constraints1 = [
            preferenceLabel.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor,constant: 5),
            preferenceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            preferenceLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor,constant: -5),
            preferenceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            preferenceLabel.trailingAnchor.constraint(equalTo: appearanceSegmentation.leadingAnchor)
        ]
        //contentView.bottomAnchor.constraint(equalTo: preferenceLabel.bottomAnchor, constant: 5).isActive = true
        NSLayoutConstraint.activate(constraints1)
        
//        let constraints1 = [
//            preferenceLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
//            preferenceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
//            preferenceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5),
//            //userNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -40)
//        ]
//        NSLayoutConstraint.activate(constraints1)
//
//        let constraints2 = [
//            appearanceSegmentation.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
//            appearanceSegmentation.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
//            appearanceSegmentation.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5),
//            appearanceSegmentation.leadingAnchor.constraint(equalTo: preferenceLabel.trailingAnchor),
//            appearanceSegmentation.widthAnchor.constraint(equalTo: contentView.widthAnchor,multiplier: 0.5)
//        ]
//        NSLayoutConstraint.activate(constraints2)
    }


    
}
