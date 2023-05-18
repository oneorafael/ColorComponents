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
    let contactCard = ContactUserCard()
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
        navigationController?.navigationBar.prefersLargeTitles = true
        setupUI()
        loadSavedTheme()
    }
    
    private func setupUI() {
        view.addSubview(contactCard)
        view.addSubview(meetingCard)
        view.addSubview(floatingButton)
        
        floatingButton.frame = CGRect(x: view.frame.size.width - 90, y: view.frame.size.height - 90 - view.safeAreaInsets.bottom, width: 70, height: 70)
        
        floatingButton.addTarget(self, action: #selector(changeColorButtonPressed), for: .touchUpInside)
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            contactCard.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 30),
            contactCard.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            contactCard.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            
            meetingCard.topAnchor.constraint(equalTo: contactCard.bottomAnchor, constant: 30),
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
        contactCard.changeColor(primaryColor: primaryColor, secondaryColor: secundaryColor)
        meetingCard.changeColor(primaryColor: primaryColor, secondaryColor: secundaryColor, details: detailsColor)
        floatingButton.backgroundColor = primaryColor
        view.backgroundColor = secundaryColor


    }
    
    private func loadSavedTheme() {
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: "themeKey") == nil {
            contactCard.containerView.backgroundColor = .gray
            contactCard.userImage.backgroundColor = .white
            contactCard.jobStatusLabel.backgroundColor = .white
            contactCard.shareButton.backgroundColor = .white
            
            meetingCard.containerView.backgroundColor = .gray
            meetingCard.notificationIcon.backgroundColor = .white
            meetingCard.enterButton.backgroundColor = .white
            meetingCard.enterButton.setTitleColor(.gray, for: .normal)
            floatingButton.backgroundColor = .gray
        } else {
            let theme = userDefaults.object(forKey: "themeKey")
            if(theme as! String == "greenTheme") {
                contactCard.changeColor(primaryColor: UIColor(named: "greenPrimary")!, secondaryColor: UIColor(named: "greenSecondary")!)
                meetingCard.changeColor(primaryColor: UIColor(named: "greenPrimary")!, secondaryColor: UIColor(named: "greenSecondary")!)
                self.view.backgroundColor = UIColor(named:"greenSecondary")
                floatingButton.backgroundColor = UIColor(named: "greenPrimary")
                
            }
            if(theme as! String == "orangeTheme") {
                contactCard.changeColor(primaryColor: UIColor(named: "orangePrimary")!, secondaryColor: UIColor(named: "orangeSecondary")!)
                meetingCard.changeColor(primaryColor: UIColor(named: "orangePrimary")!, secondaryColor: UIColor(named: "orangeSecondary")!)
                self.view.backgroundColor = UIColor(named:"orangeSecondary")
                floatingButton.backgroundColor = UIColor(named: "orangePrimary")
                
            }
            if(theme as! String == "pinkTheme") {
                contactCard.changeColor(primaryColor: UIColor(named: "pinkPrimary")!, secondaryColor: UIColor(named: "pinkSecondary")!, details: .white)
                meetingCard.changeColor(primaryColor: UIColor(named: "pinkPrimary")!, secondaryColor: UIColor(named: "pinkSecondary")!, details: .white)
                self.view.backgroundColor = UIColor(named:"pinkSecondary")
                floatingButton.backgroundColor = UIColor(named: "pinkPrimary")
                }
        }
    }
}
