//
//  HomeViewController.swift
//  ColorComponents
//
//  Created by Rafael Oliveira on 15/05/23.
//

import Foundation
import UIKit

class HomeViewController : UIViewController {
    let ContactCard = ContactUserCard()
    let meetingCard = MeetingCard()
    
    private let floatingButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.3
        button.layer.cornerRadius = 30
        button.backgroundColor = UIColor(named: "greenPrimary")
        button.setImage(UIImage(systemName: "paintpalette", withConfiguration: UIImage.SymbolConfiguration(pointSize: 32, weight: .medium)), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.tintColor = .white
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Components"
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(ContactCard)
        view.addSubview(meetingCard)
        view.addSubview(floatingButton)
        
        view.backgroundColor = UIColor(named: "greenSecondary")
        floatingButton.frame = CGRect(x: view.frame.size.width - 90, y: view.frame.size.height - 90 - view.safeAreaInsets.bottom, width: 60, height: 60)
        
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            ContactCard.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 30),
            ContactCard.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            ContactCard.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            
            meetingCard.topAnchor.constraint(equalTo: ContactCard.bottomAnchor, constant: 30),
            meetingCard.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            meetingCard.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
        ])
    }
}
