//
//  ConfirmationHeader.swift
//  QuizX
//
//  Created by jothi-pt5112 on 06/07/22.
//

import UIKit

class ConfirmationHeader: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    let categoryImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    var imageLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = NSLocalizedString("number_of_questions", comment: "")
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.layer.borderWidth = 1.5
        label.textAlignment = .center
        label.textColor = .label
        label.backgroundColor = .secondarySystemBackground
        return label
    }()
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        addSubview(categoryImage)
        setCategoryImageConstraints()
        addSubview(imageLabel)
        setImagelabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        categoryImage.frame = bounds
    }
    
    func configImage(image:UIImage) {
        categoryImage.image = image
    }
    
    func setCategoryImageConstraints() {
        let constraints = [
            categoryImage.topAnchor.constraint(equalTo: topAnchor),
            categoryImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            categoryImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            categoryImage.heightAnchor.constraint(equalToConstant: 100)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    
    func setImagelabelConstraints() {
        let constraints = [
            imageLabel.topAnchor.constraint(equalTo: topAnchor,constant: 150),
            imageLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            //imageLabel.widthAnchor.constraint(equalToConstant: 120),
            //imageLabel.heightAnchor.constraint(equalToConstant: 30)
        ]
        NSLayoutConstraint.activate(constraints)
    }

}
