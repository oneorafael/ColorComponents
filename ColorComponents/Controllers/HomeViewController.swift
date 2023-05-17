//
//  HomeViewController.swift
//  ColorComponents
//
//  Created by Rafael Oliveira on 15/05/23.
//

import Foundation
import UIKit

protocol changeColorDelegate {
    func updateColor()
}
class HomeViewController : UIViewController, ColorSelectorDelegate {

    
    let ContactCard = ContactUserCard()
    let meetingCard = MeetingCard()
    
    private let floatingButton: UIButton = {
        let button = UIButton()
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.3
        button.layer.cornerRadius = 35
        button.setImage(UIImage(systemName: "paintpalette", withConfiguration: UIImage.SymbolConfiguration(pointSize: 35, weight: .medium)), for: .normal)
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
        
        floatingButton.frame = CGRect(x: view.frame.size.width - 90, y: view.frame.size.height - 90 - view.safeAreaInsets.bottom, width: 70, height: 70)
        
        floatingButton.addTarget(self, action: #selector(changeColorButtonPressed), for: .touchUpInside)
        floatingButton.backgroundColor = .gray

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
    
    @objc private func changeColorButtonPressed() {
        let colorVC = ColorSelectionViewController()
        let NVC = UINavigationController(rootViewController: colorVC)
        if let sheet = NVC.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        colorVC.delegate = self
        self.present(NVC, animated: true)
    }
    
    func didSelectedBackgroundColor(primaryColor: UIColor, secundaryColor: UIColor, detailsColor: UIColor) {
        self.view.backgroundColor = secundaryColor
        ContactCard.changeColor(primaryColor: primaryColor, secondaryColor: secundaryColor)
        meetingCard.changeColor(primaryColor: primaryColor, secondaryColor: secundaryColor, details: detailsColor)
        floatingButton.backgroundColor = primaryColor
        view.backgroundColor = secundaryColor
    }
    
}
