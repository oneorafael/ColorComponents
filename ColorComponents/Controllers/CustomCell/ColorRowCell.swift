//
//  ColorRowCell.swift
//  ColorComponents
//
//  Created by Rafael Oliveira on 17/05/23.
//

import Foundation
import UIKit

class ColorRowCell:UITableViewCell {
    let colorCircle = UIView()
    let colorTitle = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureRow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureRow() {
        addSubview(colorCircle)
        addSubview(colorTitle)
        
        colorCircle.translatesAutoresizingMaskIntoConstraints = false
        colorCircle.layer.cornerRadius = 25
        colorCircle.clipsToBounds = true
        
        colorTitle.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = contentView.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            colorCircle.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            colorCircle.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            colorCircle.heightAnchor.constraint(equalToConstant: 50),
            colorCircle.widthAnchor.constraint(equalToConstant: 50),
            colorTitle.centerYAnchor.constraint(equalTo: colorCircle.centerYAnchor),
            colorTitle.leadingAnchor.constraint(equalTo: colorCircle.trailingAnchor, constant: 15)
            
        ])
    }
}
