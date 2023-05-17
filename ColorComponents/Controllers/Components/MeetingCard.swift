//
//  MeetingCard.swift
//  ColorComponents
//
//  Created by Rafael Oliveira on 17/05/23.
//

import Foundation
import UIKit

class MeetingCard: UIView {
    let containerView = UIView()
    let notificationIcon = UIImageView()
    let meetingLabel = UILabel()
    let descriptionLabel = UILabel()
    let enterButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubview(containerView)
        containerView.addSubview(notificationIcon)
        containerView.addSubview(meetingLabel)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(enterButton)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.backgroundColor = UIColor(named: "greenPrimary")
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.cornerRadius = 13
        containerView.clipsToBounds = true
        containerView.layer.shadowColor = UIColor.gray.cgColor
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.layer.shadowRadius = 4
        containerView.layer.masksToBounds = false
        
        notificationIcon.image = UIImage(systemName: "video.fill")
        notificationIcon.backgroundColor = UIColor(named: "greenSecondary")
        notificationIcon.tintColor = UIColor(named: "greenPrimary")
        notificationIcon.layer.cornerRadius = 25
        notificationIcon.contentMode = .scaleAspectFit
        notificationIcon.clipsToBounds = true
        notificationIcon.translatesAutoresizingMaskIntoConstraints = false
        
        meetingLabel.text = "Sua próxima reunão"
        meetingLabel.font = .systemFont(ofSize: 23, weight: .bold)
        meetingLabel.textColor = .white
        meetingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.text = "começa em: 6 minutos"
        descriptionLabel.textColor = .white
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.textAlignment = .center
        
        enterButton.setTitle("Entrar", for: .normal)
        enterButton.backgroundColor = UIColor(named: "greenSecondary")
        enterButton.setTitleColor(.black, for: .normal)
        enterButton.layer.cornerRadius = 13
        enterButton.clipsToBounds = true
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 160),
            
            notificationIcon.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            notificationIcon.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            notificationIcon.widthAnchor.constraint(equalToConstant: 50),
            notificationIcon.heightAnchor.constraint(equalToConstant: 50),
            
            meetingLabel.centerYAnchor.constraint(equalTo: notificationIcon.centerYAnchor),
            meetingLabel.leadingAnchor.constraint(equalTo: notificationIcon.trailingAnchor, constant: 10),
            
            descriptionLabel.topAnchor.constraint(equalTo: notificationIcon.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            enterButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            enterButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 32),
            enterButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -32),
            enterButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
