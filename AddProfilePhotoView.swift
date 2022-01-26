//
//  AddProfilePhotoView.swift
//  Profile
//
//  Created by Алексей Лосев on 26.01.2022.
//

import UIKit
 

class AddProfilePhotoView: UIView {
    
    var circleImageView: UIImageView = {
        
    let imageView = UIImageView()
        
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.clipsToBounds = true
    imageView.layer.borderColor = UIColor.black.cgColor
    imageView.layer.borderWidth = 1
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(circleImageView)
        setupContraints ()
    }
    
    private func setupContraints () {
        NSLayoutConstraint.activate([
            circleImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: -100),
            circleImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -190),
            circleImageView.widthAnchor.constraint(equalToConstant: 150),
            circleImageView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        self.bottomAnchor.constraint(equalTo: circleImageView.bottomAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        circleImageView.layer.masksToBounds = true
        circleImageView.layer.cornerRadius = circleImageView.frame.width / 2
    }
}


