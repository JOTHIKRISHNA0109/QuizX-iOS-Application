//
//  CollectionTableViewCell.swift
//  QuizX
//
//  Created by jothi-pt5112 on 24/06/22.
//

import UIKit

class CustomHomeTableViewCell: UITableViewCell {

    static let identifier:String = "Quiz"
    
    var testImage:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.masksToBounds =  true
        return image
    }()
    
    var imageLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 8
        label.text = NSLocalizedString("completed_label", comment: "sadfds")
        label.layer.borderWidth = 1.5
        label.layer.borderColor = UIColor.label.cgColor
        label.textAlignment = .center
        label.textColor = .label
        label.backgroundColor = .tertiarySystemBackground
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .systemBackground
        contentView.addSubview(testImage)
        setTestImageConstraints()
        testImage.addSubview(imageLabel)
        setImagelabelConstraints()
        contentView.layer.cornerRadius = 40
    }
    
    func testImageConfig(image:UIImage) {
        testImage.image = image
    }
    
    func setTestImageConstraints() {
        let testImageConstraints =
        [testImage.topAnchor.constraint(equalTo: contentView.topAnchor),
         testImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
         testImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
         testImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ]
        
        NSLayoutConstraint.activate(testImageConstraints)
    }
    
    func setImagelabelConstraints() {
        let imageLabelConstraints =
        [imageLabel.topAnchor.constraint(equalTo: testImage.topAnchor,constant: 20),
         imageLabel.trailingAnchor.constraint(equalTo: testImage.trailingAnchor,constant: -20),
         //imageLabel.leadingAnchor.constraint(equalTo: testImage.leadingAnchor)
         imageLabel.heightAnchor.constraint(equalToConstant: 30)
        ]
        
        NSLayoutConstraint.activate(imageLabelConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
