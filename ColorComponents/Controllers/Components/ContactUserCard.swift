//
//  ContactUserCard.swift
//  ColorComponents
//
//  Created by Rafael Oliveira on 17/05/23.
//

import Foundation
import UIKit

class ContactUserCard: UIView {
    let containerView = UIView()
    let userImage = UIImageView()
    let jobStatusLabel = UILabel()
    let contactLabel = UILabel()
    let shareButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ContactUserCard {
    private func setupUI() {
        addSubview(containerView)
        containerView.addSubview(userImage)
        containerView.addSubview(jobStatusLabel)
        containerView.addSubview(contactLabel)
        containerView.addSubview(shareButton)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.cornerRadius = 13
        containerView.clipsToBounds = true
        containerView.layer.shadowColor = UIColor.gray.cgColor
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.layer.shadowRadius = 4
        containerView.layer.masksToBounds = false
        
        userImage.image = UIImage(named: "avatarOne")
        userImage.layer.cornerRadius = 45
        userImage.contentMode = .scaleAspectFit
        userImage.clipsToBounds = true
        userImage.translatesAutoresizingMaskIntoConstraints = false
        
        jobStatusLabel.text = "iOS Developer"
        jobStatusLabel.textAlignment = .center
        jobStatusLabel.font = .systemFont(ofSize: 23, weight: .semibold)
        jobStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        jobStatusLabel.textColor = .black
        jobStatusLabel.layer.cornerRadius = 13
        jobStatusLabel.clipsToBounds = true
        
        contactLabel.text = "Phone: +555 12345678 \nEmail: email@email.com"
        contactLabel.numberOfLines = 2
        contactLabel.translatesAutoresizingMaskIntoConstraints = false
        contactLabel.textColor = .secondaryLabel
        contactLabel.textColor = .white
        
        let imgConfig = UIImage.SymbolConfiguration(weight: .bold)
        let shareImg = UIImage(systemName: "square.and.arrow.up", withConfiguration: imgConfig)
        
        shareButton.setImage( shareImg, for: .normal)
        shareButton.layer.cornerRadius = 24
        shareButton.clipsToBounds = true
        shareButton.tintColor = .black
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.backgroundColor = .gray
        userImage.backgroundColor = .white
        jobStatusLabel.backgroundColor = .white
        shareButton.backgroundColor = .white
        
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 280),
            
            userImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),
            userImage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            userImage.widthAnchor.constraint(equalToConstant: 80),
            userImage.heightAnchor.constraint(equalToConstant: 80),

            jobStatusLabel.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 30),
            jobStatusLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30),
            jobStatusLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30),
            jobStatusLabel.heightAnchor.constraint(equalToConstant: 40),
            
            contactLabel.topAnchor.constraint(equalTo: jobStatusLabel.bottomAnchor, constant: 30),
            contactLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            
            shareButton.centerYAnchor.constraint(equalTo: contactLabel.centerYAnchor),
            shareButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30),
            shareButton.widthAnchor.constraint(equalToConstant: 48),
            shareButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    func changeColor(primaryColor: UIColor? = .systemBackground, secondaryColor: UIColor? = .gray, details: UIColor? = .label) {
        
        containerView.backgroundColor = primaryColor
        userImage.backgroundColor = secondaryColor
        jobStatusLabel.backgroundColor = secondaryColor
        shareButton.backgroundColor = secondaryColor
    }
}
