//
//  ColorSelectionViewController.swift
//  ColorComponents
//
//  Created by Rafael Oliveira on 17/05/23.
//

import Foundation
import UIKit

protocol ColorSelectorDelegate {
    func didSelectedBackgroundColor(primaryColor: UIColor, secundaryColor:UIColor, detailsColor:UIColor)
}

class ColorSelectionViewController: UIViewController {
    var delegate: ColorSelectorDelegate?
    let userDefaults = UserDefaults.standard
    let THEME_KEY = "themeKey"
    let GREEN_THEME = "greenTheme"
    let ORANGE_THEME = "orangeTheme"
    let PINK_THEME = "pinkTheme"

    let stack = UIStackView()
    var rows = [ColorRowCell]()
    let table = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Selector"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        view.addSubview(table)
        
        table.dataSource = self
        table.delegate  = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: self.view.topAnchor),
            table.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        let color = ColorRowCell()
        color.colorCircle.backgroundColor = .green
        color.colorTitle.text = "green"
        let color2 = ColorRowCell()
        color2.colorCircle.backgroundColor = .systemPink
        color2.colorTitle.text = "pink"
        let color3 = ColorRowCell()
        color3.colorCircle.backgroundColor = .orange
        color3.colorTitle.text = "orange"
        rows.append(color)
        rows.append(color2)
        rows.append(color3)
    }
    
    func updateTheme() {
        let theme = userDefaults.string(forKey: THEME_KEY)
        if(theme == GREEN_THEME) {
            delegate?.didSelectedBackgroundColor(primaryColor: UIColor(named: "greenPrimary")!, secundaryColor: UIColor(named: "greenSecondary")!, detailsColor: .black)
        }
        if(theme == ORANGE_THEME) {
            delegate?.didSelectedBackgroundColor(primaryColor: UIColor(named: "orangePrimary")!, secundaryColor: UIColor(named: "orangeSecondary")!, detailsColor: .black)
        }
        if(theme == PINK_THEME) {
            delegate?.didSelectedBackgroundColor(primaryColor: UIColor(named: "pinkPrimary")!, secundaryColor: UIColor(named: "pinkSecondary")!, detailsColor: .white)
        }
    }
}

// MARK: - TableDataSource & TableDelegate
extension ColorSelectionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = rows[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellSelected = rows[indexPath.row]
        cellSelected.accessoryType = .checkmark
        
        switch cellSelected.colorTitle.text {
        case "green":
            userDefaults.set(GREEN_THEME, forKey: THEME_KEY)
            dismiss(animated: true)
        case "orange":
            userDefaults.set(ORANGE_THEME, forKey: THEME_KEY)
            dismiss(animated: true)
        case "pink":
            userDefaults.set(PINK_THEME, forKey: THEME_KEY)
            dismiss(animated: true)
        default: break;
        }
        updateTheme()
    }
}
