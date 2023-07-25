//
//  RegisterTableViewCell.swift
//  QuizX
//
//  Created by jothi-pt5112 on 28/07/22.
//

import UIKit

class RegisterTableViewCell: UITableViewCell {

    static let identifier = "RegisterTableViewCell"
    
    let textField : UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.layer.cornerRadius = 10
        field.layer.borderColor = UIColor.lightGray.withAlphaComponent(1).cgColor
        field.layer.borderWidth = 1
        return field
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(textField)
        createTextfieldSpace()
        setTextFieldConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createTextfieldSpace() {
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
    }
    
    func setTextFieldConstraints() {
        let constraints1 = [
            textField.topAnchor.constraint(equalTo: contentView.topAnchor),
            textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints1)
    }
    
}

