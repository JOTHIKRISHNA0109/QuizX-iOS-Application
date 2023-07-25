//
//  InstrcutionsTableViewCell.swift
//  QuizX
//
//  Created by jothi-pt5112 on 06/07/22.
//

import UIKit

class InstrcutionsTableViewCell: UITableViewCell {

    static let identifier:String = "InstrcutionsTableViewCell"
    
    var instructionLabel1 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .left
        label.text = NSLocalizedString("instruction_1", comment: "")
        return label
    }()
    
    var instructionLabel2 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = NSLocalizedString("instruction_2", comment: "")
        return label
    }()
    
    var instructionLabel3 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = NSLocalizedString("instruction_3", comment: "")
        return label
    }()
    
    var instructionLabel4 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = NSLocalizedString("instruction_4", comment: "")
        return label
    }()
    
    var instructionLabel5 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = NSLocalizedString("instruction_5", comment: "")
        return label
    }()
    
    var instructionLabel6 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = NSLocalizedString("instruction_6", comment: "")
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(instructionLabel1)
        contentView.addSubview(instructionLabel2)
        contentView.addSubview(instructionLabel3)
        contentView.addSubview(instructionLabel4)
        contentView.addSubview(instructionLabel5)
        contentView.addSubview(instructionLabel6)
        addInstructionLabelConstraints()
        contentView.bottomAnchor.constraint(equalTo: instructionLabel6.bottomAnchor,constant: 20).isActive = true
//        let constraint = contentView.heightAnchor.constraint(equalToConstant: 180)
//        constraint.priority = UILayoutPriority(999)
//        constraint.isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addInstructionLabelConstraints() {
        let constraints1 = [
            instructionLabel1.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
            instructionLabel1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
            instructionLabel1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
        ]
        NSLayoutConstraint.activate(constraints1)
        
        let constraints2 = [
            instructionLabel2.topAnchor.constraint(equalTo: instructionLabel1.bottomAnchor,constant: 5),
            instructionLabel2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
            instructionLabel2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
        ]
        NSLayoutConstraint.activate(constraints2)
        
        let constraints3 = [
            instructionLabel3.topAnchor.constraint(equalTo: instructionLabel2.bottomAnchor,constant: 5),
            instructionLabel3.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
            instructionLabel3.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
        ]
        NSLayoutConstraint.activate(constraints3)
        
        let constraints4 = [
            instructionLabel4.topAnchor.constraint(equalTo: instructionLabel3.bottomAnchor,constant: 5),
            instructionLabel4.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
            instructionLabel4.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
        ]
        NSLayoutConstraint.activate(constraints4)
        
        let constraints5 = [
            instructionLabel5.topAnchor.constraint(equalTo: instructionLabel4.bottomAnchor,constant: 5),
            instructionLabel5.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
            instructionLabel5.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
        ]
        NSLayoutConstraint.activate(constraints5)
        
        let constraints6 = [
            instructionLabel6.topAnchor.constraint(equalTo: instructionLabel5.bottomAnchor,constant: 5),
            instructionLabel6.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            instructionLabel6.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
        ]
        NSLayoutConstraint.activate(constraints6)
    }
    

}
